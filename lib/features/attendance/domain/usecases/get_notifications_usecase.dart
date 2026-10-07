import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/app_notification.dart';
import '../params/get_notifications_params.dart';
import '../repositories/attendance_repository.dart';

class GetNotificationsUseCase
    implements BaseUseCase<List<AppNotification>, GetNotificationsParams> {
  final AttendanceRepository _repository;

  const GetNotificationsUseCase(this._repository);

  @override
  Future<Result<List<AppNotification>>> call(GetNotificationsParams params) {
    return _repository.getNotifications(
      userId: params.userId,
      unreadOnly: params.unreadOnly,
    );
  }
}
