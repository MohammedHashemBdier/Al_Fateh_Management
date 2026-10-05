import 'dart:math';

import '../../../../core/errors/app_exception.dart';
import '../../domain/models/sync_operation.dart';
import '../../domain/models/ticket_model.dart';
import '../../domain/repositories/tickets_repository.dart';
import '../datasources/tickets_local_data_source.dart';
import '../datasources/tickets_remote_data_source.dart';

class TicketsRepositoryImpl implements TicketsRepository {
  final TicketsRemoteDataSource _remoteDataSource;
  final TicketsLocalDataSource _localDataSource;

  TicketsRepositoryImpl({
    TicketsRemoteDataSource? remoteDataSource,
    TicketsLocalDataSource? localDataSource,
  }) : _remoteDataSource = remoteDataSource ?? TicketsRemoteDataSourceImpl(),
       _localDataSource = localDataSource ?? TicketsLocalDataSourceImpl();

  @override
  Future<TicketsInitData> getInitialData({bool forceRefresh = false}) async {
    try {
      final remoteInit = await _remoteDataSource.fetchInitData();
      List<TicketModel> allTickets = remoteInit.tickets;

      // إذا كانت التذاكر المجلوبة من init أقل من 50 تذكرة، نجلب القائمة الموسعة حتى 1000 تذكرة
      if (allTickets.length < 50) {
        try {
          final fullTickets = await _remoteDataSource.fetchAllTickets(limit: 1000);
          if (fullTickets.isNotEmpty) {
            allTickets = fullTickets;
          }
        } catch (_) {}
      }

      final fullData = TicketsInitData(
        tickets: allTickets,
        problems: remoteInit.problems,
        statuses: remoteInit.statuses,
        employees: remoteInit.employees,
        totalCount: allTickets.length,
        isFromCache: false,
      );

      // حفظ في الكاش المحلي
      await _localDataSource.cacheTickets(allTickets);
      await _localDataSource.cacheInitMetadata(
        problems: fullData.problems,
        statuses: fullData.statuses,
        employees: fullData.employees,
      );
      return fullData;
    } catch (e) {
      // محاولة العودة للكاش المحلي عند فشل الشبكة أو انقطاع الاتصال
      final cached = await _localDataSource.getCachedInitData();
      if (cached != null && cached.tickets.isNotEmpty) {
        return TicketsInitData(
          tickets: cached.tickets,
          problems: cached.problems,
          statuses: cached.statuses,
          employees: cached.employees,
          totalCount: cached.totalCount,
          isFromCache: true,
        );
      }
      if (e is AppException) rethrow;
      throw NetworkException(e.toString());
    }
  }

  @override
  Future<List<TicketModel>> getAllTickets({
    int limit = 1000,
    bool forceRefresh = false,
  }) async {
    try {
      final remoteTickets = await _remoteDataSource.fetchAllTickets(
        limit: limit,
      );
      await _localDataSource.cacheTickets(remoteTickets);
      return remoteTickets;
    } catch (e) {
      final cached = await _localDataSource.getCachedTickets();
      if (cached.isNotEmpty) {
        return cached;
      }
      if (e is AppException) rethrow;
      throw NetworkException(e.toString());
    }
  }

  @override
  Future<TicketModel> addTicket(TicketModel ticket) async {
    final now = DateTime.now();
    final dateStr = ticket.date.isNotEmpty
        ? ticket.date
        : '${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}';
    final timeStr = ticket.time.isNotEmpty
        ? ticket.time
        : '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    final payload = {
      'subscriber_name': ticket.subscriberName,
      'landline': ticket.landline,
      'mobile': ticket.mobile,
      'problem': ticket.problem,
      'solution': ticket.solution,
      'status': ticket.status,
      'description': ticket.description,
      'employee': ticket.employee,
      'user_id': ticket.createdBy,
      'date': dateStr,
      'time': timeStr,
    };

    try {
      final remoteRowId = await _remoteDataSource.addTicket(payload);
      final syncedTicket = ticket.copyWith(
        rowId: remoteRowId,
        date: dateStr,
        time: timeStr,
        syncState: SyncState.synced,
        updatedAt: now,
      );
      await _localDataSource.saveLocalTicket(syncedTicket);
      return syncedTicket;
    } catch (e) {
      // في حالة انقطاع الإنترنت أو الخطأ، نحفظ أوفلاين مع معرف مؤقت
      final tempId = -Random().nextInt(999999) - 1;
      final offlineTicket = ticket.copyWith(
        rowId: tempId,
        date: dateStr,
        time: timeStr,
        syncState: SyncState.pendingAdd,
        updatedAt: now,
      );
      await _localDataSource.saveLocalTicket(offlineTicket);

      // إضافة لطابور المزامنة
      final op = SyncOperation(
        id: 'sync_add_${now.millisecondsSinceEpoch}',
        type: SyncOperationType.addTicket,
        payload: {...payload, 'temp_row_id': tempId},
        createdAt: now,
      );
      await _localDataSource.enqueueSyncOperation(op);

      return offlineTicket;
    }
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
    final now = DateTime.now();
    final payload = <String, dynamic>{'row_id': rowId, 'user_id': actorName};
    if (status != null) payload['status'] = status;
    if (solution != null) payload['solution'] = solution;
    if (description != null) payload['description'] = description;
    if (employee != null) payload['employee'] = employee;
    if (problem != null) payload['problem'] = problem;

    final auditEntry = TicketAuditEntry(
      actorName: actorName,
      action: 'ticket.update',
      timestamp: now.toIso8601String(),
      notes: auditNote ?? 'تحديث التذكرة',
    );

    try {
      await _remoteDataSource.updateTicket(payload);

      // تحديث محلي
      final cached = await _localDataSource.getCachedTickets();
      final idx = cached.indexWhere((t) => t.rowId == rowId);
      if (idx != -1) {
        final updated = cached[idx].copyWith(
          status: status ?? cached[idx].status,
          solution: solution ?? cached[idx].solution,
          description: description ?? cached[idx].description,
          employee: employee ?? cached[idx].employee,
          problem: problem ?? cached[idx].problem,
          syncState: SyncState.synced,
          auditTrail: [...cached[idx].auditTrail, auditEntry],
          updatedAt: now,
        );
        await _localDataSource.updateLocalTicket(updated);
        return updated;
      }
      return TicketModel(
        rowId: rowId,
        date: '',
        time: '',
        subscriberName: '',
        landline: '',
        problem: problem ?? '',
        solution: solution ?? '',
        status: status ?? 'قيد الحل',
        employee: employee ?? '',
        updatedAt: now,
      );
    } catch (e) {
      // فشل الاتصال، حفظ التعديل محلياً مع PendingUpdate
      final cached = await _localDataSource.getCachedTickets();
      final idx = cached.indexWhere((t) => t.rowId == rowId);
      TicketModel target;
      if (idx != -1) {
        target = cached[idx].copyWith(
          status: status ?? cached[idx].status,
          solution: solution ?? cached[idx].solution,
          description: description ?? cached[idx].description,
          employee: employee ?? cached[idx].employee,
          problem: problem ?? cached[idx].problem,
          syncState: SyncState.pendingUpdate,
          auditTrail: [...cached[idx].auditTrail, auditEntry],
          updatedAt: now,
        );
        await _localDataSource.updateLocalTicket(target);
      } else {
        target = TicketModel(
          rowId: rowId,
          date: '',
          time: '',
          subscriberName: '',
          landline: '',
          problem: problem ?? '',
          solution: solution ?? '',
          status: status ?? 'قيد الحل',
          employee: employee ?? '',
          syncState: SyncState.pendingUpdate,
          updatedAt: now,
        );
      }

      final op = SyncOperation(
        id: 'sync_update_${rowId}_${now.millisecondsSinceEpoch}',
        type: SyncOperationType.updateTicket,
        payload: payload,
        createdAt: now,
      );
      await _localDataSource.enqueueSyncOperation(op);

      return target;
    }
  }

  @override
  Future<int> closeAllOpenTickets({
    required List<TicketModel> openTickets,
    required String actorName,
    String? solution,
  }) async {
    int count = 0;
    final defaultSolution = (solution != null && solution.isNotEmpty)
        ? solution
        : 'إغلاق جماعي بواسطة الإدارة';

    for (final ticket in openTickets) {
      if (ticket.status == 'تم الحل') continue;
      try {
        await updateTicket(
          rowId: ticket.rowId,
          status: 'تم الحل',
          solution: ticket.solution.isNotEmpty
              ? ticket.solution
              : defaultSolution,
          actorName: actorName,
          auditNote: 'إغلاق جماعي من قبل $actorName',
        );
        count++;
      } catch (_) {
        // Fallback already handled inside updateTicket
      }
    }
    return count;
  }

  @override
  Future<bool> deleteTicket(
    int rowId, {
    required String actorName,
    String? reason,
  }) async {
    // 1. Delete from local cache immediately
    await _localDataSource.deleteLocalTicket(rowId);

    // 2. Attempt remote deletion
    try {
      return await _remoteDataSource.deleteTicket(
        rowId,
        actorName: actorName,
        reason: reason,
      );
    } catch (_) {
      // In case offline, enqueue sync operation
      final op = SyncOperation(
        id: 'sync_del_${rowId}_${DateTime.now().millisecondsSinceEpoch}',
        type: SyncOperationType.updateTicket,
        payload: {
          'action': 'delete',
          'row_id': rowId,
          'user_id': actorName,
          'reason': reason ?? '',
        },
        createdAt: DateTime.now(),
      );
      await _localDataSource.enqueueSyncOperation(op);
      return true;
    }
  }

  @override
  Future<List<String>> addProblemType(
    String problemName, {
    String? userId,
  }) async {
    try {
      final updated = await _remoteDataSource.addProblemType(
        problemName,
        userId: userId,
      );
      final meta = await _localDataSource.getCachedInitData();
      if (meta != null) {
        await _localDataSource.cacheInitMetadata(
          problems: updated,
          statuses: meta.statuses,
          employees: meta.employees,
        );
      }
      return updated;
    } catch (e) {
      // إضافة لطابور المزامنة في حال الأوفلاين
      final op = SyncOperation(
        id: 'sync_problem_${DateTime.now().millisecondsSinceEpoch}',
        type: SyncOperationType.addProblemType,
        payload: {'problem_name': problemName, 'user_id': userId},
        createdAt: DateTime.now(),
      );
      await _localDataSource.enqueueSyncOperation(op);

      final meta = await _localDataSource.getCachedInitData();
      final list = List<String>.from(meta?.problems ?? []);
      if (!list.contains(problemName)) list.add(problemName);
      return list;
    }
  }

  @override
  Future<int> processSyncQueue() async {
    final queue = await _localDataSource.getSyncQueue();
    if (queue.isEmpty) return 0;

    int successCount = 0;
    for (final op in queue) {
      try {
        switch (op.type) {
          case SyncOperationType.addTicket:
            final remoteRowId = await _remoteDataSource.addTicket(op.payload);
            final tempRowId = op.payload['temp_row_id'];
            if (tempRowId != null) {
              final cached = await _localDataSource.getCachedTickets();
              final idx = cached.indexWhere((t) => t.rowId == tempRowId);
              if (idx != -1) {
                cached[idx] = cached[idx].copyWith(
                  rowId: remoteRowId,
                  syncState: SyncState.synced,
                );
                await _localDataSource.cacheTickets(cached);
              }
            }
            await _localDataSource.removeSyncOperation(op.id);
            successCount++;
            break;

          case SyncOperationType.updateTicket:
            await _remoteDataSource.updateTicket(op.payload);
            final rowId = op.payload['row_id'] as int?;
            if (rowId != null) {
              final cached = await _localDataSource.getCachedTickets();
              final idx = cached.indexWhere((t) => t.rowId == rowId);
              if (idx != -1) {
                cached[idx] = cached[idx].copyWith(syncState: SyncState.synced);
                await _localDataSource.cacheTickets(cached);
              }
            }
            await _localDataSource.removeSyncOperation(op.id);
            successCount++;
            break;

          case SyncOperationType.addProblemType:
            final name = op.payload['problem_name']?.toString() ?? '';
            final user = op.payload['user_id']?.toString();
            await _remoteDataSource.addProblemType(name, userId: user);
            await _localDataSource.removeSyncOperation(op.id);
            successCount++;
            break;
        }
      } catch (e) {
        // تحديث عدد المحاولات والخطأ
        await _localDataSource.updateSyncOperation(
          op.copyWith(retryCount: op.retryCount + 1, lastError: e.toString()),
        );
      }
    }
    return successCount;
  }

  @override
  Future<int> getPendingSyncCount() {
    return _localDataSource.getPendingSyncCount();
  }

  @override
  Future<List<SyncOperation>> getPendingSyncOperations() {
    return _localDataSource.getSyncQueue();
  }
}
