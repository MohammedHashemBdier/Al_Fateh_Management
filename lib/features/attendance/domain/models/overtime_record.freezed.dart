// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overtime_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OvertimeRecord {

@JsonKey(name: 'ot_id') String get otId;@JsonKey(name: 'attendance_id') String get attendanceId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'work_date') String get workDate;@JsonKey(name: 'duration_hours') double get durationHours;@JsonKey(name: 'rate_multiplier') double get rateMultiplier;@JsonKey(name: 'reason') String get reason;@JsonKey(name: 'status') OvertimeStatus get status;@JsonKey(name: 'approved_by') String? get approvedBy;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of OvertimeRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OvertimeRecordCopyWith<OvertimeRecord> get copyWith => _$OvertimeRecordCopyWithImpl<OvertimeRecord>(this as OvertimeRecord, _$identity);

  /// Serializes this OvertimeRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OvertimeRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OvertimeRecord&&(identical(other.otId, _this.otId) || other.otId == _this.otId)&&(identical(other.attendanceId, _this.attendanceId) || other.attendanceId == _this.attendanceId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.workDate, _this.workDate) || other.workDate == _this.workDate)&&(identical(other.durationHours, _this.durationHours) || other.durationHours == _this.durationHours)&&(identical(other.rateMultiplier, _this.rateMultiplier) || other.rateMultiplier == _this.rateMultiplier)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.approvedBy, _this.approvedBy) || other.approvedBy == _this.approvedBy)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OvertimeRecord;
  return Object.hash(runtimeType,_this.otId,_this.attendanceId,_this.userId,_this.workDate,_this.durationHours,_this.rateMultiplier,_this.reason,_this.status,_this.approvedBy,_this.createdAt);
}

@override
String toString() {
  final _this = this as OvertimeRecord;
  return 'OvertimeRecord(otId: ${_this.otId}, attendanceId: ${_this.attendanceId}, userId: ${_this.userId}, workDate: ${_this.workDate}, durationHours: ${_this.durationHours}, rateMultiplier: ${_this.rateMultiplier}, reason: ${_this.reason}, status: ${_this.status}, approvedBy: ${_this.approvedBy}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $OvertimeRecordCopyWith<$Res>  {
  factory $OvertimeRecordCopyWith(OvertimeRecord value, $Res Function(OvertimeRecord) _then) = _$OvertimeRecordCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ot_id') String otId,@JsonKey(name: 'attendance_id') String attendanceId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'work_date') String workDate,@JsonKey(name: 'duration_hours') double durationHours,@JsonKey(name: 'rate_multiplier') double rateMultiplier,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'status') OvertimeStatus status,@JsonKey(name: 'approved_by') String? approvedBy,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$OvertimeRecordCopyWithImpl<$Res>
    implements $OvertimeRecordCopyWith<$Res> {
  _$OvertimeRecordCopyWithImpl(this._self, this._then);

  final OvertimeRecord _self;
  final $Res Function(OvertimeRecord) _then;

/// Create a copy of OvertimeRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otId = null,Object? attendanceId = null,Object? userId = null,Object? workDate = null,Object? durationHours = null,Object? rateMultiplier = null,Object? reason = null,Object? status = null,Object? approvedBy = freezed,Object? createdAt = freezed,}) {
  return _then(OvertimeRecord(
otId: null == otId ? _self.otId : otId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,workDate: null == workDate ? _self.workDate : workDate // ignore: cast_nullable_to_non_nullable
as String,durationHours: null == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as double,rateMultiplier: null == rateMultiplier ? _self.rateMultiplier : rateMultiplier // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OvertimeStatus,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OvertimeRecord].
extension OvertimeRecordPatterns on OvertimeRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OvertimeRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OvertimeRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OvertimeRecord value)  $default,){
final _that = this;
switch (_that) {
case _OvertimeRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OvertimeRecord value)?  $default,){
final _that = this;
switch (_that) {
case _OvertimeRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ot_id')  String otId, @JsonKey(name: 'attendance_id')  String attendanceId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'work_date')  String workDate, @JsonKey(name: 'duration_hours')  double durationHours, @JsonKey(name: 'rate_multiplier')  double rateMultiplier, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  OvertimeStatus status, @JsonKey(name: 'approved_by')  String? approvedBy, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OvertimeRecord() when $default != null:
return $default(_that.otId,_that.attendanceId,_that.userId,_that.workDate,_that.durationHours,_that.rateMultiplier,_that.reason,_that.status,_that.approvedBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ot_id')  String otId, @JsonKey(name: 'attendance_id')  String attendanceId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'work_date')  String workDate, @JsonKey(name: 'duration_hours')  double durationHours, @JsonKey(name: 'rate_multiplier')  double rateMultiplier, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  OvertimeStatus status, @JsonKey(name: 'approved_by')  String? approvedBy, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _OvertimeRecord():
return $default(_that.otId,_that.attendanceId,_that.userId,_that.workDate,_that.durationHours,_that.rateMultiplier,_that.reason,_that.status,_that.approvedBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ot_id')  String otId, @JsonKey(name: 'attendance_id')  String attendanceId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'work_date')  String workDate, @JsonKey(name: 'duration_hours')  double durationHours, @JsonKey(name: 'rate_multiplier')  double rateMultiplier, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  OvertimeStatus status, @JsonKey(name: 'approved_by')  String? approvedBy, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _OvertimeRecord() when $default != null:
return $default(_that.otId,_that.attendanceId,_that.userId,_that.workDate,_that.durationHours,_that.rateMultiplier,_that.reason,_that.status,_that.approvedBy,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OvertimeRecord implements OvertimeRecord {
  const _OvertimeRecord({@JsonKey(name: 'ot_id') required this.otId, @JsonKey(name: 'attendance_id') required this.attendanceId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'work_date') required this.workDate, @JsonKey(name: 'duration_hours') this.durationHours = 0.0, @JsonKey(name: 'rate_multiplier') this.rateMultiplier = 1.5, @JsonKey(name: 'reason') this.reason = '', @JsonKey(name: 'status') this.status = OvertimeStatus.pending, @JsonKey(name: 'approved_by') this.approvedBy, @JsonKey(name: 'created_at') this.createdAt});
  factory _OvertimeRecord.fromJson(Map<String, dynamic> json) => _$OvertimeRecordFromJson(json);

@override@JsonKey(name: 'ot_id') final  String otId;
@override@JsonKey(name: 'attendance_id') final  String attendanceId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'work_date') final  String workDate;
@override@JsonKey(name: 'duration_hours') final  double durationHours;
@override@JsonKey(name: 'rate_multiplier') final  double rateMultiplier;
@override@JsonKey(name: 'reason') final  String reason;
@override@JsonKey(name: 'status') final  OvertimeStatus status;
@override@JsonKey(name: 'approved_by') final  String? approvedBy;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of OvertimeRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OvertimeRecordCopyWith<_OvertimeRecord> get copyWith => __$OvertimeRecordCopyWithImpl<_OvertimeRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OvertimeRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OvertimeRecord&&(identical(other.otId, otId) || other.otId == otId)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.workDate, workDate) || other.workDate == workDate)&&(identical(other.durationHours, durationHours) || other.durationHours == durationHours)&&(identical(other.rateMultiplier, rateMultiplier) || other.rateMultiplier == rateMultiplier)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,otId,attendanceId,userId,workDate,durationHours,rateMultiplier,reason,status,approvedBy,createdAt);
}

@override
String toString() {
    return 'OvertimeRecord(otId: $otId, attendanceId: $attendanceId, userId: $userId, workDate: $workDate, durationHours: $durationHours, rateMultiplier: $rateMultiplier, reason: $reason, status: $status, approvedBy: $approvedBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OvertimeRecordCopyWith<$Res> implements $OvertimeRecordCopyWith<$Res> {
  factory _$OvertimeRecordCopyWith(_OvertimeRecord value, $Res Function(_OvertimeRecord) _then) = __$OvertimeRecordCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ot_id') String otId,@JsonKey(name: 'attendance_id') String attendanceId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'work_date') String workDate,@JsonKey(name: 'duration_hours') double durationHours,@JsonKey(name: 'rate_multiplier') double rateMultiplier,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'status') OvertimeStatus status,@JsonKey(name: 'approved_by') String? approvedBy,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$OvertimeRecordCopyWithImpl<$Res>
    implements _$OvertimeRecordCopyWith<$Res> {
  __$OvertimeRecordCopyWithImpl(this._self, this._then);

  final _OvertimeRecord _self;
  final $Res Function(_OvertimeRecord) _then;

/// Create a copy of OvertimeRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otId = null,Object? attendanceId = null,Object? userId = null,Object? workDate = null,Object? durationHours = null,Object? rateMultiplier = null,Object? reason = null,Object? status = null,Object? approvedBy = freezed,Object? createdAt = freezed,}) {
  return _then(_OvertimeRecord(
otId: null == otId ? _self.otId : otId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,workDate: null == workDate ? _self.workDate : workDate // ignore: cast_nullable_to_non_nullable
as String,durationHours: null == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as double,rateMultiplier: null == rateMultiplier ? _self.rateMultiplier : rateMultiplier // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OvertimeStatus,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
