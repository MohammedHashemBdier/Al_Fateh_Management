import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../../../core/localization/attendance_error_mapper.dart';
import '../../domain/params/get_notifications_params.dart';
import '../../domain/params/mark_notification_read_params.dart';
import '../../domain/usecases/get_notifications_usecase.dart';
import '../../domain/usecases/mark_notification_read_usecase.dart';
import 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final MarkNotificationReadUseCase _markNotificationReadUseCase;

  Timer? _pollingTimer;

  NotificationsCubit({
    required this._getNotificationsUseCase,
    required this._markNotificationReadUseCase,
  }) : super(const NotificationsState());

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }

  /// تحميل الإشعارات
  Future<void> loadNotifications({
    String? userId,
    bool unreadOnly = false,
  }) async {
    emit(state.copyWith(status: UIStatus.loading, errorMessage: null));

    try {
      final res = await _getNotificationsUseCase(
        GetNotificationsParams(userId: userId, unreadOnly: unreadOnly),
      );

      res.when(
        success: (list) {
          if (isClosed) return;
          final unread = list.where((n) => !n.isRead).length;
          emit(
            state.copyWith(
              status: list.isEmpty ? UIStatus.empty : UIStatus.loaded,
              notifications: list,
              unreadCount: unread,
              errorMessage: null,
            ),
          );
        },
        failure: (f) {
          if (isClosed) return;
          emit(
            state.copyWith(
              status: UIStatus.error,
              errorMessage: AttendanceErrorMapper.mapFailure(f),
            ),
          );
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          status: UIStatus.error,
          errorMessage: AttendanceErrorMapper.mapException(e),
        ),
      );
    }
  }

  /// تحديد إشعار كمقروء
  Future<void> markAsRead({required String notificationId}) async {
    try {
      await _markNotificationReadUseCase(
        MarkNotificationReadParams(notificationId: notificationId),
      );

      final updated = state.notifications.map((n) {
        return n.id == notificationId ? n.copyWith(isRead: true) : n;
      }).toList();

      final unread = updated.where((n) => !n.isRead).length;

      if (!isClosed) {
        emit(state.copyWith(notifications: updated, unreadCount: unread));
      }
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(errorMessage: AttendanceErrorMapper.mapException(e)),
        );
      }
    }
  }

  /// تحديد جميع الإشعارات كمقروءة
  Future<void> markAllAsRead() async {
    for (final n in state.notifications.where((n) => !n.isRead)) {
      markAsRead(notificationId: n.id);
    }
  }

  /// مراقبة وتحديث عداد الإشعارات غير المقروءة دورياً كل دقيقة
  void watchUnreadCount({String? userId}) {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (!isClosed) {
        loadNotifications(userId: userId, unreadOnly: false);
      }
    });
  }
}
