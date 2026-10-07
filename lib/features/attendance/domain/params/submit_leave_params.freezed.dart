// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_leave_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmitLeaveParams {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'leave_type') LeaveType get leaveType;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'end_date') String get endDate;@JsonKey(name: 'total_days_or_hours') double get totalDaysOrHours;@JsonKey(name: 'reason') String get reason;
/// Create a copy of SubmitLeaveParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitLeaveParamsCopyWith<SubmitLeaveParams> get copyWith => _$SubmitLeaveParamsCopyWithImpl<SubmitLeaveParams>(this as SubmitLeaveParams, _$identity);

  /// Serializes this SubmitLeaveParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SubmitLeaveParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitLeaveParams&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.leaveType, _this.leaveType) || other.leaveType == _this.leaveType)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate)&&(identical(other.totalDaysOrHours, _this.totalDaysOrHours) || other.totalDaysOrHours == _this.totalDaysOrHours)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SubmitLeaveParams;
  return Object.hash(runtimeType,_this.userId,_this.leaveType,_this.startDate,_this.endDate,_this.totalDaysOrHours,_this.reason);
}

@override
String toString() {
  final _this = this as SubmitLeaveParams;
  return 'SubmitLeaveParams(userId: ${_this.userId}, leaveType: ${_this.leaveType}, startDate: ${_this.startDate}, endDate: ${_this.endDate}, totalDaysOrHours: ${_this.totalDaysOrHours}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $SubmitLeaveParamsCopyWith<$Res>  {
  factory $SubmitLeaveParamsCopyWith(SubmitLeaveParams value, $Res Function(SubmitLeaveParams) _then) = _$SubmitLeaveParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'leave_type') LeaveType leaveType,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_days_or_hours') double totalDaysOrHours,@JsonKey(name: 'reason') String reason
});




}
/// @nodoc
class _$SubmitLeaveParamsCopyWithImpl<$Res>
    implements $SubmitLeaveParamsCopyWith<$Res> {
  _$SubmitLeaveParamsCopyWithImpl(this._self, this._then);

  final SubmitLeaveParams _self;
  final $Res Function(SubmitLeaveParams) _then;

/// Create a copy of SubmitLeaveParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? leaveType = null,Object? startDate = null,Object? endDate = null,Object? totalDaysOrHours = null,Object? reason = null,}) {
  return _then(SubmitLeaveParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,leaveType: null == leaveType ? _self.leaveType : leaveType // ignore: cast_nullable_to_non_nullable
as LeaveType,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalDaysOrHours: null == totalDaysOrHours ? _self.totalDaysOrHours : totalDaysOrHours // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitLeaveParams].
extension SubmitLeaveParamsPatterns on SubmitLeaveParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitLeaveParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitLeaveParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitLeaveParams value)  $default,){
final _that = this;
switch (_that) {
case _SubmitLeaveParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitLeaveParams value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitLeaveParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'leave_type')  LeaveType leaveType, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_days_or_hours')  double totalDaysOrHours, @JsonKey(name: 'reason')  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitLeaveParams() when $default != null:
return $default(_that.userId,_that.leaveType,_that.startDate,_that.endDate,_that.totalDaysOrHours,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'leave_type')  LeaveType leaveType, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_days_or_hours')  double totalDaysOrHours, @JsonKey(name: 'reason')  String reason)  $default,) {final _that = this;
switch (_that) {
case _SubmitLeaveParams():
return $default(_that.userId,_that.leaveType,_that.startDate,_that.endDate,_that.totalDaysOrHours,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'leave_type')  LeaveType leaveType, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_days_or_hours')  double totalDaysOrHours, @JsonKey(name: 'reason')  String reason)?  $default,) {final _that = this;
switch (_that) {
case _SubmitLeaveParams() when $default != null:
return $default(_that.userId,_that.leaveType,_that.startDate,_that.endDate,_that.totalDaysOrHours,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmitLeaveParams implements SubmitLeaveParams {
  const _SubmitLeaveParams({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'leave_type') this.leaveType = LeaveType.annual, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'total_days_or_hours') this.totalDaysOrHours = 1.0, @JsonKey(name: 'reason') this.reason = ''});
  factory _SubmitLeaveParams.fromJson(Map<String, dynamic> json) => _$SubmitLeaveParamsFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'leave_type') final  LeaveType leaveType;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'end_date') final  String endDate;
@override@JsonKey(name: 'total_days_or_hours') final  double totalDaysOrHours;
@override@JsonKey(name: 'reason') final  String reason;

/// Create a copy of SubmitLeaveParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitLeaveParamsCopyWith<_SubmitLeaveParams> get copyWith => __$SubmitLeaveParamsCopyWithImpl<_SubmitLeaveParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitLeaveParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitLeaveParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.leaveType, leaveType) || other.leaveType == leaveType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalDaysOrHours, totalDaysOrHours) || other.totalDaysOrHours == totalDaysOrHours)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,leaveType,startDate,endDate,totalDaysOrHours,reason);
}

@override
String toString() {
    return 'SubmitLeaveParams(userId: $userId, leaveType: $leaveType, startDate: $startDate, endDate: $endDate, totalDaysOrHours: $totalDaysOrHours, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$SubmitLeaveParamsCopyWith<$Res> implements $SubmitLeaveParamsCopyWith<$Res> {
  factory _$SubmitLeaveParamsCopyWith(_SubmitLeaveParams value, $Res Function(_SubmitLeaveParams) _then) = __$SubmitLeaveParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'leave_type') LeaveType leaveType,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_days_or_hours') double totalDaysOrHours,@JsonKey(name: 'reason') String reason
});




}
/// @nodoc
class __$SubmitLeaveParamsCopyWithImpl<$Res>
    implements _$SubmitLeaveParamsCopyWith<$Res> {
  __$SubmitLeaveParamsCopyWithImpl(this._self, this._then);

  final _SubmitLeaveParams _self;
  final $Res Function(_SubmitLeaveParams) _then;

/// Create a copy of SubmitLeaveParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? leaveType = null,Object? startDate = null,Object? endDate = null,Object? totalDaysOrHours = null,Object? reason = null,}) {
  return _then(_SubmitLeaveParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,leaveType: null == leaveType ? _self.leaveType : leaveType // ignore: cast_nullable_to_non_nullable
as LeaveType,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalDaysOrHours: null == totalDaysOrHours ? _self.totalDaysOrHours : totalDaysOrHours // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
