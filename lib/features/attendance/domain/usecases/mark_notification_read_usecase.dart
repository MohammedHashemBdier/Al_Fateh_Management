import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../params/mark_notification_read_params.dart';
import '../repositories/attendance_repository.dart';

class MarkNotificationReadUseCase
    implements BaseUseCase<void, MarkNotificationReadParams> {
  final AttendanceRepository _repository;

  const MarkNotificationReadUseCase(this._repository);

  @override
  Future<Result<void>> call(MarkNotificationReadParams params) {
    return _repository.markNotificationRead(
      notificationId: params.notificationId,
    );
  }
}
