import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/contracts/result.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/enums/attendance_enums.dart';
import '../../domain/params/check_in_params.dart';
import '../../domain/params/check_out_params.dart';
import '../../domain/params/request_correction_params.dart';
import '../../domain/params/approve_correction_params.dart';
import '../../domain/params/reject_correction_params.dart';
import '../../domain/params/add_overtime_params.dart';
import '../../domain/params/approve_overtime_params.dart';
import '../../domain/params/reject_overtime_params.dart';
import '../../domain/params/submit_leave_params.dart';
import '../../domain/params/approve_leave_params.dart';
import '../../domain/params/reject_leave_params.dart';
import '../../domain/params/add_deduction_params.dart';
import '../../domain/repositories/attendance_repository.dart';
import '../datasources/attendance_local_data_source.dart';
import '../datasources/attendance_remote_data_source.dart';
import '../models/attendance_models.dart';

@LazySingleton(as: AttendanceRepository)
class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSource _remoteDataSource;
  final AttendanceLocalDataSource _localDataSource;
  static const Uuid _uuid = Uuid();

  AttendanceRepositoryImpl(this._remoteDataSource, this._localDataSource);

  Failure _mapExceptionToFailure(Object e) {
    if (e is NetworkException || e is TimeoutException) {
      return const NetworkFailure();
    } else if (e is ValidationException) {
      return ValidationFailure(e.message, e.code);
    } else if (e is ServerException) {
      return ServerFailure(e.message, e.code, e.details);
    } else if (e is AuthFailure) {
      return const AuthFailure();
    }
    return UnknownFailure(e.toString());
  }

  @override
  Future<Result<AttendanceRecord>> checkIn(CheckInParams params) async {
    try {
      final remoteRecord = await _remoteDataSource.checkIn(params);
      await _localDataSource.cacheRecord(remoteRecord);
      return Result.success(remoteRecord);
    } catch (e) {
      // Offline fallback: Queue operation locally
      final localRecord = AttendanceRecord(
        id: 'OFFLINE-${_uuid.v4()}',
        userId: params.userId,
        date: DateTime.now().toIso8601String().substring(0, 10),
        checkInTime: DateTime.now().toIso8601String().substring(11, 19),
        checkInLat: params.lat,
        checkInLng: params.lng,
        checkInSiteId: params.siteId,
        accuracy: params.accuracy,
        mockLocationDetected: params.isMock,
        deviceId: params.deviceId,
        syncStatus: SyncStatus.pending,
      );

      await _localDataSource.cacheRecord(localRecord);
      await _localDataSource.queueOperation(
        PendingOperation(
          id: _uuid.v4(),
          type: 'checkIn',
          payload: params.toJson(),
          createdAt: DateTime.now(),
        ),
      );

      return Result.success(localRecord);
    }
  }

  @override
  Future<Result<AttendanceRecord>> checkOut(CheckOutParams params) async {
    try {
      final remoteRecord = await _remoteDataSource.checkOut(params);
      await _localDataSource.cacheRecord(remoteRecord);
      return Result.success(remoteRecord);
    } catch (e) {
      // Offline fallback
      final cached = await _localDataSource.getCachedTodayRecord(
        userId: params.userId,
      );
      final updated =
          (cached ??
                  AttendanceRecord(
                    id: 'OFFLINE-${_uuid.v4()}',
                    userId: params.userId,
                    date: DateTime.now().toIso8601String().substring(0, 10),
                  ))
              .copyWith(
                checkOutTime: DateTime.now().toIso8601String().substring(
                  11,
                  19,
                ),
                checkOutLat: params.lat,
                checkOutLng: params.lng,
                checkOutSiteId: params.siteId,
                syncStatus: SyncStatus.pending,
              );

      await _localDataSource.cacheRecord(updated);
      await _localDataSource.queueOperation(
        PendingOperation(
          id: _uuid.v4(),
          type: 'checkOut',
          payload: params.toJson(),
          createdAt: DateTime.now(),
        ),
      );

      return Result.success(updated);
    }
  }

  @override
  Future<Result<TodayStatus>> getTodayStatus({required String userId}) async {
    try {
      final remoteStatus = await _remoteDataSource.getTodayStatus(
        userId: userId,
      );
      if (remoteStatus.record != null) {
        await _localDataSource.cacheRecord(remoteStatus.record!);
      }
      return Result.success(remoteStatus);
    } catch (e) {
      // Read from local cache
      final localRecord = await _localDataSource.getCachedTodayRecord(
        userId: userId,
      );
      final todayStatus = TodayStatus(
        hasCheckedIn: localRecord?.checkInTime != null,
        hasCheckedOut: localRecord?.checkOutTime != null,
        status: localRecord?.status ?? AttendanceStatus.absent,
        checkInTime: localRecord?.checkInTime,
        checkOutTime: localRecord?.checkOutTime,
        record: localRecord,
      );
      return Result.success(todayStatus);
    }
  }

  @override
  Future<Result<List<AttendanceRecord>>> getRecords({
    String? userId,
    String? month,
    String? date,
    int? limit,
  }) async {
    try {
      final remoteRecords = await _remoteDataSource.getRecords(
        userId: userId,
        month: month,
        date: date,
        limit: limit,
      );
      await _localDataSource.cacheRecords(remoteRecords);
      return Result.success(remoteRecords);
    } catch (e) {
      final cached = await _localDataSource.getCachedRecords();
      if (cached.isNotEmpty) {
        var filtered = cached;
        if (userId != null) {
          filtered = filtered.where((r) => r.userId == userId).toList();
        }
        if (date != null) {
          filtered = filtered.where((r) => r.date == date).toList();
        }
        return Result.success(filtered);
      }
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<AttendanceRecord>> getRecordById({
    required String recordId,
  }) async {
    try {
      final remote = await _remoteDataSource.getRecordById(recordId: recordId);
      return Result.success(remote);
    } catch (e) {
      final cached = await _localDataSource.getCachedRecords();
      try {
        final match = cached.firstWhere((r) => r.id == recordId);
        return Result.success(match);
      } catch (_) {
        return Result.failure(_mapExceptionToFailure(e));
      }
    }
  }

  @override
  Future<Result<List<Shift>>> getShifts() async {
    try {
      final remoteShifts = await _remoteDataSource.getShifts();
      await _localDataSource.cacheShifts(remoteShifts);
      return Result.success(remoteShifts);
    } catch (e) {
      final cached = await _localDataSource.getCachedShifts();
      if (cached.isNotEmpty) {
        return Result.success(cached);
      }
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<List<SiteGeofence>>> getSites() async {
    try {
      final remoteSites = await _remoteDataSource.getSites();
      await _localDataSource.cacheSites(remoteSites);
      return Result.success(remoteSites);
    } catch (e) {
      final cached = await _localDataSource.getCachedSites();
      if (cached.isNotEmpty) {
        return Result.success(cached);
      }
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<AttendanceSettings>> getSettings() async {
    try {
      final remoteSettings = await _remoteDataSource.getSettings();
      await _localDataSource.cacheSettings(remoteSettings);
      return Result.success(remoteSettings);
    } catch (e) {
      final cached = await _localDataSource.getCachedSettings();
      if (cached != null) {
        return Result.success(cached);
      }
      return const Result.success(AttendanceSettings());
    }
  }

  @override
  Future<Result<CorrectionRequest>> requestCorrection(
    RequestCorrectionParams params,
  ) async {
    try {
      final result = await _remoteDataSource.requestCorrection(params);
      return Result.success(result);
    } catch (e) {
      await _localDataSource.queueOperation(
        PendingOperation(
          id: _uuid.v4(),
          type: 'requestCorrection',
          payload: params.toJson(),
          createdAt: DateTime.now(),
        ),
      );
      final dummy = CorrectionRequest(
        requestId: 'OFFLINE-${_uuid.v4()}',
        attendanceId: params.attendanceId,
        userId: params.userId,
        targetDate: params.targetDate,
        correctedCheckIn: params.correctedCheckIn,
        correctedCheckOut: params.correctedCheckOut,
        reason: params.reason,
      );
      return Result.success(dummy);
    }
  }

  @override
  Future<Result<List<CorrectionRequest>>> getCorrections({
    String? userId,
  }) async {
    try {
      final remote = await _remoteDataSource.getCorrections(userId: userId);
      return Result.success(remote);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<void>> approveCorrection(ApproveCorrectionParams params) async {
    try {
      await _remoteDataSource.approveCorrection(params);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<void>> rejectCorrection(RejectCorrectionParams params) async {
    try {
      await _remoteDataSource.rejectCorrection(params);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<List<OvertimeRecord>>> getOvertime({String? userId}) async {
    try {
      final remote = await _remoteDataSource.getOvertime(userId: userId);
      return Result.success(remote);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<OvertimeRecord>> addOvertime(AddOvertimeParams params) async {
    try {
      final remote = await _remoteDataSource.addOvertime(params);
      return Result.success(remote);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<void>> approveOvertime(ApproveOvertimeParams params) async {
    try {
      await _remoteDataSource.approveOvertime(params);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<void>> rejectOvertime(RejectOvertimeParams params) async {
    try {
      await _remoteDataSource.rejectOvertime(params);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<List<LeaveRequest>>> getLeaves({String? userId}) async {
    try {
      final remote = await _remoteDataSource.getLeaves(userId: userId);
      return Result.success(remote);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<LeaveRequest>> submitLeave(SubmitLeaveParams params) async {
    try {
      final remote = await _remoteDataSource.submitLeave(params);
      return Result.success(remote);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<void>> approveLeave(ApproveLeaveParams params) async {
    try {
      await _remoteDataSource.approveLeave(params);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<void>> rejectLeave(RejectLeaveParams params) async {
    try {
      await _remoteDataSource.rejectLeave(params);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<List<Deduction>>> getDeductions({String? userId}) async {
    try {
      final remote = await _remoteDataSource.getDeductions(userId: userId);
      return Result.success(remote);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<Deduction>> addDeduction(AddDeductionParams params) async {
    try {
      final remote = await _remoteDataSource.addDeduction(params);
      return Result.success(remote);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<List<AppNotification>>> getNotifications({
    String? userId,
    bool unreadOnly = false,
  }) async {
    try {
      final remote = await _remoteDataSource.getNotifications(
        userId: userId,
        unreadOnly: unreadOnly,
      );
      await _localDataSource.cacheNotifications(remote);
      return Result.success(remote);
    } catch (e) {
      final cached = await _localDataSource.getCachedNotifications();
      return Result.success(cached);
    }
  }

  @override
  Future<Result<void>> markNotificationRead({
    required String notificationId,
  }) async {
    try {
      await _remoteDataSource.markNotificationRead(
        notificationId: notificationId,
      );
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<void>> syncPendingOperations() async {
    final pendingOps = await _localDataSource.getPendingOperations();
    for (final op in pendingOps) {
      try {
        if (op.type == 'checkIn') {
          await _remoteDataSource.checkIn(CheckInParams.fromJson(op.payload));
        } else if (op.type == 'checkOut') {
          await _remoteDataSource.checkOut(CheckOutParams.fromJson(op.payload));
        } else if (op.type == 'requestCorrection') {
          await _remoteDataSource.requestCorrection(
            RequestCorrectionParams.fromJson(op.payload),
          );
        }
        await _localDataSource.removeOperation(op.id);
      } catch (e) {
        await _localDataSource.updateOperation(
          op.id,
          op.copyWith(retryCount: op.retryCount + 1, lastError: e.toString()),
        );
      }
    }
    return const Result.success(null);
  }

  @override
  Future<int> getPendingOperationsCount() {
    return _localDataSource.getPendingOperationsCount();
  }

  @override
  Future<Result<Shift>> addShift(Shift shift) async {
    try {
      final res = await _remoteDataSource.addShift(shift);
      return Result.success(res);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<Shift>> updateShift(Shift shift) async {
    try {
      final res = await _remoteDataSource.updateShift(shift);
      return Result.success(res);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<void>> deleteShift(String shiftId) async {
    try {
      await _remoteDataSource.deleteShift(shiftId);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Result<List<AuditLogEntry>>> getAuditLogs({String? recordId}) async {
    try {
      final res = await _remoteDataSource.getAuditLogs(recordId: recordId);
      return Result.success(res);
    } catch (e) {
      return Result.failure(_mapExceptionToFailure(e));
    }
  }
}
