// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveRequest {

@JsonKey(name: 'leave_id') String get leaveId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'leave_type') LeaveType get leaveType;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'end_date') String get endDate;@JsonKey(name: 'total_days_or_hours') double get totalDaysOrHours;@JsonKey(name: 'reason') String get reason;@JsonKey(name: 'status') LeaveStatus get status;@JsonKey(name: 'approved_by') String? get approvedBy;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveRequestCopyWith<LeaveRequest> get copyWith => _$LeaveRequestCopyWithImpl<LeaveRequest>(this as LeaveRequest, _$identity);

  /// Serializes this LeaveRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LeaveRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveRequest&&(identical(other.leaveId, _this.leaveId) || other.leaveId == _this.leaveId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.leaveType, _this.leaveType) || other.leaveType == _this.leaveType)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.totalDaysOrHours, _this.totalDaysOrHours) || other.totalDaysOrHours == _this.totalDaysOrHours)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.approvedBy, _this.approvedBy) || other.approvedBy == _this.approvedBy)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LeaveRequest;
  return Object.hash(runtimeType,_this.leaveId,_this.userId,_this.leaveType,_this.startDate,_this.endDate,_this.totalDaysOrHours,_this.reason,_this.status,_this.approvedBy,_this.createdAt);
}

@override
String toString() {
  final _this = this as LeaveRequest;
  return 'LeaveRequest(leaveId: ${_this.leaveId}, userId: ${_this.userId}, leaveType: ${_this.leaveType}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, totalDaysOrHours: ${_this.totalDaysOrHours}, reason: ${_this.reason}, status: ${_this.status}, approvedBy: ${_this.approvedBy}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $LeaveRequestCopyWith<$Res>  {
  factory $LeaveRequestCopyWith(LeaveRequest value, $Res Function(LeaveRequest) _then) = _$LeaveRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'leave_id') String leaveId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'leave_type') LeaveType leaveType,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_days_or_hours') double totalDaysOrHours,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'status') LeaveStatus status,@JsonKey(name: 'approved_by') String? approvedBy,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$LeaveRequestCopyWithImpl<$Res>
    implements $LeaveRequestCopyWith<$Res> {
  _$LeaveRequestCopyWithImpl(this._self, this._then);

  final LeaveRequest _self;
  final $Res Function(LeaveRequest) _then;

/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaveId = null,Object? userId = null,Object? leaveType = null,Object? startDate = null,Object? endDate = null,Object? totalDaysOrHours = null,Object? reason = null,Object? status = null,Object? approvedBy = freezed,Object? createdAt = freezed,}) {
  return _then(LeaveRequest(
leaveId: null == leaveId ? _self.leaveId : leaveId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,leaveType: null == leaveType ? _self.leaveType : leaveType // ignore: cast_nullable_to_non_nullable
as LeaveType,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalDaysOrHours: null == totalDaysOrHours ? _self.totalDaysOrHours : totalDaysOrHours // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeaveStatus,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaveRequest].
extension LeaveRequestPatterns on LeaveRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaveRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaveRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaveRequest value)  $default,){
final _that = this;
switch (_that) {
case _LeaveRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaveRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LeaveRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'leave_id')  String leaveId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'leave_type')  LeaveType leaveType, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_days_or_hours')  double totalDaysOrHours, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  LeaveStatus status, @JsonKey(name: 'approved_by')  String? approvedBy, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaveRequest() when $default != null:
return $default(_that.leaveId,_that.userId,_that.leaveType,_that.startDate,_that.endDate,_that.totalDaysOrHours,_that.reason,_that.status,_that.approvedBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'leave_id')  String leaveId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'leave_type')  LeaveType leaveType, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_days_or_hours')  double totalDaysOrHours, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  LeaveStatus status, @JsonKey(name: 'approved_by')  String? approvedBy, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _LeaveRequest():
return $default(_that.leaveId,_that.userId,_that.leaveType,_that.startDate,_that.endDate,_that.totalDaysOrHours,_that.reason,_that.status,_that.approvedBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'leave_id')  String leaveId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'leave_type')  LeaveType leaveType, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_days_or_hours')  double totalDaysOrHours, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  LeaveStatus status, @JsonKey(name: 'approved_by')  String? approvedBy, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _LeaveRequest() when $default != null:
return $default(_that.leaveId,_that.userId,_that.leaveType,_that.startDate,_that.endDate,_that.totalDaysOrHours,_that.reason,_that.status,_that.approvedBy,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaveRequest implements LeaveRequest {
  const _LeaveRequest({@JsonKey(name: 'leave_id') required this.leaveId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'leave_type') this.leaveType = LeaveType.annual, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'total_days_or_hours') this.totalDaysOrHours = 1.0, @JsonKey(name: 'reason') this.reason = '', @JsonKey(name: 'status') this.status = LeaveStatus.pending, @JsonKey(name: 'approved_by') this.approvedBy, @JsonKey(name: 'created_at') this.createdAt});
  factory _LeaveRequest.fromJson(Map<String, dynamic> json) => _$LeaveRequestFromJson(json);

@override@JsonKey(name: 'leave_id') final  String leaveId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'leave_type') final  LeaveType leaveType;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'end_date') final  String endDate;
@override@JsonKey(name: 'total_days_or_hours') final  double totalDaysOrHours;
@override@JsonKey(name: 'reason') final  String reason;
@override@JsonKey(name: 'status') final  LeaveStatus status;
@override@JsonKey(name: 'approved_by') final  String? approvedBy;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveRequestCopyWith<_LeaveRequest> get copyWith => __$LeaveRequestCopyWithImpl<_LeaveRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveRequest&&(identical(other.leaveId, leaveId) || other.leaveId == leaveId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.leaveType, leaveType) || other.leaveType == leaveType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalDaysOrHours, totalDaysOrHours) || other.totalDaysOrHours == totalDaysOrHours)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,leaveId,userId,leaveType,startDate,endDate,totalDaysOrHours,reason,status,approvedBy,createdAt);
}

@override
String toString() {
    return 'LeaveRequest(leaveId: $leaveId, userId: $userId, leaveType: $leaveType, startDate: $startDate, endDate: $endDate, totalDaysOrHours: $totalDaysOrHours, reason: $reason, status: $status, approvedBy: $approvedBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$LeaveRequestCopyWith<$Res> implements $LeaveRequestCopyWith<$Res> {
  factory _$LeaveRequestCopyWith(_LeaveRequest value, $Res Function(_LeaveRequest) _then) = __$LeaveRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'leave_id') String leaveId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'leave_type') LeaveType leaveType,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_days_or_hours') double totalDaysOrHours,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'status') LeaveStatus status,@JsonKey(name: 'approved_by') String? approvedBy,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$LeaveRequestCopyWithImpl<$Res>
    implements _$LeaveRequestCopyWith<$Res> {
  __$LeaveRequestCopyWithImpl(this._self, this._then);

  final _LeaveRequest _self;
  final $Res Function(_LeaveRequest) _then;

/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaveId = null,Object? userId = null,Object? leaveType = null,Object? startDate = null,Object? endDate = null,Object? totalDaysOrHours = null,Object? reason = null,Object? status = null,Object? approvedBy = freezed,Object? createdAt = freezed,}) {
  return _then(_LeaveRequest(
leaveId: null == leaveId ? _self.leaveId : leaveId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,leaveType: null == leaveType ? _self.leaveType : leaveType // ignore: cast_nullable_to_non_nullable
as LeaveType,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalDaysOrHours: null == totalDaysOrHours ? _self.totalDaysOrHours : totalDaysOrHours // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeaveStatus,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
