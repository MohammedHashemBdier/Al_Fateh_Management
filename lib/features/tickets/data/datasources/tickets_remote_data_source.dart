import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/models/ticket_model.dart';
import '../../domain/repositories/tickets_repository.dart';

abstract class TicketsRemoteDataSource {
  Future<TicketsInitData> fetchInitData();
  Future<List<TicketModel>> fetchAllTickets({int limit = 1000});
  Future<int> addTicket(Map<String, dynamic> params);
  Future<bool> updateTicket(Map<String, dynamic> params);
  Future<bool> deleteTicket(
    int rowId, {
    required String actorName,
    String? reason,
  });
  Future<List<String>> addProblemType(String problemName, {String? userId});
}

class TicketsRemoteDataSourceImpl implements TicketsRemoteDataSource {
  final DioClient _dioClient;

  TicketsRemoteDataSourceImpl({DioClient? dioClient})
    : _dioClient = dioClient ?? DioClient();

  @override
  Future<TicketsInitData> fetchInitData() async {
    try {
      final response = await _dioClient.get(
        ApiEndpoints.defaultBaseUrl,
        queryParameters: {'action': ApiEndpoints.actionInit},
      );
      final data = _parseResponse(response);

      if (data['success'] == true) {
        final problemsRaw = (data['problems'] as List<dynamic>?) ?? [];
        final statusesRaw = (data['statuses'] as List<dynamic>?) ?? [];
        final employeesRaw = (data['employees'] as List<dynamic>?) ?? [];
        final recentRaw = (data['recent_tickets'] as List<dynamic>?) ?? [];

        final tickets = recentRaw.map((e) {
          final map = (e as Map<String, dynamic>?) ?? {};
          return TicketModel(
            rowId: int.tryParse(map['row_id']?.toString() ?? '0') ?? 0,
            date: map['date']?.toString() ?? '',
            time: map['time']?.toString() ?? '',
            subscriberName: map['subscriber_name']?.toString() ?? '',
            landline: map['landline']?.toString() ?? '',
            problem: map['problem']?.toString() ?? '',
            solution: map['solution']?.toString() ?? '',
            status: map['status']?.toString() ?? 'قيد الحل',
            description: map['description']?.toString() ?? '',
            employee: map['employee']?.toString() ?? '',
            updatedAt: DateTime.now(),
          );
        }).toList();

        return TicketsInitData(
          tickets: tickets,
          problems: problemsRaw.map((e) => e.toString().trim()).toList(),
          statuses: statusesRaw.map((e) => e.toString().trim()).toList(),
          employees: employeesRaw.map((e) => e.toString().trim()).toList(),
          totalCount: tickets.length,
          isFromCache: false,
        );
      } else {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to initialize tickets',
        );
      }
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Network error fetching tickets');
    }
  }

  @override
  Future<List<TicketModel>> fetchAllTickets({int limit = 1000}) async {
    try {
      final response = await _dioClient.get(
        ApiEndpoints.defaultBaseUrl,
        queryParameters: {
          'action': ApiEndpoints.actionGetAll,
          'limit': limit.toString(),
        },
      );
      final data = _parseResponse(response);

      if (data['success'] == true) {
        final rawList = (data['tickets'] as List<dynamic>?) ?? [];
        return rawList.map((e) {
          final map = (e as Map<String, dynamic>?) ?? {};
          return TicketModel(
            rowId: int.tryParse(map['row_id']?.toString() ?? '0') ?? 0,
            date: map['date']?.toString() ?? '',
            time: map['time']?.toString() ?? '',
            subscriberName: map['subscriber_name']?.toString() ?? '',
            landline: map['landline']?.toString() ?? '',
            problem: map['problem']?.toString() ?? '',
            solution: map['solution']?.toString() ?? '',
            status: map['status']?.toString() ?? 'قيد الحل',
            description: map['description']?.toString() ?? '',
            employee: map['employee']?.toString() ?? '',
            updatedAt: DateTime.now(),
          );
        }).toList();
      } else {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to fetch tickets',
        );
      }
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Network error fetching tickets');
    }
  }

  @override
  Future<int> addTicket(Map<String, dynamic> params) async {
    try {
      final body = Map<String, dynamic>.from(params);
      body['action'] = ApiEndpoints.actionAdd;

      final response = await _dioClient.post(
        ApiEndpoints.defaultBaseUrl,
        data: body,
      );
      final data = _parseResponse(response);

      if (data['success'] == true) {
        return int.tryParse(data['row_id']?.toString() ?? '0') ?? 0;
      } else {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to add ticket',
        );
      }
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Network error adding ticket');
    }
  }

  @override
  Future<bool> updateTicket(Map<String, dynamic> params) async {
    try {
      final body = Map<String, dynamic>.from(params);
      body['action'] = ApiEndpoints.actionUpdate;

      final response = await _dioClient.post(
        ApiEndpoints.defaultBaseUrl,
        data: body,
      );
      final data = _parseResponse(response);

      if (data['success'] == true) {
        return true;
      } else {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to update ticket',
        );
      }
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Network error updating ticket');
    }
  }

  @override
  Future<bool> deleteTicket(
    int rowId, {
    required String actorName,
    String? reason,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.defaultBaseUrl,
        data: {
          'action': 'delete',
          'row_id': rowId,
          'user_id': actorName,
          'reason': reason ?? '',
        },
      );
      final data = _parseResponse(response);
      return data['success'] == true;
    } catch (_) {
      // In case GAS soft-deletes or accepts queue
      return true;
    }
  }

  @override
  Future<List<String>> addProblemType(
    String problemName, {
    String? userId,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.defaultBaseUrl,
        data: {
          'action': ApiEndpoints.actionAddProblem,
          'problem_name': problemName,
          'user_id': userId ?? 'ANON',
        },
      );
      final data = _parseResponse(response);

      if (data['success'] == true && data['problems'] is List) {
        final list = data['problems'] as List;
        return list.map((e) => e.toString().trim()).toList();
      } else {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to add problem type',
        );
      }
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Network error adding problem type');
    }
  }

  Map<String, dynamic> _parseResponse(Response response) {
    dynamic data = response.data;
    if (data is String) {
      try {
        data = jsonDecode(data);
      } catch (_) {}
    }
    if (data is Map<String, dynamic>) {
      return data;
    }
    if (data is Map) {
      return Map<String, dynamic>.from(data);
    }
    return {'success': false, 'message': 'Unknown response format'};
  }
}
