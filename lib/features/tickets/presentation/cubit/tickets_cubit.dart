import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../data/repositories/tickets_repository_impl.dart';
import '../../domain/models/ticket_filter.dart';
import '../../domain/models/ticket_model.dart';
import '../../domain/repositories/tickets_repository.dart';
import 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  final TicketsRepository _repository;
  final AuthRepository _authRepository;
  Timer? _searchDebounceTimer;

  TicketsCubit({TicketsRepository? repository, AuthRepository? authRepository})
    : _repository = repository ?? TicketsRepositoryImpl(),
      _authRepository = authRepository ?? AuthRepositoryImpl(),
      super(const TicketsState());

  @override
  Future<void> close() {
    _searchDebounceTimer?.cancel();
    return super.close();
  }

  /// تحميل التذاكر وبيانات التهيئة الأولية
  Future<void> loadTickets({bool forceRefresh = false}) async {
    emit(
      state.copyWith(status: TicketsStatus.loading, errorMessage: () => null),
    );

    try {
      final session = await _authRepository.getSavedSession();
      final initData = await _repository.getInitialData(
        forceRefresh: forceRefresh,
      );
      final pendingCount = await _repository.getPendingSyncCount();

      final filtered = state.filter.apply(initData.tickets);

      emit(
        state.copyWith(
          status: TicketsStatus.success,
          currentUser: session?.user,
          allTickets: initData.tickets,
          filteredTickets: filtered,
          problemTypes: initData.problems,
          statusList: initData.statuses,
          employeeList: initData.employees,
          pendingSyncCount: pendingCount,
          isOffline: initData.isFromCache,
          currentPage: 1,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TicketsStatus.failure,
          errorMessage: () => e.toString(),
        ),
      );
    }
  }

  /// البحث الفوري مع تقنية Debounce (300ms)
  void onSearchChanged(String query) {
    _searchDebounceTimer?.cancel();
    _searchDebounceTimer = Timer(const Duration(milliseconds: 300), () {
      final updatedFilter = state.filter.copyWith(searchQuery: query);
      final filtered = updatedFilter.apply(state.allTickets);

      emit(
        state.copyWith(
          filter: updatedFilter,
          filteredTickets: filtered,
          currentPage: 1,
        ),
      );
    });
  }

  /// تحديث الفلاتر المتقدمة (الحالة، المشكلة، الموظف، التاريخ، الأولوية)
  void applyFilter(TicketFilterModel newFilter) {
    final filtered = newFilter.apply(state.allTickets);
    emit(
      state.copyWith(
        filter: newFilter,
        filteredTickets: filtered,
        currentPage: 1,
      ),
    );
  }

  /// مسح جميع الفلاتر
  void resetFilters() {
    final clearedFilter = state.filter.clear();
    final filtered = clearedFilter.apply(state.allTickets);
    emit(
      state.copyWith(
        filter: clearedFilter,
        filteredTickets: filtered,
        currentPage: 1,
      ),
    );
  }

  /// تغيير ترتيب الأعمدة
  void sort(TicketSortField field) {
    SortDirection nextDirection = SortDirection.ascending;
    if (state.filter.sortField == field) {
      nextDirection = state.filter.sortDirection == SortDirection.ascending
          ? SortDirection.descending
          : SortDirection.ascending;
    }
    final updatedFilter = state.filter.copyWith(
      sortField: field,
      sortDirection: nextDirection,
    );
    final filtered = updatedFilter.apply(state.allTickets);
    emit(state.copyWith(filter: updatedFilter, filteredTickets: filtered));
  }

  /// التنقل بين الصفحات
  void goToPage(int page) {
    if (page >= 1 && page <= state.totalPages) {
      emit(state.copyWith(currentPage: page));
    }
  }

  /// تغيير عدد العناصر في الصفحة
  void changePageSize(int size) {
    emit(state.copyWith(pageSize: size, currentPage: 1));
  }

  /// التبديل بين طريقة عرض الجدول والبطاقات
  void toggleViewMode(bool isTable) {
    emit(state.copyWith(isTableView: isTable));
  }

  /// تحديد / إلغاء تحديد تذكرة
  void toggleTicketSelection(int rowId) {
    final selected = Set<int>.from(state.selectedTicketIds);
    if (selected.contains(rowId)) {
      selected.remove(rowId);
    } else {
      selected.add(rowId);
    }
    emit(state.copyWith(selectedTicketIds: selected));
  }

  /// تحديد جميع تذاكر الصفحة الحالية أو إلغاء التحديد
  void toggleSelectAll(bool select) {
    final selected = Set<int>.from(state.selectedTicketIds);
    if (select) {
      for (final t in state.paginatedTickets) {
        selected.add(t.rowId);
      }
    } else {
      for (final t in state.paginatedTickets) {
        selected.remove(t.rowId);
      }
    }
    emit(state.copyWith(selectedTicketIds: selected));
  }

  /// إضافة تذكرة جديدة
  Future<bool> addTicket(TicketModel ticket) async {
    emit(state.copyWith(status: TicketsStatus.actionLoading));
    try {
      final added = await _repository.addTicket(ticket);
      final updatedList = [added, ...state.allTickets];
      final filtered = state.filter.apply(updatedList);
      final pendingCount = await _repository.getPendingSyncCount();

      emit(
        state.copyWith(
          status: TicketsStatus.success,
          allTickets: updatedList,
          filteredTickets: filtered,
          pendingSyncCount: pendingCount,
          successMessage: () => 'ticket_add_success',
        ),
      );
      return true;
    } catch (e) {
      emit(
        state.copyWith(
          status: TicketsStatus.success,
          errorMessage: () => e.toString(),
        ),
      );
      return false;
    }
  }

  /// تحديث حالة وتفاصيل تذكرة (One-Click Update)
  Future<bool> updateTicket({
    required int rowId,
    String? status,
    String? solution,
    String? description,
    String? employee,
    String? problem,
    required String actorName,
    String? auditNote,
  }) async {
    emit(state.copyWith(status: TicketsStatus.actionLoading));
    try {
      final updated = await _repository.updateTicket(
        rowId: rowId,
        status: status,
        solution: solution,
        description: description,
        employee: employee,
        problem: problem,
        actorName: actorName,
        auditNote: auditNote,
      );

      final updatedAll = state.allTickets.map((t) {
        return t.rowId == rowId ? updated : t;
      }).toList();

      final filtered = state.filter.apply(updatedAll);
      final pendingCount = await _repository.getPendingSyncCount();

      emit(
        state.copyWith(
          status: TicketsStatus.success,
          allTickets: updatedAll,
          filteredTickets: filtered,
          pendingSyncCount: pendingCount,
          successMessage: () => 'ticket_update_success',
        ),
      );
      return true;
    } catch (e) {
      emit(
        state.copyWith(
          status: TicketsStatus.success,
          errorMessage: () => e.toString(),
        ),
      );
      return false;
    }
  }

  /// إغلاق كافة التذاكر المفتوحة دفعة واحدة (للأدمن والمدير العام)
  Future<int> closeAllOpenTickets({String? solution}) async {
    final openTickets = state.allTickets
        .where((t) => t.status != 'تم الحل')
        .toList();
    if (openTickets.isEmpty) return 0;

    emit(state.copyWith(status: TicketsStatus.actionLoading));
    try {
      final actorName = state.currentUser?.fullName ?? 'مدير النظام';
      final closedCount = await _repository.closeAllOpenTickets(
        openTickets: openTickets,
        actorName: actorName,
        solution: solution,
      );

      // تحديث القائمة محلياً
      final updatedAll = state.allTickets.map((t) {
        if (t.status != 'تم الحل') {
          return t.copyWith(
            status: 'تم الحل',
            solution: t.solution.isNotEmpty
                ? t.solution
                : (solution ?? 'إغلاق جماعي بواسطة الإدارة'),
          );
        }
        return t;
      }).toList();

      final filtered = state.filter.apply(updatedAll);
      final pendingCount = await _repository.getPendingSyncCount();

      emit(
        state.copyWith(
          status: TicketsStatus.success,
          allTickets: updatedAll,
          filteredTickets: filtered,
          pendingSyncCount: pendingCount,
          successMessage: () => 'tickets_bulk_close_success',
        ),
      );
      return closedCount;
    } catch (e) {
      emit(
        state.copyWith(
          status: TicketsStatus.success,
          errorMessage: () => e.toString(),
        ),
      );
      return 0;
    }
  }

  /// إضافة نوع مشكلة جديدة وحفظها فورياً
  Future<bool> addProblemType(String problemName, {String? userId}) async {
    emit(state.copyWith(status: TicketsStatus.actionLoading));
    try {
      final updatedProblems = await _repository.addProblemType(
        problemName,
        userId: userId,
      );
      emit(
        state.copyWith(
          status: TicketsStatus.success,
          problemTypes: updatedProblems,
          successMessage: () => 'problem_add_success',
        ),
      );
      return true;
    } catch (e) {
      emit(
        state.copyWith(
          status: TicketsStatus.success,
          errorMessage: () => e.toString(),
        ),
      );
      return false;
    }
  }

  /// حذف تذكرة نهائياً
  Future<bool> deleteTicket(int rowId, {String? reason}) async {
    emit(state.copyWith(status: TicketsStatus.actionLoading));
    try {
      final actorName = state.currentUser?.fullName ?? 'الدعم الفني';
      final success = await _repository.deleteTicket(
        rowId,
        actorName: actorName,
        reason: reason,
      );

      final updatedAll = state.allTickets
          .where((t) => t.rowId != rowId)
          .toList();
      final filtered = state.filter.apply(updatedAll);
      final selected = Set<int>.from(state.selectedTicketIds)..remove(rowId);

      emit(
        state.copyWith(
          status: TicketsStatus.success,
          allTickets: updatedAll,
          filteredTickets: filtered,
          selectedTicketIds: selected,
          successMessage: () => 'ticket_delete_success',
        ),
      );
      return success;
    } catch (e) {
      emit(
        state.copyWith(
          status: TicketsStatus.success,
          errorMessage: () => e.toString(),
        ),
      );
      return false;
    }
  }

  /// مزامنة العمليات المعلقة فوراً
  Future<void> syncNow() async {
    emit(state.copyWith(status: TicketsStatus.syncing));
    try {
      final count = await _repository.processSyncQueue();
      final pending = await _repository.getPendingSyncCount();
      // إعادة تحميل التذاكر بعد المزامنة
      final init = await _repository.getInitialData(forceRefresh: true);
      final filtered = state.filter.apply(init.tickets);

      emit(
        state.copyWith(
          status: TicketsStatus.success,
          allTickets: init.tickets,
          filteredTickets: filtered,
          pendingSyncCount: pending,
          isOffline: false,
          successMessage: () => count > 0 ? 'sync_success' : null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TicketsStatus.success,
          errorMessage: () => e.toString(),
        ),
      );
    }
  }

  /// مسح رسائل الخطأ والنجاح
  void clearMessages() {
    emit(state.copyWith(errorMessage: () => null, successMessage: () => null));
  }
}
