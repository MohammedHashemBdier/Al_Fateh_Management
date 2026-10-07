import '../../../../core/contracts/result.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../models/audit_log_entry.dart';
import '../repositories/attendance_repository.dart';

class GetAuditLogsUseCase implements BaseUseCase<List<AuditLogEntry>, String?> {
  final AttendanceRepository _repository;

  const GetAuditLogsUseCase(this._repository);

  @override
  Future<Result<List<AuditLogEntry>>> call(String? params) =>
      _repository.getAuditLogs(recordId: params);
}
