// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';

void main() async {
  const baseUrl =
      'https://script.google.com/macros/s/AKfycbwW7Ii78ftHFew0g2wxCfyWVaiax3VI9g2NtgMFdd8uocI2GaBWcnm1PhQov7Q4-nY4/exec';

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 45),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 45),
      followRedirects: false,
      validateStatus: (status) => status != null && status < 400,
    ),
  );

  Future<Map<String, dynamic>> sendRequest({
    required String action,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
    bool isPost = false,
  }) async {
    final qParams = <String, dynamic>{'action': action, ...?queryParams};

    Response response;
    if (isPost) {
      response = await dio.post(
        '',
        queryParameters: qParams,
        data: data != null ? jsonEncode(data) : null,
        options: Options(contentType: 'application/json'),
      );
    } else {
      response = await dio.get('', queryParameters: qParams);
    }

    if (response.statusCode == 302 || response.statusCode == 301) {
      final location = response.headers.value('location');
      if (location != null && location.isNotEmpty) {
        final redirectRes = await Dio().get(location);
        if (redirectRes.data is String) {
          return jsonDecode(redirectRes.data as String) as Map<String, dynamic>;
        }
        return redirectRes.data as Map<String, dynamic>;
      }
    }

    if (response.data is String) {
      return jsonDecode(response.data as String) as Map<String, dynamic>;
    }
    return response.data as Map<String, dynamic>;
  }

  print('====================================================');
  print('    Al-Fateh Enterprise Full Attendance E2E Test    ');
  print('====================================================\n');

  // 1. Test Config
  print('--- 1. Testing system.getConfig ---');
  try {
    final res = await sendRequest(action: 'system.getConfig');
    print('getConfig Success: ${res['success']} | Config: ${res['config']}');
  } catch (e) {
    print('getConfig Error: $e');
  }

  // 2. Test Sites
  print('\n--- 2. Testing sites.getAll ---');
  try {
    final res = await sendRequest(action: 'sites.getAll');
    print(
      'sites Success: ${res['success']} | Sites count: ${(res['sites'] as List?)?.length}',
    );
  } catch (e) {
    print('sites Error: $e');
  }

  // 3. Test Shifts - Add, Get, Update, Delete
  print('\n--- 3. Testing shifts.add ---');
  final testShiftId =
      'SH-TEST-${DateTime.now().millisecondsSinceEpoch % 10000}';
  try {
    final res = await sendRequest(
      action: 'shifts.add',
      isPost: true,
      data: {
        'shift_id': testShiftId,
        'shift_name': 'وردية تجريبية مؤتمتة',
        'start_time': '09:00',
        'end_time': '17:00',
        'grace_period_mins': 15,
        'standard_hours': 8.0,
      },
    );
    print(
      'shifts.add Success: ${res['success']} | Message: ${res['message'] ?? res['error']}',
    );
  } catch (e) {
    print('shifts.add Error: $e');
  }

  print('\n--- 4. Testing shifts.getAll ---');
  try {
    final res = await sendRequest(action: 'shifts.getAll');
    final shifts = res['shifts'] as List? ?? [];
    print('shifts.getAll Success: ${res['success']} | Count: ${shifts.length}');
  } catch (e) {
    print('shifts.getAll Error: $e');
  }

  print('\n--- 5. Testing shifts.update ---');
  try {
    final res = await sendRequest(
      action: 'shifts.update',
      isPost: true,
      data: {
        'shift_id': testShiftId,
        'shift_name': 'وردية تجريبية معدلة',
        'start_time': '09:30',
        'end_time': '17:30',
        'grace_period_mins': 20,
        'standard_hours': 8.0,
      },
    );
    print(
      'shifts.update Success: ${res['success']} | Message: ${res['message'] ?? res['error']}',
    );
  } catch (e) {
    print('shifts.update Error: $e');
  }

  print('\n--- 6. Testing shifts.delete ---');
  try {
    final res = await sendRequest(
      action: 'shifts.delete',
      isPost: true,
      data: {'shift_id': testShiftId},
    );
    print(
      'shifts.delete Success: ${res['success']} | Message: ${res['message'] ?? res['error']}',
    );
  } catch (e) {
    print('shifts.delete Error: $e');
  }

  // 7. Test Check-In (HQ coords: 33.5138, 36.2765)
  print('\n--- 7. Testing attendance.checkIn ---');
  try {
    final res = await sendRequest(
      action: 'attendance.checkIn',
      isPost: true,
      data: {
        'user_id': 'USR-002',
        'lat': 33.5138,
        'lng': 36.2765,
        'site_id': 'SITE-HQ',
        'is_mock': false,
      },
    );
    print(
      'checkIn Success: ${res['success']} | Message: ${res['message'] ?? res['error']}',
    );
  } catch (e) {
    print('checkIn Error: $e');
  }

  // 8. Test TodayStatus
  print('\n--- 8. Testing attendance.getTodayStatus ---');
  try {
    final res = await sendRequest(
      action: 'attendance.getTodayStatus',
      queryParams: {'user_id': 'USR-002'},
    );
    print(
      'todayStatus Success: ${res['success']} | Data: ${res['today_status']}',
    );
  } catch (e) {
    print('todayStatus Error: $e');
  }

  // 9. Test Check-Out
  print('\n--- 9. Testing attendance.checkOut ---');
  try {
    final res = await sendRequest(
      action: 'attendance.checkOut',
      isPost: true,
      data: {
        'user_id': 'USR-002',
        'lat': 33.5138,
        'lng': 36.2765,
        'site_id': 'SITE-HQ',
        'is_mock': false,
      },
    );
    print(
      'checkOut Success: ${res['success']} | Message: ${res['message'] ?? res['error']}',
    );
  } catch (e) {
    print('checkOut Error: $e');
  }

  // 10. Test Correction Request
  print('\n--- 10. Testing corrections.request ---');
  String? createdReqId;
  try {
    final res = await sendRequest(
      action: 'corrections.request',
      isPost: true,
      data: {
        'user_id': 'USR-002',
        'date': '2026-10-07',
        'requested_check_in': '08:00',
        'requested_check_out': '16:00',
        'reason': 'نسيان تسجيل الحضور صباحاً - اختبار آلي',
      },
    );
    print(
      'correction.request Success: ${res['success']} | Message: ${res['message'] ?? res['error']}',
    );
    createdReqId = res['request_id'] as String?;
  } catch (e) {
    print('correction.request Error: $e');
  }

  // 11. Test Correction Approval
  if (createdReqId != null) {
    print('\n--- 11. Testing corrections.approve ---');
    try {
      final res = await sendRequest(
        action: 'corrections.approve',
        isPost: true,
        data: {
          'request_id': createdReqId,
          'approver_id': 'USR-001',
          'decision': 'APPROVED',
          'notes': 'تم الاعتماد بنجاح في الاختبار الآلي',
        },
      );
      print(
        'correction.approve Success: ${res['success']} | Message: ${res['message'] ?? res['error']}',
      );
    } catch (e) {
      print('correction.approve Error: $e');
    }
  }

  print('\n====================================================');
  print('            E2E Test Execution Completed            ');
  print('====================================================');
}
