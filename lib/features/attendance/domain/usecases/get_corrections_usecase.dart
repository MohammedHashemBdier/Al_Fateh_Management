import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/correction_request.dart';
import '../params/get_corrections_params.dart';
import '../repositories/attendance_repository.dart';

class GetCorrectionsUseCase
    implements BaseUseCase<List<CorrectionRequest>, GetCorrectionsParams> {
  final AttendanceRepository _repository;

  const GetCorrectionsUseCase(this._repository);

  @override
  Future<Result<List<CorrectionRequest>>> call(GetCorrectionsParams params) {
    return _repository.getCorrections(userId: params.userId);
  }
}
