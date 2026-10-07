import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/shift.dart';
import '../repositories/attendance_repository.dart';

class GetShiftsUseCase implements BaseUseCase<List<Shift>, NoParams> {
  final AttendanceRepository _repository;

  const GetShiftsUseCase(this._repository);

  @override
  Future<Result<List<Shift>>> call(NoParams params) {
    return _repository.getShifts();
  }
}
