import 'package:freezed_annotation/freezed_annotation.dart';

part 'mark_notification_read_params.freezed.dart';
part 'mark_notification_read_params.g.dart';

@freezed
abstract class MarkNotificationReadParams with _$MarkNotificationReadParams {
  const factory MarkNotificationReadParams({
    @JsonKey(name: 'notification_id') required String notificationId,
  }) = _MarkNotificationReadParams;

  factory MarkNotificationReadParams.fromJson(Map<String, dynamic> json) =>
      _$MarkNotificationReadParamsFromJson(json);
}
