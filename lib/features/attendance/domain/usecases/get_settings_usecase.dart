import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/attendance_settings.dart';
import '../repositories/attendance_repository.dart';

class GetSettingsUseCase implements BaseUseCase<AttendanceSettings, NoParams> {
  final AttendanceRepository _repository;

  const GetSettingsUseCase(this._repository);

  @override
  Future<Result<AttendanceSettings>> call(NoParams params) {
    return _repository.getSettings();
  }
}
