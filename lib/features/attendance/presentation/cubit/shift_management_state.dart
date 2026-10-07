import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../domain/models/shift.dart';

part 'shift_management_state.freezed.dart';

@freezed
abstract class ShiftManagementState with _$ShiftManagementState {
  const factory ShiftManagementState({
    @Default(UIStatus.initial) UIStatus status,
    @Default([]) List<Shift> shifts,
    String? errorMessage,
    @Default(false) bool isSaving,
  }) = _ShiftManagementState;
}
