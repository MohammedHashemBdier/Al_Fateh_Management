import 'ticket_model.dart';

/// خيارات ترتيب التذاكر
enum TicketSortField { rowId, date, subscriberName, landline, status, employee }

enum SortDirection { ascending, descending }

/// كائن الفلترة المتقدم لجدول وبطاقات التذاكر
class TicketFilterModel {
  final String searchQuery;
  final TicketStatus? status;
  final String? problemType;
  final String? assignedEmployee;
  final DateTime? startDate;
  final DateTime? endDate;
  final TicketSortField sortField;
  final SortDirection sortDirection;

  const TicketFilterModel({
    this.searchQuery = '',
    this.status,
    this.problemType,
    this.assignedEmployee,
    this.startDate,
    this.endDate,
    this.sortField = TicketSortField.rowId,
    this.sortDirection = SortDirection.descending,
  });

  bool get hasActiveFilters =>
      searchQuery.trim().isNotEmpty ||
      status != null ||
      (problemType != null && problemType!.isNotEmpty) ||
      (assignedEmployee != null && assignedEmployee!.isNotEmpty) ||
      startDate != null ||
      endDate != null;

  TicketFilterModel copyWith({
    String? searchQuery,
    TicketStatus? Function()? status,
    String? Function()? problemType,
    String? Function()? assignedEmployee,
    DateTime? Function()? startDate,
    DateTime? Function()? endDate,
    TicketSortField? sortField,
    SortDirection? sortDirection,
  }) {
    return TicketFilterModel(
      searchQuery: searchQuery ?? this.searchQuery,
      status: status != null ? status() : this.status,
      problemType: problemType != null ? problemType() : this.problemType,
      assignedEmployee: assignedEmployee != null
          ? assignedEmployee()
          : this.assignedEmployee,
      startDate: startDate != null ? startDate() : this.startDate,
      endDate: endDate != null ? endDate() : this.endDate,
      sortField: sortField ?? this.sortField,
      sortDirection: sortDirection ?? this.sortDirection,
    );
  }

  /// مسح جميع الفلاتر مع الإبقاء على اتجاه الترتيب
  TicketFilterModel clear() {
    return const TicketFilterModel();
  }

  /// تطبيق معايير الفلترة والترتيب على قائمة التذاكر
  List<TicketModel> apply(List<TicketModel> tickets) {
    var result = tickets.where((ticket) {
      // 1. فحص البحث الفوري (اسم المشترك، الهاتف الأرضي، الموبايل، المشكلة، رقم التذكرة)
      if (searchQuery.trim().isNotEmpty) {
        final q = searchQuery.trim().toLowerCase();
        final matchesQuery =
            ticket.subscriberName.toLowerCase().contains(q) ||
            ticket.landline.toLowerCase().contains(q) ||
            ticket.mobile.toLowerCase().contains(q) ||
            ticket.problem.toLowerCase().contains(q) ||
            ticket.rowId.toString().contains(q) ||
            ticket.employee.toLowerCase().contains(q) ||
            ticket.description.toLowerCase().contains(q) ||
            ticket.solution.toLowerCase().contains(q);

        if (!matchesQuery) return false;
      }

      // 2. فلتر الحالة
      if (status != null && ticket.statusEnum != status) {
        return false;
      }

      // 3. فلتر نوع المشكلة
      if (problemType != null &&
          problemType!.isNotEmpty &&
          ticket.problem.trim() != problemType!.trim()) {
        return false;
      }

      // 4. فلتر الموظف المسند إليه
      if (assignedEmployee != null &&
          assignedEmployee!.isNotEmpty &&
          ticket.employee.trim() != assignedEmployee!.trim()) {
        return false;
      }

      // 5. فلتر نطاق التاريخ
      if (startDate != null || endDate != null) {
        final ticketDate = _parseTicketDate(ticket.date);
        if (ticketDate != null) {
          if (startDate != null &&
              ticketDate.isBefore(_startOfDay(startDate!))) {
            return false;
          }
          if (endDate != null && ticketDate.isAfter(_endOfDay(endDate!))) {
            return false;
          }
        }
      }

      return true;
    }).toList();

    // تطبيق الترتيب
    result.sort((a, b) {
      int cmp = 0;
      switch (sortField) {
        case TicketSortField.rowId:
          cmp = a.rowId.compareTo(b.rowId);
          break;
        case TicketSortField.subscriberName:
          cmp = a.subscriberName.compareTo(b.subscriberName);
          break;
        case TicketSortField.landline:
          cmp = a.landline.compareTo(b.landline);
          break;
        case TicketSortField.status:
          cmp = a.status.compareTo(b.status);
          break;
        case TicketSortField.employee:
          cmp = a.employee.compareTo(b.employee);
          break;
        case TicketSortField.date:
          final da = _parseTicketDate(a.date) ?? DateTime(2000);
          final db = _parseTicketDate(b.date) ?? DateTime(2000);
          cmp = da.compareTo(db);
          break;
      }
      return sortDirection == SortDirection.ascending ? cmp : -cmp;
    });

    return result;
  }

  DateTime? _parseTicketDate(String dateStr) {
    if (dateStr.isEmpty) return null;
    final clean = dateStr.replaceAll('/', '-');
    return DateTime.tryParse(clean);
  }

  DateTime _startOfDay(DateTime dt) =>
      DateTime(dt.year, dt.month, dt.day, 0, 0, 0);
  DateTime _endOfDay(DateTime dt) =>
      DateTime(dt.year, dt.month, dt.day, 23, 59, 59, 999);
}
