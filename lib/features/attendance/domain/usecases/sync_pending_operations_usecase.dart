import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../repositories/attendance_repository.dart';

class SyncPendingOperationsUseCase implements BaseUseCase<void, NoParams> {
  final AttendanceRepository _repository;

  const SyncPendingOperationsUseCase(this._repository);

  @override
  Future<Result<void>> call(NoParams params) {
    return _repository.syncPendingOperations();
  }
}

class GetPendingOperationsCountUseCase implements BaseUseCase<int, NoParams> {
  final AttendanceRepository _repository;

  const GetPendingOperationsCountUseCase(this._repository);

  @override
  Future<Result<int>> call(NoParams params) async {
    final count = await _repository.getPendingOperationsCount();
    return Result.success(count);
  }
}
