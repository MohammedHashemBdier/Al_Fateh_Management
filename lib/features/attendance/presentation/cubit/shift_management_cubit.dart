import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../../../core/localization/attendance_error_mapper.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../domain/models/shift.dart';
import '../../domain/usecases/add_shift_usecase.dart';
import '../../domain/usecases/delete_shift_usecase.dart';
import '../../domain/usecases/get_shifts_usecase.dart';
import '../../domain/usecases/update_shift_usecase.dart';
import 'shift_management_state.dart';

@injectable
class ShiftManagementCubit extends Cubit<ShiftManagementState> {
  final GetShiftsUseCase _getShiftsUseCase;
  final AddShiftUseCase _addShiftUseCase;
  final UpdateShiftUseCase _updateShiftUseCase;
  final DeleteShiftUseCase _deleteShiftUseCase;

  ShiftManagementCubit({
    required this._getShiftsUseCase,
    required this._addShiftUseCase,
    required this._updateShiftUseCase,
    required this._deleteShiftUseCase,
  }) : super(const ShiftManagementState());

  /// تحميل الورديات وفترات الدوام
  Future<void> loadShifts() async {
    emit(state.copyWith(status: UIStatus.loading, errorMessage: null));

    try {
      final res = await _getShiftsUseCase(const NoParams());

      res.when(
        success: (shifts) {
          if (isClosed) return;
          emit(
            state.copyWith(
              status: shifts.isEmpty ? UIStatus.empty : UIStatus.loaded,
              shifts: shifts,
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

  /// إضافة وردية جديدة
  Future<bool> addShift(Shift shift) async {
    emit(state.copyWith(isSaving: true, errorMessage: null));

    try {
      final res = await _addShiftUseCase(shift);
      bool success = false;

      res.when(
        success: (created) {
          success = true;
          if (!isClosed) {
            emit(
              state.copyWith(
                isSaving: false,
                shifts: [...state.shifts, created],
                status: UIStatus.loaded,
              ),
            );
          }
        },
        failure: (f) {
          if (!isClosed) {
            emit(
              state.copyWith(
                isSaving: false,
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
            isSaving: false,
            errorMessage: AttendanceErrorMapper.mapException(e),
          ),
        );
      }
      return false;
    }
  }

  /// تحديث وردية قائمة
  Future<bool> updateShift(Shift shift) async {
    emit(state.copyWith(isSaving: true, errorMessage: null));

    try {
      final res = await _updateShiftUseCase(shift);
      bool success = false;

      res.when(
        success: (updated) {
          success = true;
          if (!isClosed) {
            final list = state.shifts.map((s) {
              return s.shiftId == updated.shiftId ? updated : s;
            }).toList();
            emit(
              state.copyWith(
                isSaving: false,
                shifts: list,
                status: UIStatus.loaded,
              ),
            );
          }
        },
        failure: (f) {
          if (!isClosed) {
            emit(
              state.copyWith(
                isSaving: false,
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
            isSaving: false,
            errorMessage: AttendanceErrorMapper.mapException(e),
          ),
        );
      }
      return false;
    }
  }

  /// حذف وردية
  Future<bool> deleteShift({required String shiftId}) async {
    emit(state.copyWith(isSaving: true, errorMessage: null));

    try {
      final res = await _deleteShiftUseCase(shiftId);
      bool success = false;

      res.when(
        success: (_) {
          success = true;
          if (!isClosed) {
            final list = state.shifts
                .where((s) => s.shiftId != shiftId)
                .toList();
            emit(
              state.copyWith(
                isSaving: false,
                shifts: list,
                status: list.isEmpty ? UIStatus.empty : UIStatus.loaded,
              ),
            );
          }
        },
        failure: (f) {
          if (!isClosed) {
            emit(
              state.copyWith(
                isSaving: false,
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
            isSaving: false,
            errorMessage: AttendanceErrorMapper.mapException(e),
          ),
        );
      }
      return false;
    }
  }
}
