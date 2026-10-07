import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../domain/models/correction_request.dart';

part 'correction_state.freezed.dart';

@freezed
abstract class CorrectionState with _$CorrectionState {
  const factory CorrectionState({
    @Default(UIStatus.initial) UIStatus status,
    @Default([]) List<CorrectionRequest> requests,
    @Default([]) List<CorrectionRequest> myRequests,
    @Default([]) List<CorrectionRequest> pendingRequests,
    String? errorMessage,
    @Default(false) bool isSubmitting,
    @Default(false) bool isApproving,
  }) = _CorrectionState;
}
