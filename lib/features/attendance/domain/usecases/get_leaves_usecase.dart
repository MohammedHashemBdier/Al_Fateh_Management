import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/leave_request.dart';
import '../params/get_leaves_params.dart';
import '../repositories/attendance_repository.dart';

class GetLeavesUseCase
    implements BaseUseCase<List<LeaveRequest>, GetLeavesParams> {
  final AttendanceRepository _repository;

  const GetLeavesUseCase(this._repository);

  @override
  Future<Result<List<LeaveRequest>>> call(GetLeavesParams params) {
    return _repository.getLeaves(userId: params.userId);
  }
}
