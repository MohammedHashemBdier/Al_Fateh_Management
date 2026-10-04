import '../../../auth/domain/models/user_model.dart';
import '../../domain/models/ticket_filter.dart';
import '../../domain/models/ticket_model.dart';

enum TicketsStatus {
  initial,
  loading,
  success,
  failure,
  syncing,
  actionLoading,
}

class TicketsState {
  final TicketsStatus status;
  final UserModel? currentUser;
  final List<TicketModel> allTickets;
  final List<TicketModel> filteredTickets;
  final List<String> problemTypes;
  final List<String> statusList;
  final List<String> employeeList;
  final TicketFilterModel filter;
  final int currentPage;
  final int pageSize;
  final bool? isTableView;
  final Set<int> selectedTicketIds;
  final int pendingSyncCount;
  final bool isOffline;
  final String? errorMessage;
  final String? successMessage;

  const TicketsState({
    this.status = TicketsStatus.initial,
    this.currentUser,
    this.allTickets = const [],
    this.filteredTickets = const [],
    this.problemTypes = const [],
    this.statusList = const [],
    this.employeeList = const [],
    this.filter = const TicketFilterModel(),
    this.currentPage = 1,
    this.pageSize = 20,
    this.isTableView,
    this.selectedTicketIds = const {},
    this.pendingSyncCount = 0,
    this.isOffline = false,
    this.errorMessage,
    this.successMessage,
  });

  /// تحديد هل يتم عرض الجدول أم البطاقات بناءً على حجم الشاشة أو تفضيل المستخدم
  bool showTableView(bool isCompact) => isTableView ?? !isCompact;

  /// إجمالي عدد الصفحات بعد الفلترة
  int get totalPages =>
      (filteredTickets.isEmpty) ? 1 : ((filteredTickets.length - 1) ~/ pageSize) + 1;

  /// قائمة التذاكر الخاصة بالصفحة المعروضة حالياً
  List<TicketModel> get paginatedTickets {
    if (filteredTickets.isEmpty) return [];
    final start = (currentPage - 1) * pageSize;
    if (start >= filteredTickets.length) return [];
    final end = (start + pageSize).clamp(0, filteredTickets.length);
    return filteredTickets.sublist(start, end);
  }

  bool get isLoading => status == TicketsStatus.loading;
  bool get isActionLoading => status == TicketsStatus.actionLoading;
  bool get isSyncing => status == TicketsStatus.syncing;

  TicketsState copyWith({
    TicketsStatus? status,
    UserModel? currentUser,
    List<TicketModel>? allTickets,
    List<TicketModel>? filteredTickets,
    List<String>? problemTypes,
    List<String>? statusList,
    List<String>? employeeList,
    TicketFilterModel? filter,
    int? currentPage,
    int? pageSize,
    bool? isTableView,
    Set<int>? selectedTicketIds,
    int? pendingSyncCount,
    bool? isOffline,
    String? Function()? errorMessage,
    String? Function()? successMessage,
  }) {
    return TicketsState(
      status: status ?? this.status,
      currentUser: currentUser ?? this.currentUser,
      allTickets: allTickets ?? this.allTickets,
      filteredTickets: filteredTickets ?? this.filteredTickets,
      problemTypes: problemTypes ?? this.problemTypes,
      statusList: statusList ?? this.statusList,
      employeeList: employeeList ?? this.employeeList,
      filter: filter ?? this.filter,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      isTableView: isTableView ?? this.isTableView,
      selectedTicketIds: selectedTicketIds ?? this.selectedTicketIds,
      pendingSyncCount: pendingSyncCount ?? this.pendingSyncCount,
      isOffline: isOffline ?? this.isOffline,
      errorMessage:
          errorMessage != null ? errorMessage() : this.errorMessage,
      successMessage:
          successMessage != null ? successMessage() : this.successMessage,
    );
  }
}
