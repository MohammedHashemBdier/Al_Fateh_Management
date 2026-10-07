import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../domain/models/attendance_report_models.dart';

part 'attendance_reports_state.freezed.dart';

@freezed
abstract class AttendanceReportsState with _$AttendanceReportsState {
  const factory AttendanceReportsState({
    @Default(UIStatus.initial) UIStatus status,
    @Default(ReportPeriod.monthly) ReportPeriod period,
    DateTimeRange? dateRange,
    AttendanceReportSummary? summary,
    @Default([]) List<AttendanceReportEntry> entries,
    String? errorMessage,
  }) = _AttendanceReportsState;
}
