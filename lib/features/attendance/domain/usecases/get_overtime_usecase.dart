import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/overtime_record.dart';
import '../params/get_overtime_params.dart';
import '../repositories/attendance_repository.dart';

class GetOvertimeUseCase
    implements BaseUseCase<List<OvertimeRecord>, GetOvertimeParams> {
  final AttendanceRepository _repository;

  const GetOvertimeUseCase(this._repository);

  @override
  Future<Result<List<OvertimeRecord>>> call(GetOvertimeParams params) {
    return _repository.getOvertime(userId: params.userId);
  }
}
