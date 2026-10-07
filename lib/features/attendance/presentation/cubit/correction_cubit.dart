import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../../../core/localization/attendance_error_mapper.dart';
import '../../domain/enums/attendance_enums.dart';
import '../../domain/params/approve_correction_params.dart';
import '../../domain/params/get_corrections_params.dart';
import '../../domain/params/reject_correction_params.dart';
import '../../domain/params/request_correction_params.dart';
import '../../domain/usecases/approve_correction_usecase.dart';
import '../../domain/usecases/get_corrections_usecase.dart';
import '../../domain/usecases/reject_correction_usecase.dart';
import '../../domain/usecases/request_correction_usecase.dart';
import 'correction_state.dart';

@injectable
class CorrectionCubit extends Cubit<CorrectionState> {
  final GetCorrectionsUseCase _getCorrectionsUseCase;
  final RequestCorrectionUseCase _requestCorrectionUseCase;
  final ApproveCorrectionUseCase _approveCorrectionUseCase;
  final RejectCorrectionUseCase _rejectCorrectionUseCase;

  CorrectionCubit({
    required this._getCorrectionsUseCase,
    required this._requestCorrectionUseCase,
    required this._approveCorrectionUseCase,
    required this._rejectCorrectionUseCase,
  }) : super(const CorrectionState());

  /// تحميل جميع طلبات التصحيح
  Future<void> loadCorrections({String? userId}) async {
    emit(state.copyWith(status: UIStatus.loading, errorMessage: null));

    try {
      final res = await _getCorrectionsUseCase(
        GetCorrectionsParams(userId: userId),
      );

      res.when(
        success: (list) {
          if (isClosed) return;
          final pending = list
              .where((r) => r.status == CorrectionStatus.pending)
              .toList();
          emit(
            state.copyWith(
              status: list.isEmpty ? UIStatus.empty : UIStatus.loaded,
              requests: list,
              pendingRequests: pending,
              errorMessage: null,
            ),
          );
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

  /// تحميل طلبات التصحيح الخاصة بموظف معين
  Future<void> loadMyCorrections({required String userId}) async {
    emit(state.copyWith(status: UIStatus.loading, errorMessage: null));

    try {
      final res = await _getCorrectionsUseCase(
        GetCorrectionsParams(userId: userId),
      );

      res.when(
        success: (list) {
          if (isClosed) return;
          emit(
            state.copyWith(
              status: list.isEmpty ? UIStatus.empty : UIStatus.loaded,
              myRequests: list,
              errorMessage: null,
            ),
          );
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

  /// تحميل الطلبات المعلقة فقط (للمدراء)
  Future<void> loadPendingCorrections() async {
    await loadCorrections();
  }

  /// تقديم طلب تصحيح جديد
  Future<bool> submitRequest(RequestCorrectionParams params) async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      final res = await _requestCorrectionUseCase(params);
      bool success = false;

      res.when(
        success: (created) {
          success = true;
          if (!isClosed) {
            final updatedMy = [created, ...state.myRequests];
            final updatedAll = [created, ...state.requests];
            final updatedPending = [created, ...state.pendingRequests];
            emit(
              state.copyWith(
                isSubmitting: false,
                myRequests: updatedMy,
                requests: updatedAll,
                pendingRequests: updatedPending,
                errorMessage: null,
              ),
            );
          }
        },
        failure: (f) {
          if (!isClosed) {
            emit(
              state.copyWith(
                isSubmitting: false,
                errorMessage: AttendanceErrorMapper.mapFailure(f),
              ),
            );
          }
        },
      );

      return success;
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: AttendanceErrorMapper.mapException(e),
          ),
        );
      }
      return false;
    }
  }

  /// اعتماد طلب تصحيح
  Future<bool> approveRequest(ApproveCorrectionParams params) async {
    emit(state.copyWith(isApproving: true, errorMessage: null));

    try {
      final res = await _approveCorrectionUseCase(params);
      bool success = false;

      res.when(
        success: (_) {
          success = true;
          if (!isClosed) {
            final updatedPending = state.pendingRequests
                .where((r) => r.requestId != params.requestId)
                .toList();
            emit(
              state.copyWith(
                isApproving: false,
                pendingRequests: updatedPending,
                errorMessage: null,
              ),
            );
            // إعادة تحميل البيانات لمزامنة الحالات
            loadCorrections();
          }
        },
        failure: (f) {
          if (!isClosed) {
            emit(
              state.copyWith(
                isApproving: false,
                errorMessage: AttendanceErrorMapper.mapFailure(f),
              ),
            );
          }
        },
      );

      return success;
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            isApproving: false,
            errorMessage: AttendanceErrorMapper.mapException(e),
          ),
        );
      }
      return false;
    }
  }

  /// رفض طلب تصحيح
  Future<bool> rejectRequest(RejectCorrectionParams params) async {
    emit(state.copyWith(isApproving: true, errorMessage: null));

    try {
      final res = await _rejectCorrectionUseCase(params);
      bool success = false;

      res.when(
        success: (_) {
          success = true;
          if (!isClosed) {
            final updatedPending = state.pendingRequests
                .where((r) => r.requestId != params.requestId)
                .toList();
            emit(
              state.copyWith(
                isApproving: false,
                pendingRequests: updatedPending,
                errorMessage: null,
              ),
            );
            loadCorrections();
          }
        },
        failure: (f) {
          if (!isClosed) {
            emit(
              state.copyWith(
                isApproving: false,
                errorMessage: AttendanceErrorMapper.mapFailure(f),
              ),
            );
          }
        },
      );

      return success;
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            isApproving: false,
            errorMessage: AttendanceErrorMapper.mapException(e),
          ),
        );
      }
      return false;
    }
  }
}
