import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../params/approve_correction_params.dart';
import '../repositories/attendance_repository.dart';

class ApproveCorrectionUseCase
    implements BaseUseCase<void, ApproveCorrectionParams> {
  final AttendanceRepository _repository;

  const ApproveCorrectionUseCase(this._repository);

  @override
  Future<Result<void>> call(ApproveCorrectionParams params) {
    return _repository.approveCorrection(params);
  }
}
