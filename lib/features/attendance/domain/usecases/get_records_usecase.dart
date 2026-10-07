import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/attendance_record.dart';
import '../params/get_records_params.dart';
import '../repositories/attendance_repository.dart';

class GetRecordsUseCase
    implements BaseUseCase<List<AttendanceRecord>, GetRecordsParams> {
  final AttendanceRepository _repository;

  const GetRecordsUseCase(this._repository);

  @override
  Future<Result<List<AttendanceRecord>>> call(GetRecordsParams params) {
    return _repository.getRecords(
      userId: params.userId,
      month: params.month,
      date: params.date,
      limit: params.limit,
    );
  }
}
