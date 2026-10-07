// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceRecord {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'date') String get date;@JsonKey(name: 'shift_id') String? get shiftId;@JsonKey(name: 'check_in_time') String? get checkInTime;@JsonKey(name: 'check_in_lat') double? get checkInLat;@JsonKey(name: 'check_in_lng') double? get checkInLng;@JsonKey(name: 'check_in_site_id') String? get checkInSiteId;@JsonKey(name: 'check_out_time') String? get checkOutTime;@JsonKey(name: 'check_out_lat') double? get checkOutLat;@JsonKey(name: 'check_out_lng') double? get checkOutLng;@JsonKey(name: 'check_out_site_id') String? get checkOutSiteId;@JsonKey(name: 'actual_hours') double get actualHours;@JsonKey(name: 'late_minutes') int get lateMinutes;@JsonKey(name: 'early_leave_minutes') int get earlyLeaveMinutes;@JsonKey(name: 'overtime_hours') double get overtimeHours;@JsonKey(name: 'status') AttendanceStatus get status;@JsonKey(name: 'geofence_status') GeofenceStatus get geofenceStatus;@JsonKey(name: 'accuracy') double? get accuracy;@JsonKey(name: 'mock_location_detected') bool get mockLocationDetected;@JsonKey(name: 'device_id') String? get deviceId;@JsonKey(name: 'ip_address') String? get ipAddress;@JsonKey(name: 'sync_status') SyncStatus get syncStatus;@JsonKey(name: 'is_locked') bool get isLocked;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'created_by') String? get createdBy;@JsonKey(name: 'updated_by') String? get updatedBy;@JsonKey(name: 'deleted_at') String? get deletedAt;
/// Create a copy of AttendanceRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceRecordCopyWith<AttendanceRecord> get copyWith => _$AttendanceRecordCopyWithImpl<AttendanceRecord>(this as AttendanceRecord, _$identity);

  /// Serializes this AttendanceRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AttendanceRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.shiftId, _this.shiftId) || other.shiftId == _this.shiftId)&&(identical(other.checkInTime, _this.checkInTime) || other.checkInTime == _this.checkInTime)&&(identical(other.checkInLat, _this.checkInLat) || other.checkInLat == _this.checkInLat)&&(identical(other.checkInLng, _this.checkInLng) || other.checkInLng == _this.checkInLng)&&(identical(other.checkInSiteId, _this.checkInSiteId) || other.checkInSiteId == _this.checkInSiteId)&&(identical(other.checkOutTime, _this.checkOutTime) || other.checkOutTime == _this.checkOutTime)&&(identical(other.checkOutLat, _this.checkOutLat) || other.checkOutLat == _this.checkOutLat)&&(identical(other.checkOutLng, _this.checkOutLng) || other.checkOutLng == _this.checkOutLng)&&(identical(other.checkOutSiteId, _this.checkOutSiteId) || other.checkOutSiteId == _this.checkOutSiteId)&&(identical(other.actualHours, _this.actualHours) || other.actualHours == _this.actualHours)&&(identical(other.lateMinutes, _this.lateMinutes) || other.lateMinutes == _this.lateMinutes)&&(identical(other.earlyLeaveMinutes, _this.earlyLeaveMinutes) || other.earlyLeaveMinutes == _this.earlyLeaveMinutes)&&(identical(other.overtimeHours, _this.overtimeHours) || other.overtimeHours == _this.overtimeHours)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.geofenceStatus, _this.geofenceStatus) || other.geofenceStatus == _this.geofenceStatus)&&(identical(other.accuracy, _this.accuracy) || other.accuracy == _this.accuracy)&&(identical(other.mockLocationDetected, _this.mockLocationDetected) || other.mockLocationDetected == _this.mockLocationDetected)&&(identical(other.deviceId, _this.deviceId) || other.deviceId == _this.deviceId)&&(identical(other.ipAddress, _this.ipAddress) || other.ipAddress == _this.ipAddress)&&(identical(other.syncStatus, _this.syncStatus) || other.syncStatus == _this.syncStatus)&&(identical(other.isLocked, _this.isLocked) || other.isLocked == _this.isLocked)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.createdBy, _this.createdBy) || other.createdBy == _this.createdBy)&&(identical(other.updatedBy, _this.updatedBy) || other.updatedBy == _this.updatedBy)&&(identical(other.deletedAt, _this.deletedAt) || other.deletedAt == _this.deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AttendanceRecord;
  return Object.hashAll([runtimeType,_this.id,_this.userId,_this.date,_this.shiftId,_this.checkInTime,_this.checkInLat,_this.checkInLng,_this.checkInSiteId,_this.checkOutTime,_this.checkOutLat,_this.checkOutLng,_this.checkOutSiteId,_this.actualHours,_this.lateMinutes,_this.earlyLeaveMinutes,_this.overtimeHours,_this.status,_this.geofenceStatus,_this.accuracy,_this.mockLocationDetected,_this.deviceId,_this.ipAddress,_this.syncStatus,_this.isLocked,_this.createdAt,_this.updatedAt,_this.createdBy,_this.updatedBy,_this.deletedAt]);
}

@override
String toString() {
  final _this = this as AttendanceRecord;
  return 'AttendanceRecord(id: ${_this.id}, userId: ${_this.userId}, date: ${_this.date}, shiftId: ${_this.shiftId}, checkInTime: ${_this.checkInTime}, checkInLat: ${_this.checkInLat}, checkInLng: ${_this.checkInLng}, checkInSiteId: ${_this.checkInSiteId}, checkOutTime: ${_this.checkOutTime}, checkOutLat: ${_this.checkOutLat}, checkOutLng: ${_this.checkOutLng}, checkOutSiteId: ${_this.checkOutSiteId}, actualHours: ${_this.actualHours}, lateMinutes: ${_this.lateMinutes}, earlyLeaveMinutes: ${_this.earlyLeaveMinutes}, overtimeHours: ${_this.overtimeHours}, status: ${_this.status}, geofenceStatus: ${_this.geofenceStatus}, accuracy: ${_this.accuracy}, mockLocationDetected: ${_this.mockLocationDetected}, deviceId: ${_this.deviceId}, ipAddress: ${_this.ipAddress}, syncStatus: ${_this.syncStatus}, isLocked: ${_this.isLocked}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, createdBy: ${_this.createdBy}, updatedBy: ${_this.updatedBy}, deletedAt: ${_this.deletedAt})';
}


}

/// @nodoc
abstract mixin class $AttendanceRecordCopyWith<$Res>  {
  factory $AttendanceRecordCopyWith(AttendanceRecord value, $Res Function(AttendanceRecord) _then) = _$AttendanceRecordCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'date') String date,@JsonKey(name: 'shift_id') String? shiftId,@JsonKey(name: 'check_in_time') String? checkInTime,@JsonKey(name: 'check_in_lat') double? checkInLat,@JsonKey(name: 'check_in_lng') double? checkInLng,@JsonKey(name: 'check_in_site_id') String? checkInSiteId,@JsonKey(name: 'check_out_time') String? checkOutTime,@JsonKey(name: 'check_out_lat') double? checkOutLat,@JsonKey(name: 'check_out_lng') double? checkOutLng,@JsonKey(name: 'check_out_site_id') String? checkOutSiteId,@JsonKey(name: 'actual_hours') double actualHours,@JsonKey(name: 'late_minutes') int lateMinutes,@JsonKey(name: 'early_leave_minutes') int earlyLeaveMinutes,@JsonKey(name: 'overtime_hours') double overtimeHours,@JsonKey(name: 'status') AttendanceStatus status,@JsonKey(name: 'geofence_status') GeofenceStatus geofenceStatus,@JsonKey(name: 'accuracy') double? accuracy,@JsonKey(name: 'mock_location_detected') bool mockLocationDetected,@JsonKey(name: 'device_id') String? deviceId,@JsonKey(name: 'ip_address') String? ipAddress,@JsonKey(name: 'sync_status') SyncStatus syncStatus,@JsonKey(name: 'is_locked') bool isLocked,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'created_by') String? createdBy,@JsonKey(name: 'updated_by') String? updatedBy,@JsonKey(name: 'deleted_at') String? deletedAt
});




}
/// @nodoc
class _$AttendanceRecordCopyWithImpl<$Res>
    implements $AttendanceRecordCopyWith<$Res> {
  _$AttendanceRecordCopyWithImpl(this._self, this._then);

  final AttendanceRecord _self;
  final $Res Function(AttendanceRecord) _then;

/// Create a copy of AttendanceRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? date = null,Object? shiftId = freezed,Object? checkInTime = freezed,Object? checkInLat = freezed,Object? checkInLng = freezed,Object? checkInSiteId = freezed,Object? checkOutTime = freezed,Object? checkOutLat = freezed,Object? checkOutLng = freezed,Object? checkOutSiteId = freezed,Object? actualHours = null,Object? lateMinutes = null,Object? earlyLeaveMinutes = null,Object? overtimeHours = null,Object? status = null,Object? geofenceStatus = null,Object? accuracy = freezed,Object? mockLocationDetected = null,Object? deviceId = freezed,Object? ipAddress = freezed,Object? syncStatus = null,Object? isLocked = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? deletedAt = freezed,}) {
  return _then(AttendanceRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkInLat: freezed == checkInLat ? _self.checkInLat : checkInLat // ignore: cast_nullable_to_non_nullable
as double?,checkInLng: freezed == checkInLng ? _self.checkInLng : checkInLng // ignore: cast_nullable_to_non_nullable
as double?,checkInSiteId: freezed == checkInSiteId ? _self.checkInSiteId : checkInSiteId // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutLat: freezed == checkOutLat ? _self.checkOutLat : checkOutLat // ignore: cast_nullable_to_non_nullable
as double?,checkOutLng: freezed == checkOutLng ? _self.checkOutLng : checkOutLng // ignore: cast_nullable_to_non_nullable
as double?,checkOutSiteId: freezed == checkOutSiteId ? _self.checkOutSiteId : checkOutSiteId // ignore: cast_nullable_to_non_nullable
as String?,actualHours: null == actualHours ? _self.actualHours : actualHours // ignore: cast_nullable_to_non_nullable
as double,lateMinutes: null == lateMinutes ? _self.lateMinutes : lateMinutes // ignore: cast_nullable_to_non_nullable
as int,earlyLeaveMinutes: null == earlyLeaveMinutes ? _self.earlyLeaveMinutes : earlyLeaveMinutes // ignore: cast_nullable_to_non_nullable
as int,overtimeHours: null == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus,geofenceStatus: null == geofenceStatus ? _self.geofenceStatus : geofenceStatus // ignore: cast_nullable_to_non_nullable
as GeofenceStatus,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,mockLocationDetected: null == mockLocationDetected ? _self.mockLocationDetected : mockLocationDetected // ignore: cast_nullable_to_non_nullable
as bool,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceRecord].
extension AttendanceRecordPatterns on AttendanceRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceRecord value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceRecord value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'date')  String date, @JsonKey(name: 'shift_id')  String? shiftId, @JsonKey(name: 'check_in_time')  String? checkInTime, @JsonKey(name: 'check_in_lat')  double? checkInLat, @JsonKey(name: 'check_in_lng')  double? checkInLng, @JsonKey(name: 'check_in_site_id')  String? checkInSiteId, @JsonKey(name: 'check_out_time')  String? checkOutTime, @JsonKey(name: 'check_out_lat')  double? checkOutLat, @JsonKey(name: 'check_out_lng')  double? checkOutLng, @JsonKey(name: 'check_out_site_id')  String? checkOutSiteId, @JsonKey(name: 'actual_hours')  double actualHours, @JsonKey(name: 'late_minutes')  int lateMinutes, @JsonKey(name: 'early_leave_minutes')  int earlyLeaveMinutes, @JsonKey(name: 'overtime_hours')  double overtimeHours, @JsonKey(name: 'status')  AttendanceStatus status, @JsonKey(name: 'geofence_status')  GeofenceStatus geofenceStatus, @JsonKey(name: 'accuracy')  double? accuracy, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'ip_address')  String? ipAddress, @JsonKey(name: 'sync_status')  SyncStatus syncStatus, @JsonKey(name: 'is_locked')  bool isLocked, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'created_by')  String? createdBy, @JsonKey(name: 'updated_by')  String? updatedBy, @JsonKey(name: 'deleted_at')  String? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceRecord() when $default != null:
return $default(_that.id,_that.userId,_that.date,_that.shiftId,_that.checkInTime,_that.checkInLat,_that.checkInLng,_that.checkInSiteId,_that.checkOutTime,_that.checkOutLat,_that.checkOutLng,_that.checkOutSiteId,_that.actualHours,_that.lateMinutes,_that.earlyLeaveMinutes,_that.overtimeHours,_that.status,_that.geofenceStatus,_that.accuracy,_that.mockLocationDetected,_that.deviceId,_that.ipAddress,_that.syncStatus,_that.isLocked,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.deletedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'date')  String date, @JsonKey(name: 'shift_id')  String? shiftId, @JsonKey(name: 'check_in_time')  String? checkInTime, @JsonKey(name: 'check_in_lat')  double? checkInLat, @JsonKey(name: 'check_in_lng')  double? checkInLng, @JsonKey(name: 'check_in_site_id')  String? checkInSiteId, @JsonKey(name: 'check_out_time')  String? checkOutTime, @JsonKey(name: 'check_out_lat')  double? checkOutLat, @JsonKey(name: 'check_out_lng')  double? checkOutLng, @JsonKey(name: 'check_out_site_id')  String? checkOutSiteId, @JsonKey(name: 'actual_hours')  double actualHours, @JsonKey(name: 'late_minutes')  int lateMinutes, @JsonKey(name: 'early_leave_minutes')  int earlyLeaveMinutes, @JsonKey(name: 'overtime_hours')  double overtimeHours, @JsonKey(name: 'status')  AttendanceStatus status, @JsonKey(name: 'geofence_status')  GeofenceStatus geofenceStatus, @JsonKey(name: 'accuracy')  double? accuracy, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'ip_address')  String? ipAddress, @JsonKey(name: 'sync_status')  SyncStatus syncStatus, @JsonKey(name: 'is_locked')  bool isLocked, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'created_by')  String? createdBy, @JsonKey(name: 'updated_by')  String? updatedBy, @JsonKey(name: 'deleted_at')  String? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _AttendanceRecord():
return $default(_that.id,_that.userId,_that.date,_that.shiftId,_that.checkInTime,_that.checkInLat,_that.checkInLng,_that.checkInSiteId,_that.checkOutTime,_that.checkOutLat,_that.checkOutLng,_that.checkOutSiteId,_that.actualHours,_that.lateMinutes,_that.earlyLeaveMinutes,_that.overtimeHours,_that.status,_that.geofenceStatus,_that.accuracy,_that.mockLocationDetected,_that.deviceId,_that.ipAddress,_that.syncStatus,_that.isLocked,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.deletedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'date')  String date, @JsonKey(name: 'shift_id')  String? shiftId, @JsonKey(name: 'check_in_time')  String? checkInTime, @JsonKey(name: 'check_in_lat')  double? checkInLat, @JsonKey(name: 'check_in_lng')  double? checkInLng, @JsonKey(name: 'check_in_site_id')  String? checkInSiteId, @JsonKey(name: 'check_out_time')  String? checkOutTime, @JsonKey(name: 'check_out_lat')  double? checkOutLat, @JsonKey(name: 'check_out_lng')  double? checkOutLng, @JsonKey(name: 'check_out_site_id')  String? checkOutSiteId, @JsonKey(name: 'actual_hours')  double actualHours, @JsonKey(name: 'late_minutes')  int lateMinutes, @JsonKey(name: 'early_leave_minutes')  int earlyLeaveMinutes, @JsonKey(name: 'overtime_hours')  double overtimeHours, @JsonKey(name: 'status')  AttendanceStatus status, @JsonKey(name: 'geofence_status')  GeofenceStatus geofenceStatus, @JsonKey(name: 'accuracy')  double? accuracy, @JsonKey(name: 'mock_location_detected')  bool mockLocationDetected, @JsonKey(name: 'device_id')  String? deviceId, @JsonKey(name: 'ip_address')  String? ipAddress, @JsonKey(name: 'sync_status')  SyncStatus syncStatus, @JsonKey(name: 'is_locked')  bool isLocked, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'created_by')  String? createdBy, @JsonKey(name: 'updated_by')  String? updatedBy, @JsonKey(name: 'deleted_at')  String? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceRecord() when $default != null:
return $default(_that.id,_that.userId,_that.date,_that.shiftId,_that.checkInTime,_that.checkInLat,_that.checkInLng,_that.checkInSiteId,_that.checkOutTime,_that.checkOutLat,_that.checkOutLng,_that.checkOutSiteId,_that.actualHours,_that.lateMinutes,_that.earlyLeaveMinutes,_that.overtimeHours,_that.status,_that.geofenceStatus,_that.accuracy,_that.mockLocationDetected,_that.deviceId,_that.ipAddress,_that.syncStatus,_that.isLocked,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceRecord implements AttendanceRecord {
  const _AttendanceRecord({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'date') required this.date, @JsonKey(name: 'shift_id') this.shiftId, @JsonKey(name: 'check_in_time') this.checkInTime, @JsonKey(name: 'check_in_lat') this.checkInLat, @JsonKey(name: 'check_in_lng') this.checkInLng, @JsonKey(name: 'check_in_site_id') this.checkInSiteId, @JsonKey(name: 'check_out_time') this.checkOutTime, @JsonKey(name: 'check_out_lat') this.checkOutLat, @JsonKey(name: 'check_out_lng') this.checkOutLng, @JsonKey(name: 'check_out_site_id') this.checkOutSiteId, @JsonKey(name: 'actual_hours') this.actualHours = 0.0, @JsonKey(name: 'late_minutes') this.lateMinutes = 0, @JsonKey(name: 'early_leave_minutes') this.earlyLeaveMinutes = 0, @JsonKey(name: 'overtime_hours') this.overtimeHours = 0.0, @JsonKey(name: 'status') this.status = AttendanceStatus.present, @JsonKey(name: 'geofence_status') this.geofenceStatus = GeofenceStatus.inside, @JsonKey(name: 'accuracy') this.accuracy, @JsonKey(name: 'mock_location_detected') this.mockLocationDetected = false, @JsonKey(name: 'device_id') this.deviceId, @JsonKey(name: 'ip_address') this.ipAddress, @JsonKey(name: 'sync_status') this.syncStatus = SyncStatus.synced, @JsonKey(name: 'is_locked') this.isLocked = false, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'created_by') this.createdBy, @JsonKey(name: 'updated_by') this.updatedBy, @JsonKey(name: 'deleted_at') this.deletedAt});
  factory _AttendanceRecord.fromJson(Map<String, dynamic> json) => _$AttendanceRecordFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'date') final  String date;
@override@JsonKey(name: 'shift_id') final  String? shiftId;
@override@JsonKey(name: 'check_in_time') final  String? checkInTime;
@override@JsonKey(name: 'check_in_lat') final  double? checkInLat;
@override@JsonKey(name: 'check_in_lng') final  double? checkInLng;
@override@JsonKey(name: 'check_in_site_id') final  String? checkInSiteId;
@override@JsonKey(name: 'check_out_time') final  String? checkOutTime;
@override@JsonKey(name: 'check_out_lat') final  double? checkOutLat;
@override@JsonKey(name: 'check_out_lng') final  double? checkOutLng;
@override@JsonKey(name: 'check_out_site_id') final  String? checkOutSiteId;
@override@JsonKey(name: 'actual_hours') final  double actualHours;
@override@JsonKey(name: 'late_minutes') final  int lateMinutes;
@override@JsonKey(name: 'early_leave_minutes') final  int earlyLeaveMinutes;
@override@JsonKey(name: 'overtime_hours') final  double overtimeHours;
@override@JsonKey(name: 'status') final  AttendanceStatus status;
@override@JsonKey(name: 'geofence_status') final  GeofenceStatus geofenceStatus;
@override@JsonKey(name: 'accuracy') final  double? accuracy;
@override@JsonKey(name: 'mock_location_detected') final  bool mockLocationDetected;
@override@JsonKey(name: 'device_id') final  String? deviceId;
@override@JsonKey(name: 'ip_address') final  String? ipAddress;
@override@JsonKey(name: 'sync_status') final  SyncStatus syncStatus;
@override@JsonKey(name: 'is_locked') final  bool isLocked;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'created_by') final  String? createdBy;
@override@JsonKey(name: 'updated_by') final  String? updatedBy;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;

/// Create a copy of AttendanceRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceRecordCopyWith<_AttendanceRecord> get copyWith => __$AttendanceRecordCopyWithImpl<_AttendanceRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.date, date) || other.date == date)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkInLat, checkInLat) || other.checkInLat == checkInLat)&&(identical(other.checkInLng, checkInLng) || other.checkInLng == checkInLng)&&(identical(other.checkInSiteId, checkInSiteId) || other.checkInSiteId == checkInSiteId)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.checkOutLat, checkOutLat) || other.checkOutLat == checkOutLat)&&(identical(other.checkOutLng, checkOutLng) || other.checkOutLng == checkOutLng)&&(identical(other.checkOutSiteId, checkOutSiteId) || other.checkOutSiteId == checkOutSiteId)&&(identical(other.actualHours, actualHours) || other.actualHours == actualHours)&&(identical(other.lateMinutes, lateMinutes) || other.lateMinutes == lateMinutes)&&(identical(other.earlyLeaveMinutes, earlyLeaveMinutes) || other.earlyLeaveMinutes == earlyLeaveMinutes)&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.status, status) || other.status == status)&&(identical(other.geofenceStatus, geofenceStatus) || other.geofenceStatus == geofenceStatus)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.mockLocationDetected, mockLocationDetected) || other.mockLocationDetected == mockLocationDetected)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,userId,date,shiftId,checkInTime,checkInLat,checkInLng,checkInSiteId,checkOutTime,checkOutLat,checkOutLng,checkOutSiteId,actualHours,lateMinutes,earlyLeaveMinutes,overtimeHours,status,geofenceStatus,accuracy,mockLocationDetected,deviceId,ipAddress,syncStatus,isLocked,createdAt,updatedAt,createdBy,updatedBy,deletedAt]);
}

@override
String toString() {
    return 'AttendanceRecord(id: $id, userId: $userId, date: $date, shiftId: $shiftId, checkInTime: $checkInTime, checkInLat: $checkInLat, checkInLng: $checkInLng, checkInSiteId: $checkInSiteId, checkOutTime: $checkOutTime, checkOutLat: $checkOutLat, checkOutLng: $checkOutLng, checkOutSiteId: $checkOutSiteId, actualHours: $actualHours, lateMinutes: $lateMinutes, earlyLeaveMinutes: $earlyLeaveMinutes, overtimeHours: $overtimeHours, status: $status, geofenceStatus: $geofenceStatus, accuracy: $accuracy, mockLocationDetected: $mockLocationDetected, deviceId: $deviceId, ipAddress: $ipAddress, syncStatus: $syncStatus, isLocked: $isLocked, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$AttendanceRecordCopyWith<$Res> implements $AttendanceRecordCopyWith<$Res> {
  factory _$AttendanceRecordCopyWith(_AttendanceRecord value, $Res Function(_AttendanceRecord) _then) = __$AttendanceRecordCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'date') String date,@JsonKey(name: 'shift_id') String? shiftId,@JsonKey(name: 'check_in_time') String? checkInTime,@JsonKey(name: 'check_in_lat') double? checkInLat,@JsonKey(name: 'check_in_lng') double? checkInLng,@JsonKey(name: 'check_in_site_id') String? checkInSiteId,@JsonKey(name: 'check_out_time') String? checkOutTime,@JsonKey(name: 'check_out_lat') double? checkOutLat,@JsonKey(name: 'check_out_lng') double? checkOutLng,@JsonKey(name: 'check_out_site_id') String? checkOutSiteId,@JsonKey(name: 'actual_hours') double actualHours,@JsonKey(name: 'late_minutes') int lateMinutes,@JsonKey(name: 'early_leave_minutes') int earlyLeaveMinutes,@JsonKey(name: 'overtime_hours') double overtimeHours,@JsonKey(name: 'status') AttendanceStatus status,@JsonKey(name: 'geofence_status') GeofenceStatus geofenceStatus,@JsonKey(name: 'accuracy') double? accuracy,@JsonKey(name: 'mock_location_detected') bool mockLocationDetected,@JsonKey(name: 'device_id') String? deviceId,@JsonKey(name: 'ip_address') String? ipAddress,@JsonKey(name: 'sync_status') SyncStatus syncStatus,@JsonKey(name: 'is_locked') bool isLocked,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'created_by') String? createdBy,@JsonKey(name: 'updated_by') String? updatedBy,@JsonKey(name: 'deleted_at') String? deletedAt
});




}
/// @nodoc
class __$AttendanceRecordCopyWithImpl<$Res>
    implements _$AttendanceRecordCopyWith<$Res> {
  __$AttendanceRecordCopyWithImpl(this._self, this._then);

  final _AttendanceRecord _self;
  final $Res Function(_AttendanceRecord) _then;

/// Create a copy of AttendanceRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? date = null,Object? shiftId = freezed,Object? checkInTime = freezed,Object? checkInLat = freezed,Object? checkInLng = freezed,Object? checkInSiteId = freezed,Object? checkOutTime = freezed,Object? checkOutLat = freezed,Object? checkOutLng = freezed,Object? checkOutSiteId = freezed,Object? actualHours = null,Object? lateMinutes = null,Object? earlyLeaveMinutes = null,Object? overtimeHours = null,Object? status = null,Object? geofenceStatus = null,Object? accuracy = freezed,Object? mockLocationDetected = null,Object? deviceId = freezed,Object? ipAddress = freezed,Object? syncStatus = null,Object? isLocked = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? createdBy = freezed,Object? updatedBy = freezed,Object? deletedAt = freezed,}) {
  return _then(_AttendanceRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkInLat: freezed == checkInLat ? _self.checkInLat : checkInLat // ignore: cast_nullable_to_non_nullable
as double?,checkInLng: freezed == checkInLng ? _self.checkInLng : checkInLng // ignore: cast_nullable_to_non_nullable
as double?,checkInSiteId: freezed == checkInSiteId ? _self.checkInSiteId : checkInSiteId // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutLat: freezed == checkOutLat ? _self.checkOutLat : checkOutLat // ignore: cast_nullable_to_non_nullable
as double?,checkOutLng: freezed == checkOutLng ? _self.checkOutLng : checkOutLng // ignore: cast_nullable_to_non_nullable
as double?,checkOutSiteId: freezed == checkOutSiteId ? _self.checkOutSiteId : checkOutSiteId // ignore: cast_nullable_to_non_nullable
as String?,actualHours: null == actualHours ? _self.actualHours : actualHours // ignore: cast_nullable_to_non_nullable
as double,lateMinutes: null == lateMinutes ? _self.lateMinutes : lateMinutes // ignore: cast_nullable_to_non_nullable
as int,earlyLeaveMinutes: null == earlyLeaveMinutes ? _self.earlyLeaveMinutes : earlyLeaveMinutes // ignore: cast_nullable_to_non_nullable
as int,overtimeHours: null == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus,geofenceStatus: null == geofenceStatus ? _self.geofenceStatus : geofenceStatus // ignore: cast_nullable_to_non_nullable
as GeofenceStatus,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,mockLocationDetected: null == mockLocationDetected ? _self.mockLocationDetected : mockLocationDetected // ignore: cast_nullable_to_non_nullable
as bool,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
