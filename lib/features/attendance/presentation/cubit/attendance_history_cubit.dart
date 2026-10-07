import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../../../core/localization/attendance_error_mapper.dart';
import '../../domain/models/attendance_filter.dart';
import '../../domain/models/attendance_record.dart';
import '../../domain/models/attendance_report_models.dart';
import '../../domain/params/get_records_params.dart';
import '../../domain/usecases/get_records_usecase.dart';
import 'attendance_history_state.dart';

@injectable
class AttendanceHistoryCubit extends Cubit<AttendanceHistoryState> {
  final GetRecordsUseCase _getRecordsUseCase;

  String? _currentUserId;
  String? _currentMonth;

  AttendanceHistoryCubit({required this._getRecordsUseCase})
    : super(const AttendanceHistoryState());

  /// تحميل السجلات مع إمكانية تحديد المستخدم والشهر
  Future<void> loadRecords({String? userId, String? month}) async {
    _currentUserId = userId;
    _currentMonth = month;
    emit(
      state.copyWith(
        status: UIStatus.loading,
        errorMessage: null,
        currentPage: 1,
      ),
    );

    try {
      final res = await _getRecordsUseCase(
        GetRecordsParams(
          userId: userId,
          month: month,
          limit: state.pageSize * 2,
        ),
      );

      res.when(
        success: (records) {
          if (isClosed) return;
          final filtered = _applyFilterLogic(records, state.filter);
          emit(
            state.copyWith(
              status: filtered.isEmpty ? UIStatus.empty : UIStatus.loaded,
              records: records,
              filteredRecords: filtered,
              hasMore: records.length >= state.pageSize * 2,
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

  /// تحميل المزيد من السجلات (Pagination)
  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    try {
      final nextPage = state.currentPage + 1;
      final res = await _getRecordsUseCase(
        GetRecordsParams(
          userId: _currentUserId,
          month: _currentMonth,
          limit: nextPage * state.pageSize,
        ),
      );

      res.when(
        success: (newRecords) {
          if (isClosed) return;
          final filtered = _applyFilterLogic(newRecords, state.filter);
          emit(
            state.copyWith(
              isLoadingMore: false,
              currentPage: nextPage,
              records: newRecords,
              filteredRecords: filtered,
              hasMore: newRecords.length >= nextPage * state.pageSize,
            ),
          );
        },
        failure: (f) {
          if (isClosed) return;
          emit(state.copyWith(isLoadingMore: false));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(state.copyWith(isLoadingMore: false));
    }
  }

  /// تطبيق الفلاتر على السجلات
  void applyFilter(AttendanceFilter filter) {
    final filtered = _applyFilterLogic(state.records, filter);
    emit(
      state.copyWith(
        filter: filter,
        filteredRecords: filtered,
        status: filtered.isEmpty ? UIStatus.empty : UIStatus.loaded,
      ),
    );
  }

  /// مسح الفلاتر
  void clearFilter() {
    emit(
      state.copyWith(
        filter: null,
        filteredRecords: state.records,
        status: state.records.isEmpty ? UIStatus.empty : UIStatus.loaded,
      ),
    );
  }

  /// البحث السريع في السجلات
  void search(String query) {
    final currentFilter = (state.filter ?? const AttendanceFilter()).copyWith(
      searchQuery: query.trim().isEmpty ? null : query.trim(),
    );
    applyFilter(currentFilter);
  }

  /// تصدير السجلات المفلترة
  Future<String> export({ExportFormat format = ExportFormat.excel}) async {
    // إعداد البيانات للتصدير
    final count = state.filteredRecords.length;
    return 'تم تجهيز $count سجل للتصدير بصيغة ${format.name.toUpperCase()}';
  }

  /// منطق الفلترة المساعد
  List<AttendanceRecord> _applyFilterLogic(
    List<AttendanceRecord> list,
    AttendanceFilter? filter,
  ) {
    if (filter == null) return list;

    return list.where((record) {
      // 1. فلتر التاريخ من
      if (filter.fromDate != null) {
        final recordDate = DateTime.tryParse(record.date);
        if (recordDate != null && recordDate.isBefore(filter.fromDate!)) {
          return false;
        }
      }

      // 2. فلتر التاريخ إلى
      if (filter.toDate != null) {
        final recordDate = DateTime.tryParse(record.date);
        if (recordDate != null && recordDate.isAfter(filter.toDate!)) {
          return false;
        }
      }

      // 3. فلتر الحالة
      if (filter.status != null && record.status != filter.status) {
        return false;
      }

      // 4. فلتر المستخدم
      if (filter.userId != null &&
          filter.userId!.isNotEmpty &&
          record.userId != filter.userId) {
        return false;
      }

      // 5. فلتر الموقع
      if (filter.siteId != null &&
          filter.siteId!.isNotEmpty &&
          record.checkInSiteId != filter.siteId &&
          record.checkOutSiteId != filter.siteId) {
        return false;
      }

      // 6. فلتر البحث النصي
      if (filter.searchQuery != null && filter.searchQuery!.isNotEmpty) {
        final q = filter.searchQuery!.toLowerCase();
        final matchUser = record.userId.toLowerCase().contains(q);
        final matchDate = record.date.toLowerCase().contains(q);
        final matchStatus = record.status.name.toLowerCase().contains(q);
        if (!matchUser && !matchDate && !matchStatus) {
          return false;
        }
      }

      return true;
    }).toList();
  }
}
