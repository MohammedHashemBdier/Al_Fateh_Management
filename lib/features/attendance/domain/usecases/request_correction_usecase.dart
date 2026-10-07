import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/correction_request.dart';
import '../params/request_correction_params.dart';
import '../repositories/attendance_repository.dart';

class RequestCorrectionUseCase
    implements BaseUseCase<CorrectionRequest, RequestCorrectionParams> {
  final AttendanceRepository _repository;

  const RequestCorrectionUseCase(this._repository);

  @override
  Future<Result<CorrectionRequest>> call(RequestCorrectionParams params) {
    return _repository.requestCorrection(params);
  }
}
