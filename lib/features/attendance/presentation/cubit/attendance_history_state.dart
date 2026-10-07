import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../domain/models/attendance_filter.dart';
import '../../domain/models/attendance_record.dart';

part 'attendance_history_state.freezed.dart';

@freezed
abstract class AttendanceHistoryState with _$AttendanceHistoryState {
  const factory AttendanceHistoryState({
    @Default(UIStatus.initial) UIStatus status,
    @Default([]) List<AttendanceRecord> records,
    @Default([]) List<AttendanceRecord> filteredRecords,
    AttendanceFilter? filter,
    @Default(1) int currentPage,
    @Default(20) int pageSize,
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingMore,
    String? errorMessage,
  }) = _AttendanceHistoryState;
}
