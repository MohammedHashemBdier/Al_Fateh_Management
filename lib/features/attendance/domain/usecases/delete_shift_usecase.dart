import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../repositories/attendance_repository.dart';

class DeleteShiftUseCase implements BaseUseCase<void, String> {
  final AttendanceRepository _repository;

  const DeleteShiftUseCase(this._repository);

  @override
  Future<Result<void>> call(String shiftId) => _repository.deleteShift(shiftId);
}
