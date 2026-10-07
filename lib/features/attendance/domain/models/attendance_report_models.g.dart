// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_report_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceReportSummary _$AttendanceReportSummaryFromJson(
  Map<String, dynamic> json,
) => _AttendanceReportSummary(
  totalDays: (json['totalDays'] as num?)?.toInt() ?? 0,
  presentDays: (json['presentDays'] as num?)?.toInt() ?? 0,
  absentDays: (json['absentDays'] as num?)?.toInt() ?? 0,
  lateDays: (json['lateDays'] as num?)?.toInt() ?? 0,
  leaveDays: (json['leaveDays'] as num?)?.toInt() ?? 0,
  totalActualHours: (json['totalActualHours'] as num?)?.toDouble() ?? 0.0,
  totalOvertimeHours: (json['totalOvertimeHours'] as num?)?.toDouble() ?? 0.0,
  totalLateMinutes: (json['totalLateMinutes'] as num?)?.toInt() ?? 0,
  totalEarlyLeaveMinutes:
      (json['totalEarlyLeaveMinutes'] as num?)?.toInt() ?? 0,
  totalDeductionsAmount:
      (json['totalDeductionsAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$AttendanceReportSummaryToJson(
  _AttendanceReportSummary instance,
) => <String, dynamic>{
  'totalDays': instance.totalDays,
  'presentDays': instance.presentDays,
  'absentDays': instance.absentDays,
  'lateDays': instance.lateDays,
  'leaveDays': instance.leaveDays,
  'totalActualHours': instance.totalActualHours,
  'totalOvertimeHours': instance.totalOvertimeHours,
  'totalLateMinutes': instance.totalLateMinutes,
  'totalEarlyLeaveMinutes': instance.totalEarlyLeaveMinutes,
  'totalDeductionsAmount': instance.totalDeductionsAmount,
};

_AttendanceReportEntry _$AttendanceReportEntryFromJson(
  Map<String, dynamic> json,
) => _AttendanceReportEntry(
  userId: json['userId'] as String,
  userName: json['userName'] as String,
  date: json['date'] as String,
  shiftName: json['shiftName'] as String,
  checkInTime: json['checkInTime'] as String?,
  checkOutTime: json['checkOutTime'] as String?,
  actualHours: (json['actualHours'] as num?)?.toDouble() ?? 0.0,
  overtimeHours: (json['overtimeHours'] as num?)?.toDouble() ?? 0.0,
  lateMinutes: (json['lateMinutes'] as num?)?.toInt() ?? 0,
  status: json['status'] as String,
);

Map<String, dynamic> _$AttendanceReportEntryToJson(
  _AttendanceReportEntry instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'userName': instance.userName,
  'date': instance.date,
  'shiftName': instance.shiftName,
  'checkInTime': instance.checkInTime,
  'checkOutTime': instance.checkOutTime,
  'actualHours': instance.actualHours,
  'overtimeHours': instance.overtimeHours,
  'lateMinutes': instance.lateMinutes,
  'status': instance.status,
};
