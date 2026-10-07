import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../params/approve_leave_params.dart';
import '../repositories/attendance_repository.dart';

class ApproveLeaveUseCase implements BaseUseCase<void, ApproveLeaveParams> {
  final AttendanceRepository _repository;

  const ApproveLeaveUseCase(this._repository);

  @override
  Future<Result<void>> call(ApproveLeaveParams params) {
    return _repository.approveLeave(params);
  }
}
