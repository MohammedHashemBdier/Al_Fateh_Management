import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/site_geofence.dart';
import '../repositories/attendance_repository.dart';

class GetSitesUseCase implements BaseUseCase<List<SiteGeofence>, NoParams> {
  final AttendanceRepository _repository;

  const GetSitesUseCase(this._repository);

  @override
  Future<Result<List<SiteGeofence>>> call(NoParams params) {
    return _repository.getSites();
  }
}
