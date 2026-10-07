// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'correction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CorrectionRequest {

@JsonKey(name: 'request_id') String get requestId;@JsonKey(name: 'attendance_id') String get attendanceId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'target_date') String get targetDate;@JsonKey(name: 'corrected_check_in') String? get correctedCheckIn;@JsonKey(name: 'corrected_check_out') String? get correctedCheckOut;@JsonKey(name: 'reason') String get reason;@JsonKey(name: 'status') CorrectionStatus get status;@JsonKey(name: 'approver_id') String? get approverId;@JsonKey(name: 'decision_notes') String? get decisionNotes;@JsonKey(name: 'action_date') String? get actionDate;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of CorrectionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorrectionRequestCopyWith<CorrectionRequest> get copyWith => _$CorrectionRequestCopyWithImpl<CorrectionRequest>(this as CorrectionRequest, _$identity);

  /// Serializes this CorrectionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CorrectionRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CorrectionRequest&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.attendanceId, _this.attendanceId) || other.attendanceId == _this.attendanceId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.targetDate, _this.targetDate) || other.targetDate == _this.targetDate)&&(identical(other.correctedCheckIn, _this.correctedCheckIn) || other.correctedCheckIn == _this.correctedCheckIn)&&(identical(other.correctedCheckOut, _this.correctedCheckOut) || other.correctedCheckOut == _this.correctedCheckOut)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.approverId, _this.approverId) || other.approverId == _this.approverId)&&(identical(other.decisionNotes, _this.decisionNotes) || other.decisionNotes == _this.decisionNotes)&&(identical(other.actionDate, _this.actionDate) || other.actionDate == _this.actionDate)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CorrectionRequest;
  return Object.hash(runtimeType,_this.requestId,_this.attendanceId,_this.userId,_this.targetDate,_this.correctedCheckIn,_this.correctedCheckOut,_this.reason,_this.status,_this.approverId,_this.decisionNotes,_this.actionDate,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as CorrectionRequest;
  return 'CorrectionRequest(requestId: ${_this.requestId}, attendanceId: ${_this.attendanceId}, userId: ${_this.userId}, targetDate: ${_this.targetDate}, correctedCheckIn: ${_this.correctedCheckIn}, correctedCheckOut: ${_this.correctedCheckOut}, reason: ${_this.reason}, status: ${_this.status}, approverId: ${_this.approverId}, decisionNotes: ${_this.decisionNotes}, actionDate: ${_this.actionDate}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $CorrectionRequestCopyWith<$Res>  {
  factory $CorrectionRequestCopyWith(CorrectionRequest value, $Res Function(CorrectionRequest) _then) = _$CorrectionRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'request_id') String requestId,@JsonKey(name: 'attendance_id') String attendanceId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'target_date') String targetDate,@JsonKey(name: 'corrected_check_in') String? correctedCheckIn,@JsonKey(name: 'corrected_check_out') String? correctedCheckOut,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'status') CorrectionStatus status,@JsonKey(name: 'approver_id') String? approverId,@JsonKey(name: 'decision_notes') String? decisionNotes,@JsonKey(name: 'action_date') String? actionDate,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$CorrectionRequestCopyWithImpl<$Res>
    implements $CorrectionRequestCopyWith<$Res> {
  _$CorrectionRequestCopyWithImpl(this._self, this._then);

  final CorrectionRequest _self;
  final $Res Function(CorrectionRequest) _then;

/// Create a copy of CorrectionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? attendanceId = null,Object? userId = null,Object? targetDate = null,Object? correctedCheckIn = freezed,Object? correctedCheckOut = freezed,Object? reason = null,Object? status = null,Object? approverId = freezed,Object? decisionNotes = freezed,Object? actionDate = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(CorrectionRequest(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as String,correctedCheckIn: freezed == correctedCheckIn ? _self.correctedCheckIn : correctedCheckIn // ignore: cast_nullable_to_non_nullable
as String?,correctedCheckOut: freezed == correctedCheckOut ? _self.correctedCheckOut : correctedCheckOut // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CorrectionStatus,approverId: freezed == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String?,decisionNotes: freezed == decisionNotes ? _self.decisionNotes : decisionNotes // ignore: cast_nullable_to_non_nullable
as String?,actionDate: freezed == actionDate ? _self.actionDate : actionDate // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CorrectionRequest].
extension CorrectionRequestPatterns on CorrectionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CorrectionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CorrectionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CorrectionRequest value)  $default,){
final _that = this;
switch (_that) {
case _CorrectionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CorrectionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CorrectionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'attendance_id')  String attendanceId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'target_date')  String targetDate, @JsonKey(name: 'corrected_check_in')  String? correctedCheckIn, @JsonKey(name: 'corrected_check_out')  String? correctedCheckOut, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  CorrectionStatus status, @JsonKey(name: 'approver_id')  String? approverId, @JsonKey(name: 'decision_notes')  String? decisionNotes, @JsonKey(name: 'action_date')  String? actionDate, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CorrectionRequest() when $default != null:
return $default(_that.requestId,_that.attendanceId,_that.userId,_that.targetDate,_that.correctedCheckIn,_that.correctedCheckOut,_that.reason,_that.status,_that.approverId,_that.decisionNotes,_that.actionDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'attendance_id')  String attendanceId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'target_date')  String targetDate, @JsonKey(name: 'corrected_check_in')  String? correctedCheckIn, @JsonKey(name: 'corrected_check_out')  String? correctedCheckOut, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  CorrectionStatus status, @JsonKey(name: 'approver_id')  String? approverId, @JsonKey(name: 'decision_notes')  String? decisionNotes, @JsonKey(name: 'action_date')  String? actionDate, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CorrectionRequest():
return $default(_that.requestId,_that.attendanceId,_that.userId,_that.targetDate,_that.correctedCheckIn,_that.correctedCheckOut,_that.reason,_that.status,_that.approverId,_that.decisionNotes,_that.actionDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'attendance_id')  String attendanceId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'target_date')  String targetDate, @JsonKey(name: 'corrected_check_in')  String? correctedCheckIn, @JsonKey(name: 'corrected_check_out')  String? correctedCheckOut, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  CorrectionStatus status, @JsonKey(name: 'approver_id')  String? approverId, @JsonKey(name: 'decision_notes')  String? decisionNotes, @JsonKey(name: 'action_date')  String? actionDate, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CorrectionRequest() when $default != null:
return $default(_that.requestId,_that.attendanceId,_that.userId,_that.targetDate,_that.correctedCheckIn,_that.correctedCheckOut,_that.reason,_that.status,_that.approverId,_that.decisionNotes,_that.actionDate,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CorrectionRequest implements CorrectionRequest {
  const _CorrectionRequest({@JsonKey(name: 'request_id') required this.requestId, @JsonKey(name: 'attendance_id') required this.attendanceId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'target_date') required this.targetDate, @JsonKey(name: 'corrected_check_in') this.correctedCheckIn, @JsonKey(name: 'corrected_check_out') this.correctedCheckOut, @JsonKey(name: 'reason') this.reason = '', @JsonKey(name: 'status') this.status = CorrectionStatus.pending, @JsonKey(name: 'approver_id') this.approverId, @JsonKey(name: 'decision_notes') this.decisionNotes, @JsonKey(name: 'action_date') this.actionDate, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _CorrectionRequest.fromJson(Map<String, dynamic> json) => _$CorrectionRequestFromJson(json);

@override@JsonKey(name: 'request_id') final  String requestId;
@override@JsonKey(name: 'attendance_id') final  String attendanceId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'target_date') final  String targetDate;
@override@JsonKey(name: 'corrected_check_in') final  String? correctedCheckIn;
@override@JsonKey(name: 'corrected_check_out') final  String? correctedCheckOut;
@override@JsonKey(name: 'reason') final  String reason;
@override@JsonKey(name: 'status') final  CorrectionStatus status;
@override@JsonKey(name: 'approver_id') final  String? approverId;
@override@JsonKey(name: 'decision_notes') final  String? decisionNotes;
@override@JsonKey(name: 'action_date') final  String? actionDate;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of CorrectionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CorrectionRequestCopyWith<_CorrectionRequest> get copyWith => __$CorrectionRequestCopyWithImpl<_CorrectionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CorrectionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CorrectionRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.correctedCheckIn, correctedCheckIn) || other.correctedCheckIn == correctedCheckIn)&&(identical(other.correctedCheckOut, correctedCheckOut) || other.correctedCheckOut == correctedCheckOut)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.approverId, approverId) || other.approverId == approverId)&&(identical(other.decisionNotes, decisionNotes) || other.decisionNotes == decisionNotes)&&(identical(other.actionDate, actionDate) || other.actionDate == actionDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,requestId,attendanceId,userId,targetDate,correctedCheckIn,correctedCheckOut,reason,status,approverId,decisionNotes,actionDate,createdAt,updatedAt);
}

@override
String toString() {
    return 'CorrectionRequest(requestId: $requestId, attendanceId: $attendanceId, userId: $userId, targetDate: $targetDate, correctedCheckIn: $correctedCheckIn, correctedCheckOut: $correctedCheckOut, reason: $reason, status: $status, approverId: $approverId, decisionNotes: $decisionNotes, actionDate: $actionDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CorrectionRequestCopyWith<$Res> implements $CorrectionRequestCopyWith<$Res> {
  factory _$CorrectionRequestCopyWith(_CorrectionRequest value, $Res Function(_CorrectionRequest) _then) = __$CorrectionRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'request_id') String requestId,@JsonKey(name: 'attendance_id') String attendanceId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'target_date') String targetDate,@JsonKey(name: 'corrected_check_in') String? correctedCheckIn,@JsonKey(name: 'corrected_check_out') String? correctedCheckOut,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'status') CorrectionStatus status,@JsonKey(name: 'approver_id') String? approverId,@JsonKey(name: 'decision_notes') String? decisionNotes,@JsonKey(name: 'action_date') String? actionDate,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$CorrectionRequestCopyWithImpl<$Res>
    implements _$CorrectionRequestCopyWith<$Res> {
  __$CorrectionRequestCopyWithImpl(this._self, this._then);

  final _CorrectionRequest _self;
  final $Res Function(_CorrectionRequest) _then;

/// Create a copy of CorrectionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? attendanceId = null,Object? userId = null,Object? targetDate = null,Object? correctedCheckIn = freezed,Object? correctedCheckOut = freezed,Object? reason = null,Object? status = null,Object? approverId = freezed,Object? decisionNotes = freezed,Object? actionDate = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CorrectionRequest(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as String,correctedCheckIn: freezed == correctedCheckIn ? _self.correctedCheckIn : correctedCheckIn // ignore: cast_nullable_to_non_nullable
as String?,correctedCheckOut: freezed == correctedCheckOut ? _self.correctedCheckOut : correctedCheckOut // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CorrectionStatus,approverId: freezed == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String?,decisionNotes: freezed == decisionNotes ? _self.decisionNotes : decisionNotes // ignore: cast_nullable_to_non_nullable
as String?,actionDate: freezed == actionDate ? _self.actionDate : actionDate // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
