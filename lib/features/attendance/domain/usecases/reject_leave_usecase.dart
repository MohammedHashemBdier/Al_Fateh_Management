import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../params/reject_leave_params.dart';
import '../repositories/attendance_repository.dart';

class RejectLeaveUseCase implements BaseUseCase<void, RejectLeaveParams> {
  final AttendanceRepository _repository;

  const RejectLeaveUseCase(this._repository);

  @override
  Future<Result<void>> call(RejectLeaveParams params) {
    return _repository.rejectLeave(params);
  }
}
