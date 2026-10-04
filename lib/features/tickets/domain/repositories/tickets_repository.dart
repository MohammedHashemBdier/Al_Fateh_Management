import '../models/sync_operation.dart';
import '../models/ticket_model.dart';

/// نتيجة جلب البيانات الشاملة للتذاكر والتهيئة
class TicketsInitData {
  final List<TicketModel> tickets;
  final List<String> problems;
  final List<String> statuses;
  final List<String> employees;
  final int totalCount;
  final bool isFromCache;

  const TicketsInitData({
    required this.tickets,
    required this.problems,
    required this.statuses,
    required this.employees,
    required this.totalCount,
    this.isFromCache = false,
  });
}

/// العقد المعماري لمستودع إدارة التذاكر والدعم الفني
abstract class TicketsRepository {
  /// جلب التذاكر وبيانات التهيئة الأولية (المشاكل، الحالات، الموظفين)
  Future<TicketsInitData> getInitialData({bool forceRefresh = false});

  /// جلب قائمة جميع التذاكر من السيرفر أو الكاش المحلي
  Future<List<TicketModel>> getAllTickets({
    int limit = 200,
    bool forceRefresh = false,
  });

  /// إنشاء تذكرة جديدة (يدعم الحفظ أوفلاين مع الإضافة لطابور المزامنة)
  Future<TicketModel> addTicket(TicketModel ticket);

  /// تحديث حالة أو تفاصيل تذكرة (يدعم الأوفلاين مع سجل التدقيق)
  Future<TicketModel> updateTicket({
    required int rowId,
    String? status,
    String? solution,
    String? description,
    String? employee,
    String? problem,
    required String actorName,
    String? auditNote,
  });

  /// إغلاق كافة التذاكر المفتوحة دفعة واحدة (بصلاحيات الإدارة)
  Future<int> closeAllOpenTickets({
    required List<TicketModel> openTickets,
    required String actorName,
    String? solution,
  });

  /// حذف تذكرة نهائياً أو إزالتها محلياً
  Future<bool> deleteTicket(int rowId, {required String actorName, String? reason});

  /// إضافة نوع مشكلة جديد وحفظه في الشيت
  Future<List<String>> addProblemType(String problemName, {String? userId});

  /// تنفيذ عمليات طابور المزامنة المعلقة عند توفر الاتصال
  Future<int> processSyncQueue();

  /// جلب عدد العمليات المعلقة في طابور المزامنة
  Future<int> getPendingSyncCount();

  /// استرجاع العمليات المعلقة في طابور المزامنة
  Future<List<SyncOperation>> getPendingSyncOperations();
}
