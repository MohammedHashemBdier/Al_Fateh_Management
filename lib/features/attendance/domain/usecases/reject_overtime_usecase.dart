import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../params/reject_overtime_params.dart';
import '../repositories/attendance_repository.dart';

class RejectOvertimeUseCase implements BaseUseCase<void, RejectOvertimeParams> {
  final AttendanceRepository _repository;

  const RejectOvertimeUseCase(this._repository);

  @override
  Future<Result<void>> call(RejectOvertimeParams params) {
    return _repository.rejectOvertime(params);
  }
}
