import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/today_status.dart';
import '../params/get_today_status_params.dart';
import '../repositories/attendance_repository.dart';

class GetTodayStatusUseCase
    implements BaseUseCase<TodayStatus, GetTodayStatusParams> {
  final AttendanceRepository _repository;

  const GetTodayStatusUseCase(this._repository);

  @override
  Future<Result<TodayStatus>> call(GetTodayStatusParams params) {
    return _repository.getTodayStatus(userId: params.userId);
  }
}
