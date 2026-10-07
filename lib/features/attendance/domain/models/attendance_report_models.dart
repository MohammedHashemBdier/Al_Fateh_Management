import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_report_models.freezed.dart';
part 'attendance_report_models.g.dart';

/// فترات التقارير المتاحة
enum ReportPeriod { daily, weekly, monthly, custom }

/// صيغ التصدير المدعومة
enum ExportFormat { pdf, excel, csv }

/// ملخص إحصائيات تقرير الدوام
@freezed
abstract class AttendanceReportSummary with _$AttendanceReportSummary {
  const factory AttendanceReportSummary({
    @Default(0) int totalDays,
    @Default(0) int presentDays,
    @Default(0) int absentDays,
    @Default(0) int lateDays,
    @Default(0) int leaveDays,
    @Default(0.0) double totalActualHours,
    @Default(0.0) double totalOvertimeHours,
    @Default(0) int totalLateMinutes,
    @Default(0) int totalEarlyLeaveMinutes,
    @Default(0.0) double totalDeductionsAmount,
  }) = _AttendanceReportSummary;

  factory AttendanceReportSummary.fromJson(Map<String, dynamic> json) =>
      _$AttendanceReportSummaryFromJson(json);
}

/// سجل تفصيلي لتقرير الدوام
@freezed
abstract class AttendanceReportEntry with _$AttendanceReportEntry {
  const factory AttendanceReportEntry({
    required String userId,
    required String userName,
    required String date,
    required String shiftName,
    String? checkInTime,
    String? checkOutTime,
    @Default(0.0) double actualHours,
    @Default(0.0) double overtimeHours,
    @Default(0) int lateMinutes,
    required String status,
  }) = _AttendanceReportEntry;

  factory AttendanceReportEntry.fromJson(Map<String, dynamic> json) =>
      _$AttendanceReportEntryFromJson(json);
}
