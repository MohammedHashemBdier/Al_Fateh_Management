import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/attendance_enums.dart';

part 'attendance_filter.freezed.dart';
part 'attendance_filter.g.dart';

@freezed
abstract class AttendanceFilter with _$AttendanceFilter {
  const factory AttendanceFilter({
    DateTime? fromDate,
    DateTime? toDate,
    AttendanceStatus? status,
    String? userId,
    String? departmentId,
    String? siteId,
    String? searchQuery,
  }) = _AttendanceFilter;

  factory AttendanceFilter.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFilterFromJson(json);
}
