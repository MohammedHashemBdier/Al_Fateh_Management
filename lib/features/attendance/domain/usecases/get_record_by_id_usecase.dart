import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/attendance_record.dart';
import '../params/get_record_by_id_params.dart';
import '../repositories/attendance_repository.dart';

class GetRecordByIdUseCase
    implements BaseUseCase<AttendanceRecord, GetRecordByIdParams> {
  final AttendanceRepository _repository;

  const GetRecordByIdUseCase(this._repository);

  @override
  Future<Result<AttendanceRecord>> call(GetRecordByIdParams params) {
    return _repository.getRecordById(recordId: params.recordId);
  }
}
