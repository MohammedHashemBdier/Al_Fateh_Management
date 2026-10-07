import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/leave_request.dart';
import '../params/submit_leave_params.dart';
import '../repositories/attendance_repository.dart';

class SubmitLeaveUseCase
    implements BaseUseCase<LeaveRequest, SubmitLeaveParams> {
  final AttendanceRepository _repository;

  const SubmitLeaveUseCase(this._repository);

  @override
  Future<Result<LeaveRequest>> call(SubmitLeaveParams params) {
    return _repository.submitLeave(params);
  }
}
