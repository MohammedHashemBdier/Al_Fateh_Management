import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/shift.dart';
import '../repositories/attendance_repository.dart';

class UpdateShiftUseCase implements BaseUseCase<Shift, Shift> {
  final AttendanceRepository _repository;

  const UpdateShiftUseCase(this._repository);

  @override
  Future<Result<Shift>> call(Shift params) => _repository.updateShift(params);
}
