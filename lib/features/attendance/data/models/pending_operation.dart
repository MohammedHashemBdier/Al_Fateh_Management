import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_operation.freezed.dart';
part 'pending_operation.g.dart';

/// تمثيل العملية المعلقة في طابور المزامنة المحلي (Offline Queue)
@freezed
abstract class PendingOperation with _$PendingOperation {
  const factory PendingOperation({
    required String id,
    required String type,
    required Map<String, dynamic> payload,
    required DateTime createdAt,
    @Default(0) int retryCount,
    String? lastError,
  }) = _PendingOperation;

  factory PendingOperation.fromJson(Map<String, dynamic> json) =>
      _$PendingOperationFromJson(json);
}
