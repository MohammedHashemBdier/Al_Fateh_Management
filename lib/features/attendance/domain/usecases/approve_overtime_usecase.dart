import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../params/approve_overtime_params.dart';
import '../repositories/attendance_repository.dart';

class ApproveOvertimeUseCase
    implements BaseUseCase<void, ApproveOvertimeParams> {
  final AttendanceRepository _repository;

  const ApproveOvertimeUseCase(this._repository);

  @override
  Future<Result<void>> call(ApproveOvertimeParams params) {
    return _repository.approveOvertime(params);
  }
}
