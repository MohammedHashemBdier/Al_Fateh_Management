import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../params/reject_correction_params.dart';
import '../repositories/attendance_repository.dart';

class RejectCorrectionUseCase
    implements BaseUseCase<void, RejectCorrectionParams> {
  final AttendanceRepository _repository;

  const RejectCorrectionUseCase(this._repository);

  @override
  Future<Result<void>> call(RejectCorrectionParams params) {
    return _repository.rejectCorrection(params);
  }
}
