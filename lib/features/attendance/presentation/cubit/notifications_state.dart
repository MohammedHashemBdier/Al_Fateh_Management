import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../domain/models/app_notification.dart';

part 'notifications_state.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(UIStatus.initial) UIStatus status,
    @Default([]) List<AppNotification> notifications,
    @Default(0) int unreadCount,
    String? errorMessage,
  }) = _NotificationsState;
}
