import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/overtime_record.dart';
import '../params/add_overtime_params.dart';
import '../repositories/attendance_repository.dart';

class AddOvertimeUseCase
    implements BaseUseCase<OvertimeRecord, AddOvertimeParams> {
  final AttendanceRepository _repository;

  const AddOvertimeUseCase(this._repository);

  @override
  Future<Result<OvertimeRecord>> call(AddOvertimeParams params) {
    return _repository.addOvertime(params);
  }
}
