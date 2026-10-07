import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/attendance_record.dart';
import '../params/check_out_params.dart';
import '../repositories/attendance_repository.dart';

class CheckOutUseCase implements BaseUseCase<AttendanceRecord, CheckOutParams> {
  final AttendanceRepository _repository;

  const CheckOutUseCase(this._repository);

  @override
  Future<Result<AttendanceRecord>> call(CheckOutParams params) {
    return _repository.checkOut(params);
  }
}
