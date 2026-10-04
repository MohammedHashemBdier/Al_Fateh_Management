import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/features/tickets/domain/models/ticket_filter.dart';
import 'package:al_fateh_management/features/tickets/domain/models/ticket_model.dart';
import 'package:al_fateh_management/features/tickets/domain/models/sync_operation.dart';
import 'package:al_fateh_management/features/tickets/domain/repositories/tickets_repository.dart';
import 'package:al_fateh_management/features/tickets/presentation/cubit/tickets_cubit.dart';
import 'package:al_fateh_management/features/tickets/presentation/cubit/tickets_state.dart';
import 'package:al_fateh_management/features/auth/domain/repositories/auth_repository.dart';
import 'package:al_fateh_management/features/auth/domain/models/auth_session.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';

class MockTicketsRepository implements TicketsRepository {
  List<TicketModel> mockTickets = [];
  List<String> mockProblems = ['انقطاع إشارة', 'بطء تصفح'];
  List<String> mockStatuses = ['قيد الحل', 'تم الحل', 'لم يتم الحل'];
  List<String> mockEmployees = ['محمد هاشم بدير', 'سام قصاب'];
  int pendingSync = 0;

  @override
  Future<TicketsInitData> getInitialData({bool forceRefresh = false}) async {
    return TicketsInitData(
      tickets: List.of(mockTickets),
      problems: List.of(mockProblems),
      statuses: List.of(mockStatuses),
      employees: List.of(mockEmployees),
      totalCount: mockTickets.length,
      isFromCache: false,
    );
  }

  @override
  Future<List<TicketModel>> getAllTickets({int limit = 200, bool forceRefresh = false}) async {
    return List.of(mockTickets);
  }

  @override
  Future<TicketModel> addTicket(TicketModel ticket) async {
    return ticket.copyWith(rowId: 101);
  }

  @override
  Future<TicketModel> updateTicket({
    required int rowId,
    String? status,
    String? solution,
    String? description,
    String? employee,
    String? problem,
    required String actorName,
    String? auditNote,
  }) async {
    final idx = mockTickets.indexWhere((t) => t.rowId == rowId);
    if (idx != -1) {
      final updated = mockTickets[idx].copyWith(
        status: status ?? mockTickets[idx].status,
        solution: solution ?? mockTickets[idx].solution,
      );
      mockTickets[idx] = updated;
      return updated;
    }
    throw Exception('Ticket not found');
  }

  @override
  Future<int> closeAllOpenTickets({
    required List<TicketModel> openTickets,
    required String actorName,
    String? solution,
  }) async {
    int count = 0;
    for (int i = 0; i < mockTickets.length; i++) {
      if (mockTickets[i].status != 'تم الحل') {
        mockTickets[i] = mockTickets[i].copyWith(
          status: 'تم الحل',
          solution: solution ?? 'تم الحل بواسطة الإدارة',
        );
        count++;
      }
    }
    return count;
  }

  @override
  Future<List<String>> addProblemType(String problemName, {String? userId}) async {
    if (!mockProblems.contains(problemName)) {
      mockProblems.add(problemName);
    }
    return mockProblems;
  }

  @override
  Future<int> processSyncQueue() async {
    final processed = pendingSync;
    pendingSync = 0;
    return processed;
  }

  @override
  Future<int> getPendingSyncCount() async => pendingSync;

  @override
  Future<List<SyncOperation>> getPendingSyncOperations() async => [];

  @override
  Future<bool> deleteTicket(int rowId, {required String actorName, String? reason}) async {
    mockTickets.removeWhere((t) => t.rowId == rowId);
    return true;
  }
}

class MockAuthRepository implements AuthRepository {
  @override
  Future<AuthSession> login({required String username, required String password, bool rememberMe = true}) async {
    throw UnimplementedError();
  }

  @override
  Future<AuthSession?> getSavedSession() async {
    return AuthSession(
      sessionToken: 'fake_token',
      loginTime: DateTime.now(),
      user: const UserModel(
        userId: 'USR-001',
        username: 'admin',
        fullName: 'مدير النظام',
        department: 'MANAGEMENT',
        roleId: 'ROLE_ADMIN',
        status: 'ACTIVE',
      ),
    );
  }

  @override
  Future<void> logout() async {}

  @override
  Future<String?> getRememberedUsername() async => 'admin';

  @override
  Future<void> saveRememberedUsername(String? username) async {}
}

void main() {
  late MockTicketsRepository mockRepo;
  late MockAuthRepository mockAuthRepo;
  late TicketsCubit cubit;

  setUp(() {
    mockRepo = MockTicketsRepository();
    mockAuthRepo = MockAuthRepository();

    mockRepo.mockTickets = [
      TicketModel(
        rowId: 1,
        date: '2026/10/01',
        time: '10:00',
        subscriberName: 'أحمد محمود',
        landline: '0112345678',
        problem: 'انقطاع إشارة',
        solution: '',
        status: 'قيد الحل',
        employee: 'محمد هاشم بدير',
        updatedAt: DateTime.now(),
      ),
      TicketModel(
        rowId: 2,
        date: '2026/10/02',
        time: '11:00',
        subscriberName: 'خالد علي',
        landline: '0118765432',
        problem: 'بطء تصفح',
        solution: 'إعادة تهيئة الراوتر',
        status: 'تم الحل',
        employee: 'سام قصاب',
        updatedAt: DateTime.now(),
      ),
    ];

    cubit = TicketsCubit(
      repository: mockRepo,
      authRepository: mockAuthRepo,
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('TicketsCubit Tests', () {
    test('initial state has default parameters', () {
      expect(cubit.state.status, TicketsStatus.initial);
      expect(cubit.state.allTickets, isEmpty);
      expect(cubit.state.currentPage, 1);
    });

    test('loadTickets successfully populates state and currentUser', () async {
      await cubit.loadTickets();

      expect(cubit.state.status, TicketsStatus.success);
      expect(cubit.state.allTickets.length, 2);
      expect(cubit.state.currentUser?.fullName, 'مدير النظام');
      expect(cubit.state.problemTypes, contains('انقطاع إشارة'));
      expect(cubit.state.filteredTickets.length, 2);
    });

    test('applyFilter filters by status properly', () async {
      await cubit.loadTickets();

      cubit.applyFilter(const TicketFilterModel(status: TicketStatus.resolved));
      expect(cubit.state.filteredTickets.length, 1);
      expect(cubit.state.filteredTickets.first.subscriberName, 'خالد علي');
    });

    test('applyFilter filters by search query on subscriber name or landline', () async {
      await cubit.loadTickets();

      cubit.applyFilter(const TicketFilterModel(searchQuery: '8765'));
      expect(cubit.state.filteredTickets.length, 1);
      expect(cubit.state.filteredTickets.first.landline, '0118765432');
    });

    test('sort orders tickets properly', () async {
      await cubit.loadTickets();

      cubit.sort(TicketSortField.subscriberName);
      expect(cubit.state.filteredTickets.first.subscriberName, 'أحمد محمود');

      cubit.sort(TicketSortField.subscriberName); // toggle descending
      expect(cubit.state.filteredTickets.first.subscriberName, 'خالد علي');
    });

    test('addTicket adds ticket and updates list', () async {
      await cubit.loadTickets();

      final newTicket = TicketModel(
        rowId: 0,
        date: '2026/10/03',
        time: '12:00',
        subscriberName: 'عمر شامي',
        landline: '0119999999',
        problem: 'انقطاع إشارة',
        status: 'قيد الحل',
        employee: 'محمد هاشم بدير',
        updatedAt: DateTime.now(),
      );

      final success = await cubit.addTicket(newTicket);
      expect(success, isTrue);
      expect(cubit.state.allTickets.length, 3);
      expect(cubit.state.allTickets.first.subscriberName, 'عمر شامي');
    });

    test('updateTicket modifies status and solution', () async {
      await cubit.loadTickets();

      final success = await cubit.updateTicket(
        rowId: 1,
        status: 'تم الحل',
        solution: 'تم تبديل السلك',
        actorName: 'مدير النظام',
      );

      expect(success, isTrue);
      final updated = cubit.state.allTickets.firstWhere((t) => t.rowId == 1);
      expect(updated.status, 'تم الحل');
      expect(updated.solution, 'تم تبديل السلك');
    });

    test('addProblemType adds new problem type to state', () async {
      await cubit.loadTickets();

      final success = await cubit.addProblemType('فصل متكرر في البورت');
      expect(success, isTrue);
      expect(cubit.state.problemTypes, contains('فصل متكرر في البورت'));
    });

    test('closeAllOpenTickets marks all open tickets as resolved', () async {
      await cubit.loadTickets();
      expect(cubit.state.allTickets.where((t) => t.status != 'تم الحل').length, 1);

      final closedCount = await cubit.closeAllOpenTickets(solution: 'إغلاق شامل من الإدارة');
      expect(closedCount, 1);
      expect(cubit.state.allTickets.every((t) => t.status == 'تم الحل'), isTrue);
    });
  });
}
