import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/attendance_record.dart';
import '../params/check_in_params.dart';
import '../repositories/attendance_repository.dart';

class CheckInUseCase implements BaseUseCase<AttendanceRecord, CheckInParams> {
  final AttendanceRepository _repository;

  const CheckInUseCase(this._repository);

  @override
  Future<Result<AttendanceRecord>> call(CheckInParams params) {
    return _repository.checkIn(params);
  }
}
