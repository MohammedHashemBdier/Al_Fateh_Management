import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../../../core/localization/attendance_error_mapper.dart';
import '../../domain/params/get_record_by_id_params.dart';
import '../../domain/usecases/get_audit_logs_usecase.dart';
import '../../domain/usecases/get_record_by_id_usecase.dart';
import 'attendance_details_state.dart';

@injectable
class AttendanceDetailsCubit extends Cubit<AttendanceDetailsState> {
  final GetRecordByIdUseCase _getRecordByIdUseCase;
  final GetAuditLogsUseCase _getAuditLogsUseCase;

  AttendanceDetailsCubit({
    required this._getRecordByIdUseCase,
    required this._getAuditLogsUseCase,
  }) : super(const AttendanceDetailsState());

  /// تحميل تفاصيل السجل المحدد
  Future<void> loadDetails({required String recordId}) async {
    emit(state.copyWith(status: UIStatus.loading, errorMessage: null));

    try {
      final res = await _getRecordByIdUseCase(
        GetRecordByIdParams(recordId: recordId),
      );

      res.when(
        success: (record) {
          if (isClosed) return;
          emit(
            state.copyWith(
              status: UIStatus.loaded,
              record: record,
              errorMessage: null,
            ),
          );
          // جلب سجل التدقيق تلقائياً بعد السجل
          loadAuditLog(recordId: recordId);
        },
        failure: (f) {
          if (isClosed) return;
          emit(
            state.copyWith(
              status: UIStatus.error,
              errorMessage: AttendanceErrorMapper.mapFailure(f),
            ),
          );
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          status: UIStatus.error,
          errorMessage: AttendanceErrorMapper.mapException(e),
        ),
      );
    }
  }

  /// تحميل سجل التدقيق والرقابة (Audit Log) المرتبط بالسجل
  Future<void> loadAuditLog({required String recordId}) async {
    try {
      final res = await _getAuditLogsUseCase(recordId);
      res.when(
        success: (logs) {
          if (!isClosed) emit(state.copyWith(auditLog: logs));
        },
        failure: (f) {
          // التدقيق اختياري لا يكسر عرض السجل
        },
      );
    } catch (_) {}
  }
}
