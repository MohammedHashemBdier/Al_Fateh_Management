import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../features/attendance/domain/repositories/attendance_repository.dart';
import '../connectivity/i_connectivity_service.dart';
import 'i_sync_service.dart';

@LazySingleton(as: ISyncService)
class AppSyncService implements ISyncService {
  final AttendanceRepository _repository;
  final IConnectivityService _connectivityService;

  final _syncStatusController = StreamController<SyncStatusEvent>.broadcast();
  Timer? _periodicTimer;
  StreamSubscription<ConnectionStatus>? _connectivitySub;
  bool _isSyncing = false;

  AppSyncService(this._repository, this._connectivityService);

  @override
  Stream<SyncStatusEvent> get syncStatusStream => _syncStatusController.stream;

  @override
  Future<int> getPendingCount() {
    return _repository.getPendingOperationsCount();
  }

  @override
  Future<void> syncPendingOperations() async {
    if (_isSyncing) return;
    final isOnline = await _connectivityService.isOnline;
    if (!isOnline) return;

    final initialCount = await getPendingCount();
    if (initialCount == 0) return;

    _isSyncing = true;
    _syncStatusController.add(
      SyncStatusEvent(
        state: SyncState.syncing,
        pendingCount: initialCount,
        message: 'جاري مزامنة العمليات المعلقة ($initialCount)...',
      ),
    );

    try {
      await _repository.syncPendingOperations();
      final remaining = await getPendingCount();
      _syncStatusController.add(
        SyncStatusEvent(
          state: remaining == 0 ? SyncState.completed : SyncState.failed,
          pendingCount: remaining,
          message: remaining == 0
              ? 'اكتملت المزامنة بنجاح'
              : 'تبقت $remaining عمليات بحاجة للمزامنة',
        ),
      );
    } catch (e) {
      final remaining = await getPendingCount();
      _syncStatusController.add(
        SyncStatusEvent(
          state: SyncState.failed,
          pendingCount: remaining,
          message: 'تعثرت المزامنة: $e',
        ),
      );
    } finally {
      _isSyncing = false;
    }
  }

  @override
  void startAutoSync() {
    stopAutoSync();

    // مزامنة فورية عند عودة الاتصال بالإنترنت
    _connectivitySub = _connectivityService.statusStream.listen((status) {
      if (status == ConnectionStatus.online) {
        syncPendingOperations();
      }
    });

    // مزامنة دورية كل 5 دقائق
    _periodicTimer = Timer.periodic(const Duration(minutes: 5), (_) {
      syncPendingOperations();
    });
  }

  @override
  void stopAutoSync() {
    _periodicTimer?.cancel();
    _periodicTimer = null;
    _connectivitySub?.cancel();
    _connectivitySub = null;
  }
}
