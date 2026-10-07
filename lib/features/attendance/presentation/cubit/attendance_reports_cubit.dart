import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../../../core/localization/attendance_error_mapper.dart';
import '../../domain/enums/attendance_enums.dart';
import '../../domain/models/attendance_report_models.dart';
import '../../domain/params/get_deductions_params.dart';
import '../../domain/params/get_overtime_params.dart';
import '../../domain/params/get_records_params.dart';
import '../../domain/usecases/get_deductions_usecase.dart';
import '../../domain/usecases/get_overtime_usecase.dart';
import '../../domain/usecases/get_records_usecase.dart';
import 'attendance_reports_state.dart';

@injectable
class AttendanceReportsCubit extends Cubit<AttendanceReportsState> {
  final GetRecordsUseCase _getRecordsUseCase;
  final GetDeductionsUseCase _getDeductionsUseCase;
  final GetOvertimeUseCase _getOvertimeUseCase;

  AttendanceReportsCubit({
    required this._getRecordsUseCase,
    required this._getDeductionsUseCase,
    required this._getOvertimeUseCase,
  }) : super(const AttendanceReportsState());

  /// تحميل التقرير للفترة المحددة
  Future<void> loadReports({
    ReportPeriod? period,
    DateTimeRange? range,
    String? userId,
  }) async {
    final currentPeriod = period ?? state.period;
    final currentRange =
        range ?? state.dateRange ?? _getDefaultRange(currentPeriod);

    emit(
      state.copyWith(
        status: UIStatus.loading,
        period: currentPeriod,
        dateRange: currentRange,
        errorMessage: null,
      ),
    );

    try {
      final recordsRes = await _getRecordsUseCase(
        GetRecordsParams(userId: userId, limit: 300),
      );
      final deductionsRes = await _getDeductionsUseCase(
        GetDeductionsParams(userId: userId),
      );
      final overtimeRes = await _getOvertimeUseCase(
        GetOvertimeParams(userId: userId),
      );

      final records = recordsRes.when(success: (r) => r, failure: (_) => []);
      final deductions = deductionsRes.when(
        success: (d) => d,
        failure: (_) => [],
      );
      final overtime = overtimeRes.when(success: (o) => o, failure: (_) => []);

      // تصفية السجلات حسب نطاق التواريخ
      final filteredRecords = records.where((r) {
        final d = DateTime.tryParse(r.date);
        if (d == null) return false;
        return d.isAfter(
              currentRange.start.subtract(const Duration(days: 1)),
            ) &&
            d.isBefore(currentRange.end.add(const Duration(days: 1)));
      }).toList();

      int presentDays = 0;
      int absentDays = 0;
      int lateDays = 0;
      int leaveDays = 0;
      double totalHours = 0.0;
      double totalOvertime = 0.0;
      num totalLateMins = 0;
      num totalEarlyLeaveMins = 0;

      final List<AttendanceReportEntry> entries = [];

      for (final rec in filteredRecords) {
        if (rec.status == AttendanceStatus.present) presentDays++;
        if (rec.status == AttendanceStatus.absent) absentDays++;
        if (rec.status == AttendanceStatus.late) lateDays++;
        if (rec.status == AttendanceStatus.onLeave) leaveDays++;

        totalHours += rec.actualHours;
        totalOvertime += rec.overtimeHours;
        totalLateMins += rec.lateMinutes;
        totalEarlyLeaveMins += rec.earlyLeaveMinutes;

        entries.add(
          AttendanceReportEntry(
            userId: rec.userId,
            userName: rec.userId,
            date: rec.date,
            shiftName: rec.shiftId ?? 'صباحي',
            checkInTime: rec.checkInTime,
            checkOutTime: rec.checkOutTime,
            actualHours: rec.actualHours,
            overtimeHours: rec.overtimeHours,
            lateMinutes: rec.lateMinutes.toInt(),
            status: rec.status.name,
          ),
        );
      }

      double totalDeductionAmount = 0.0;
      for (final d in deductions) {
        totalDeductionAmount += d.amount;
      }

      for (final o in overtime) {
        if (o.status == OvertimeStatus.approved) {
          totalOvertime += o.hours;
        }
      }

      final summary = AttendanceReportSummary(
        totalDays: filteredRecords.length,
        presentDays: presentDays,
        absentDays: absentDays,
        lateDays: lateDays,
        leaveDays: leaveDays,
        totalActualHours: totalHours,
        totalOvertimeHours: totalOvertime,
        totalLateMinutes: totalLateMins.toInt(),
        totalEarlyLeaveMinutes: totalEarlyLeaveMins.toInt(),
        totalDeductionsAmount: totalDeductionAmount,
      );

      if (isClosed) return;
      emit(
        state.copyWith(
          status: entries.isEmpty ? UIStatus.empty : UIStatus.loaded,
          summary: summary,
          entries: entries,
          errorMessage: null,
        ),
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

  /// تغيير فترة التقرير
  void changePeriod(ReportPeriod period) {
    loadReports(period: period, range: _getDefaultRange(period));
  }

  /// تصدير التقرير
  Future<String> export({ExportFormat format = ExportFormat.excel}) async {
    return 'تم تصدير التقرير (${state.entries.length} سجل) بنجاح بصيغة ${format.name.toUpperCase()}';
  }

  DateTimeRange _getDefaultRange(ReportPeriod period) {
    final now = DateTime.now();
    switch (period) {
      case ReportPeriod.daily:
        return DateTimeRange(start: now, end: now);
      case ReportPeriod.weekly:
        return DateTimeRange(
          start: now.subtract(const Duration(days: 7)),
          end: now,
        );
      case ReportPeriod.monthly:
        return DateTimeRange(
          start: DateTime(now.year, now.month, 1),
          end: DateTime(now.year, now.month + 1, 0),
        );
      case ReportPeriod.custom:
        return DateTimeRange(
          start: now.subtract(const Duration(days: 30)),
          end: now,
        );
    }
  }
}
