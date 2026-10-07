import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/params/check_in_params.dart';
import '../../domain/params/check_out_params.dart';
import '../../domain/params/request_correction_params.dart';
import '../../domain/params/approve_correction_params.dart';
import '../../domain/params/reject_correction_params.dart';
import '../../domain/params/add_overtime_params.dart';
import '../../domain/params/approve_overtime_params.dart';
import '../../domain/params/reject_overtime_params.dart';
import '../../domain/params/submit_leave_params.dart';
import '../../domain/params/approve_leave_params.dart';
import '../../domain/params/reject_leave_params.dart';
import '../../domain/params/add_deduction_params.dart';
import '../models/attendance_models.dart';

abstract class AttendanceRemoteDataSource {
  Future<AttendanceRecordModel> checkIn(CheckInParams params);
  Future<AttendanceRecordModel> checkOut(CheckOutParams params);
  Future<TodayStatusModel> getTodayStatus({required String userId});
  Future<List<AttendanceRecordModel>> getRecords({
    String? userId,
    String? month,
    String? date,
    int? limit,
  });
  Future<AttendanceRecordModel> getRecordById({required String recordId});
  Future<List<ShiftModel>> getShifts();
  Future<List<SiteGeofenceModel>> getSites();
  Future<AttendanceSettingsModel> getSettings();
  Future<CorrectionRequestModel> requestCorrection(
    RequestCorrectionParams params,
  );
  Future<List<CorrectionRequestModel>> getCorrections({String? userId});
  Future<void> approveCorrection(ApproveCorrectionParams params);
  Future<void> rejectCorrection(RejectCorrectionParams params);
  Future<List<OvertimeRecordModel>> getOvertime({String? userId});
  Future<OvertimeRecordModel> addOvertime(AddOvertimeParams params);
  Future<void> approveOvertime(ApproveOvertimeParams params);
  Future<void> rejectOvertime(RejectOvertimeParams params);
  Future<List<LeaveRequestModel>> getLeaves({String? userId});
  Future<LeaveRequestModel> submitLeave(SubmitLeaveParams params);
  Future<void> approveLeave(ApproveLeaveParams params);
  Future<void> rejectLeave(RejectLeaveParams params);
  Future<List<DeductionModel>> getDeductions({String? userId});
  Future<DeductionModel> addDeduction(AddDeductionParams params);
  Future<List<AppNotificationModel>> getNotifications({
    String? userId,
    bool unreadOnly = false,
  });
  Future<void> markNotificationRead({required String notificationId});
  Future<ShiftModel> addShift(ShiftModel shift);
  Future<ShiftModel> updateShift(ShiftModel shift);
  Future<void> deleteShift(String shiftId);
  Future<List<AuditLogEntryModel>> getAuditLogs({String? recordId});
}

@LazySingleton(as: AttendanceRemoteDataSource)
class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final DioClient _dioClient;
  static const Uuid _uuid = Uuid();

  AttendanceRemoteDataSourceImpl() : _dioClient = DioClient.instance;
  AttendanceRemoteDataSourceImpl.withClient(this._dioClient);

  Future<Map<String, dynamic>> _executeWithRetry({
    required String action,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    bool isPost = false,
  }) async {
    int attempts = 0;
    const maxAttempts = 3;
    Duration delay = const Duration(seconds: 1);

    while (true) {
      attempts++;
      try {
        final Map<String, dynamic> finalParams = {
          'action': action,
          ...?queryParams,
        };

        final response = isPost
            ? await _dioClient.post(
                ApiEndpoints.defaultBaseUrl,
                queryParameters: finalParams,
                data: body != null ? jsonEncode(body) : null,
              )
            : await _dioClient.get(
                ApiEndpoints.defaultBaseUrl,
                queryParameters: finalParams,
              );

        final data = _parseResponse(response);
        if (data['success'] == true) {
          return data;
        } else {
          final errorMsg =
              data['message'] ?? data['error'] ?? 'خطأ في استجابة الخادم';
          final errorCode = data['error_code'] ?? 'SRV_ERR';
          throw ServerException(errorMsg.toString(), errorCode.toString());
        }
      } on AppException {
        rethrow;
      } on DioException catch (e) {
        if (attempts >= maxAttempts) {
          if (e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.receiveTimeout) {
            throw const TimeoutException();
          } else if (e.type == DioExceptionType.connectionError) {
            throw const NetworkException();
          }
          throw ServerException(e.message ?? 'فشل الاتصال بالخادم', 'DIO_ERR');
        }
        await Future.delayed(delay);
        delay *= 2; // Exponential Backoff
      } catch (e) {
        if (attempts >= maxAttempts) {
          throw UnknownException(e.toString());
        }
        await Future.delayed(delay);
        delay *= 2;
      }
    }
  }

  Map<String, dynamic> _parseResponse(Response response) {
    if (response.data is Map<String, dynamic>) {
      return response.data as Map<String, dynamic>;
    } else if (response.data is String) {
      final str = (response.data as String).trim();
      if (str.startsWith('{') && str.endsWith('}')) {
        return jsonDecode(str) as Map<String, dynamic>;
      }
    }
    throw const ServerException('تنسيق الاستجابة غير مدعوم', 'FMT_001');
  }

  @override
  Future<AttendanceRecordModel> checkIn(CheckInParams params) async {
    final idempotencyKey = _uuid.v4();
    final body = {...params.toJson(), 'idempotency_key': idempotencyKey};
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionAttendanceCheckIn,
      body: body,
      isPost: true,
    );

    if (res['record'] != null) {
      return AttendanceRecordModel.fromJson(
        Map<String, dynamic>.from(res['record'] as Map),
      );
    }
    return AttendanceRecordModel(
      id:
          res['attendance_id']?.toString() ??
          'ATT-${DateTime.now().millisecondsSinceEpoch}',
      userId: params.userId,
      date: DateTime.now().toIso8601String().substring(0, 10),
      checkInTime: res['check_in_time']?.toString() ?? '00:00:00',
      checkInLat: params.lat,
      checkInLng: params.lng,
      checkInSiteId: params.siteId,
      accuracy: params.accuracy,
      mockLocationDetected: params.isMock,
      deviceId: params.deviceId,
    );
  }

  @override
  Future<AttendanceRecordModel> checkOut(CheckOutParams params) async {
    final idempotencyKey = _uuid.v4();
    final body = {...params.toJson(), 'idempotency_key': idempotencyKey};
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionAttendanceCheckOut,
      body: body,
      isPost: true,
    );

    if (res['record'] != null) {
      return AttendanceRecordModel.fromJson(
        Map<String, dynamic>.from(res['record'] as Map),
      );
    }
    return AttendanceRecordModel(
      id:
          res['attendance_id']?.toString() ??
          'ATT-${DateTime.now().millisecondsSinceEpoch}',
      userId: params.userId,
      date: DateTime.now().toIso8601String().substring(0, 10),
      checkOutTime: res['check_out_time']?.toString() ?? '00:00:00',
      checkOutLat: params.lat,
      checkOutLng: params.lng,
      checkOutSiteId: params.siteId,
      actualHours: (res['actual_hours'] as num?)?.toDouble() ?? 0.0,
      accuracy: params.accuracy,
      mockLocationDetected: params.isMock,
    );
  }

  @override
  Future<TodayStatusModel> getTodayStatus({required String userId}) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionAttendanceTodayStatus,
      queryParams: {'user_id': userId},
    );
    final statusMap = (res['today_status'] as Map?) ?? {};
    return TodayStatusModel.fromJson(Map<String, dynamic>.from(statusMap));
  }

  @override
  Future<List<AttendanceRecordModel>> getRecords({
    String? userId,
    String? month,
    String? date,
    int? limit,
  }) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionAttendanceRecords,
      queryParams: {
        'user_id': ?userId,
        'month': ?month,
        'date': ?date,
        if (limit != null) 'limit': limit.toString(),
      },
    );
    final list = (res['records'] as List?) ?? [];
    return list
        .map(
          (e) => AttendanceRecordModel.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();
  }

  @override
  Future<AttendanceRecordModel> getRecordById({
    required String recordId,
  }) async {
    final records = await getRecords(limit: 200);
    return records.firstWhere(
      (r) => r.id == recordId,
      orElse: () =>
          throw const NotFoundException('لم يتم العثور على السجل المطلوب'),
    );
  }

  @override
  Future<List<ShiftModel>> getShifts() async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionShiftsGetAll,
    );
    final list = (res['shifts'] as List?) ?? [];
    return list
        .map((e) => ShiftModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  @override
  Future<List<SiteGeofenceModel>> getSites() async {
    final res = await _executeWithRetry(action: ApiEndpoints.actionSitesGetAll);
    final list = (res['sites'] as List?) ?? [];
    return list
        .map(
          (e) =>
              SiteGeofenceModel.fromJson(Map<String, dynamic>.from(e as Map)),
        )
        .toList();
  }

  @override
  Future<AttendanceSettingsModel> getSettings() async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionSystemGetConfig,
    );
    final settingsMap = (res['attendance_settings'] as Map?) ?? {};
    return AttendanceSettingsModel.fromJson(
      Map<String, dynamic>.from(settingsMap),
    );
  }

  @override
  Future<CorrectionRequestModel> requestCorrection(
    RequestCorrectionParams params,
  ) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionCorrectionsRequest,
      body: params.toJson(),
      isPost: true,
    );
    if (res['request'] != null) {
      return CorrectionRequestModel.fromJson(
        Map<String, dynamic>.from(res['request'] as Map),
      );
    }
    return CorrectionRequestModel(
      requestId:
          res['request_id']?.toString() ??
          'REQ-${DateTime.now().millisecondsSinceEpoch}',
      attendanceId: params.attendanceId,
      userId: params.userId,
      targetDate: params.targetDate,
      correctedCheckIn: params.correctedCheckIn,
      correctedCheckOut: params.correctedCheckOut,
      reason: params.reason,
    );
  }

  @override
  Future<List<CorrectionRequestModel>> getCorrections({String? userId}) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionCorrectionsGetAll,
      queryParams: {'user_id': ?userId},
    );
    final list = (res['corrections'] as List?) ?? [];
    return list
        .map(
          (e) => CorrectionRequestModel.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();
  }

  @override
  Future<void> approveCorrection(ApproveCorrectionParams params) async {
    await _executeWithRetry(
      action: ApiEndpoints.actionCorrectionsApprove,
      body: params.toJson(),
      isPost: true,
    );
  }

  @override
  Future<void> rejectCorrection(RejectCorrectionParams params) async {
    await _executeWithRetry(
      action: ApiEndpoints.actionCorrectionsApprove,
      body: {
        'request_id': params.requestId,
        'approver_id': params.approverId,
        'decision': 'REJECTED',
        'notes': params.reason,
      },
      isPost: true,
    );
  }

  @override
  Future<List<OvertimeRecordModel>> getOvertime({String? userId}) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionOvertimeGetAll,
      queryParams: {'user_id': ?userId},
    );
    final list = (res['overtime_records'] as List?) ?? [];
    return list
        .map(
          (e) =>
              OvertimeRecordModel.fromJson(Map<String, dynamic>.from(e as Map)),
        )
        .toList();
  }

  @override
  Future<OvertimeRecordModel> addOvertime(AddOvertimeParams params) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionOvertimeAdd,
      body: params.toJson(),
      isPost: true,
    );
    if (res['overtime'] != null) {
      return OvertimeRecordModel.fromJson(
        Map<String, dynamic>.from(res['overtime'] as Map),
      );
    }
    return OvertimeRecordModel(
      otId:
          res['ot_id']?.toString() ??
          'OT-${DateTime.now().millisecondsSinceEpoch}',
      attendanceId: params.attendanceId ?? '',
      userId: params.userId,
      workDate: params.workDate,
      durationHours: params.durationHours,
      rateMultiplier: params.rateMultiplier,
      reason: params.reason,
    );
  }

  @override
  Future<void> approveOvertime(ApproveOvertimeParams params) async {
    await _executeWithRetry(
      action: ApiEndpoints.actionOvertimeReview,
      body: {
        'ot_id': params.otId,
        'approver_id': params.approverId,
        'status': 'APPROVED',
        'notes': params.notes,
      },
      isPost: true,
    );
  }

  @override
  Future<void> rejectOvertime(RejectOvertimeParams params) async {
    await _executeWithRetry(
      action: ApiEndpoints.actionOvertimeReview,
      body: {
        'ot_id': params.otId,
        'approver_id': params.approverId,
        'status': 'REJECTED',
        'reason': params.reason,
      },
      isPost: true,
    );
  }

  @override
  Future<List<LeaveRequestModel>> getLeaves({String? userId}) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionLeavesGetAll,
      queryParams: {'user_id': ?userId},
    );
    final list = (res['leaves'] as List?) ?? [];
    return list
        .map(
          (e) =>
              LeaveRequestModel.fromJson(Map<String, dynamic>.from(e as Map)),
        )
        .toList();
  }

  @override
  Future<LeaveRequestModel> submitLeave(SubmitLeaveParams params) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionLeavesSubmit,
      body: params.toJson(),
      isPost: true,
    );
    if (res['leave'] != null) {
      return LeaveRequestModel.fromJson(
        Map<String, dynamic>.from(res['leave'] as Map),
      );
    }
    return LeaveRequestModel(
      leaveId:
          res['leave_id']?.toString() ??
          'LV-${DateTime.now().millisecondsSinceEpoch}',
      userId: params.userId,
      leaveType: params.leaveType,
      startDate: params.startDate,
      endDate: params.endDate,
      totalDaysOrHours: params.totalDaysOrHours,
      reason: params.reason,
    );
  }

  @override
  Future<void> approveLeave(ApproveLeaveParams params) async {
    await _executeWithRetry(
      action: ApiEndpoints.actionLeavesReview,
      body: {
        'leave_id': params.leaveId,
        'approver_id': params.approverId,
        'status': 'APPROVED',
        'notes': params.notes,
      },
      isPost: true,
    );
  }

  @override
  Future<void> rejectLeave(RejectLeaveParams params) async {
    await _executeWithRetry(
      action: ApiEndpoints.actionLeavesReview,
      body: {
        'leave_id': params.leaveId,
        'approver_id': params.approverId,
        'status': 'REJECTED',
        'reason': params.reason,
      },
      isPost: true,
    );
  }

  @override
  Future<List<DeductionModel>> getDeductions({String? userId}) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionDeductionsGetAll,
      queryParams: {'user_id': ?userId},
    );
    final list = (res['deductions'] as List?) ?? [];
    return list
        .map(
          (e) => DeductionModel.fromJson(Map<String, dynamic>.from(e as Map)),
        )
        .toList();
  }

  @override
  Future<DeductionModel> addDeduction(AddDeductionParams params) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionDeductionsAdd,
      body: params.toJson(),
      isPost: true,
    );
    if (res['deduction'] != null) {
      return DeductionModel.fromJson(
        Map<String, dynamic>.from(res['deduction'] as Map),
      );
    }
    return DeductionModel(
      deductionId:
          res['deduction_id']?.toString() ??
          'DED-${DateTime.now().millisecondsSinceEpoch}',
      userId: params.userId,
      attendanceId: params.attendanceId,
      deductionDate: params.workDate,
      type: params.type,
      amountOrHours: params.amountOrHours,
      reason: params.reason,
      createdBy: params.createdBy,
    );
  }

  @override
  Future<List<AppNotificationModel>> getNotifications({
    String? userId,
    bool unreadOnly = false,
  }) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionNotificationsGet,
      queryParams: {'user_id': ?userId, 'unread_only': unreadOnly.toString()},
    );
    final list = (res['notifications'] as List?) ?? [];
    return list
        .map(
          (e) => AppNotificationModel.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();
  }

  @override
  Future<void> markNotificationRead({required String notificationId}) async {
    await _executeWithRetry(
      action: ApiEndpoints.actionNotificationsMarkRead,
      body: {'notification_id': notificationId},
      isPost: true,
    );
  }

  @override
  Future<ShiftModel> addShift(ShiftModel shift) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionShiftsAdd,
      body: shift.toJson(),
      isPost: true,
    );
    if (res['shift'] != null) {
      return ShiftModel.fromJson(
        Map<String, dynamic>.from(res['shift'] as Map),
      );
    }
    return shift;
  }

  @override
  Future<ShiftModel> updateShift(ShiftModel shift) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionShiftsUpdate,
      body: shift.toJson(),
      isPost: true,
    );
    if (res['shift'] != null) {
      return ShiftModel.fromJson(
        Map<String, dynamic>.from(res['shift'] as Map),
      );
    }
    return shift;
  }

  @override
  Future<void> deleteShift(String shiftId) async {
    await _executeWithRetry(
      action: ApiEndpoints.actionShiftsDelete,
      body: {'shift_id': shiftId},
      isPost: true,
    );
  }

  @override
  Future<List<AuditLogEntryModel>> getAuditLogs({String? recordId}) async {
    final res = await _executeWithRetry(
      action: ApiEndpoints.actionAuditLogs,
      queryParams: {'record_id': ?recordId},
    );
    final list = (res['logs'] as List?) ?? [];
    return list
        .map(
          (e) =>
              AuditLogEntryModel.fromJson(Map<String, dynamic>.from(e as Map)),
        )
        .toList();
  }
}
