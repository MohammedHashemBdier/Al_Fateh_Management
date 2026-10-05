import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_crypto.dart';
import '../../domain/models/sync_operation.dart';
import '../../domain/models/ticket_model.dart';
import '../../domain/repositories/tickets_repository.dart';

abstract class TicketsLocalDataSource {
  Future<void> cacheTickets(List<TicketModel> tickets);
  Future<List<TicketModel>> getCachedTickets();
  Future<void> cacheInitMetadata({
    required List<String> problems,
    required List<String> statuses,
    required List<String> employees,
  });
  Future<TicketsInitData?> getCachedInitData();
  Future<void> enqueueSyncOperation(SyncOperation op);
  Future<List<SyncOperation>> getSyncQueue();
  Future<void> removeSyncOperation(String opId);
  Future<void> updateSyncOperation(SyncOperation op);
  Future<int> getPendingSyncCount();
  Future<void> saveLocalTicket(TicketModel ticket);
  Future<void> updateLocalTicket(TicketModel ticket);
  Future<void> deleteLocalTicket(int rowId);
}

class TicketsLocalDataSourceImpl implements TicketsLocalDataSource {
  static const String _keyCachedTickets = 'alfateh_cached_tickets_enc';
  static const String _keyCachedMetadata = 'alfateh_cached_tickets_meta_enc';
  static const String _keySyncQueue = 'alfateh_tickets_sync_queue_enc';

  @override
  Future<void> cacheTickets(List<TicketModel> tickets) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = tickets.map((t) => t.toJson()).toList();
    final jsonStr = jsonEncode(jsonList);
    final encrypted = AppCrypto.encryptData(jsonStr);
    await prefs.setString(_keyCachedTickets, encrypted);
  }

  @override
  Future<List<TicketModel>> getCachedTickets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encrypted = prefs.getString(_keyCachedTickets);
      if (encrypted == null || encrypted.isEmpty) return [];

      final jsonStr = AppCrypto.decryptData(encrypted);
      final decoded = jsonDecode(jsonStr);
      if (decoded is List) {
        return decoded
            .whereType<Map<String, dynamic>>()
            .map((e) => TicketModel.fromJson(e))
            .toList();
      }
    } catch (_) {}
    return [];
  }

  @override
  Future<void> cacheInitMetadata({
    required List<String> problems,
    required List<String> statuses,
    required List<String> employees,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final data = {
      'problems': problems,
      'statuses': statuses,
      'employees': employees,
      'cached_at': DateTime.now().toIso8601String(),
    };
    final encrypted = AppCrypto.encryptData(jsonEncode(data));
    await prefs.setString(_keyCachedMetadata, encrypted);
  }

  @override
  Future<TicketsInitData?> getCachedInitData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encrypted = prefs.getString(_keyCachedMetadata);
      if (encrypted == null || encrypted.isEmpty) return null;

      final jsonStr = AppCrypto.decryptData(encrypted);
      final map = jsonDecode(jsonStr) as Map<String, dynamic>;
      final tickets = await getCachedTickets();

      return TicketsInitData(
        tickets: tickets,
        problems:
            (map['problems'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        statuses:
            (map['statuses'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        employees:
            (map['employees'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        totalCount: tickets.length,
        isFromCache: true,
      );
    } catch (_) {}
    return null;
  }

  @override
  Future<void> enqueueSyncOperation(SyncOperation op) async {
    final queue = await getSyncQueue();
    queue.add(op);
    await _saveQueue(queue);
  }

  @override
  Future<List<SyncOperation>> getSyncQueue() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encrypted = prefs.getString(_keySyncQueue);
      if (encrypted == null || encrypted.isEmpty) return [];

      final jsonStr = AppCrypto.decryptData(encrypted);
      final decoded = jsonDecode(jsonStr);
      if (decoded is List) {
        return decoded
            .whereType<Map<String, dynamic>>()
            .map((e) => SyncOperation.fromJson(e))
            .toList();
      }
    } catch (_) {}
    return [];
  }

  @override
  Future<void> removeSyncOperation(String opId) async {
    final queue = await getSyncQueue();
    queue.removeWhere((e) => e.id == opId);
    await _saveQueue(queue);
  }

  @override
  Future<void> updateSyncOperation(SyncOperation op) async {
    final queue = await getSyncQueue();
    final idx = queue.indexWhere((e) => e.id == op.id);
    if (idx != -1) {
      queue[idx] = op;
      await _saveQueue(queue);
    }
  }

  @override
  Future<int> getPendingSyncCount() async {
    final queue = await getSyncQueue();
    return queue.length;
  }

  @override
  Future<void> saveLocalTicket(TicketModel ticket) async {
    final tickets = await getCachedTickets();
    tickets.insert(0, ticket);
    await cacheTickets(tickets);
  }

  @override
  Future<void> updateLocalTicket(TicketModel ticket) async {
    final tickets = await getCachedTickets();
    final idx = tickets.indexWhere((t) => t.rowId == ticket.rowId);
    if (idx != -1) {
      tickets[idx] = ticket;
    } else {
      tickets.insert(0, ticket);
    }
    await cacheTickets(tickets);
  }

  @override
  Future<void> deleteLocalTicket(int rowId) async {
    final tickets = await getCachedTickets();
    tickets.removeWhere((t) => t.rowId == rowId);
    await cacheTickets(tickets);
  }

  Future<void> _saveQueue(List<SyncOperation> queue) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = queue.map((e) => e.toJson()).toList();
    final encrypted = AppCrypto.encryptData(jsonEncode(jsonList));
    await prefs.setString(_keySyncQueue, encrypted);
  }
}
