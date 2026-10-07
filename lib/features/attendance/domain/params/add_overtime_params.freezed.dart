// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_overtime_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddOvertimeParams {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'work_date') String get workDate;@JsonKey(name: 'duration_hours') double get durationHours;@JsonKey(name: 'rate_multiplier') double get rateMultiplier;@JsonKey(name: 'reason') String get reason;@JsonKey(name: 'attendance_id') String? get attendanceId;
/// Create a copy of AddOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddOvertimeParamsCopyWith<AddOvertimeParams> get copyWith => _$AddOvertimeParamsCopyWithImpl<AddOvertimeParams>(this as AddOvertimeParams, _$identity);

  /// Serializes this AddOvertimeParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AddOvertimeParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddOvertimeParams&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.workDate, _this.workDate) || other.workDate == _this.workDate)&&(identical(other.durationHours, _this.durationHours) || other.durationHours == _this.durationHours)&&(identical(other.rateMultiplier, _this.rateMultiplier) || other.rateMultiplier == _this.rateMultiplier)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.attendanceId, _this.attendanceId) || other.attendanceId == _this.attendanceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AddOvertimeParams;
  return Object.hash(runtimeType,_this.userId,_this.workDate,_this.durationHours,_this.rateMultiplier,_this.reason,_this.attendanceId);
}

@override
String toString() {
  final _this = this as AddOvertimeParams;
  return 'AddOvertimeParams(userId: ${_this.userId}, workDate: ${_this.workDate}, durationHours: ${_this.durationHours}, rateMultiplier: ${_this.rateMultiplier}, reason: ${_this.reason}, attendanceId: ${_this.attendanceId})';
}


}

/// @nodoc
abstract mixin class $AddOvertimeParamsCopyWith<$Res>  {
  factory $AddOvertimeParamsCopyWith(AddOvertimeParams value, $Res Function(AddOvertimeParams) _then) = _$AddOvertimeParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'work_date') String workDate,@JsonKey(name: 'duration_hours') double durationHours,@JsonKey(name: 'rate_multiplier') double rateMultiplier,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'attendance_id') String? attendanceId
});




}
/// @nodoc
class _$AddOvertimeParamsCopyWithImpl<$Res>
    implements $AddOvertimeParamsCopyWith<$Res> {
  _$AddOvertimeParamsCopyWithImpl(this._self, this._then);

  final AddOvertimeParams _self;
  final $Res Function(AddOvertimeParams) _then;

/// Create a copy of AddOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? workDate = null,Object? durationHours = null,Object? rateMultiplier = null,Object? reason = null,Object? attendanceId = freezed,}) {
  return _then(AddOvertimeParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,workDate: null == workDate ? _self.workDate : workDate // ignore: cast_nullable_to_non_nullable
as String,durationHours: null == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as double,rateMultiplier: null == rateMultiplier ? _self.rateMultiplier : rateMultiplier // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddOvertimeParams].
extension AddOvertimeParamsPatterns on AddOvertimeParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddOvertimeParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddOvertimeParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddOvertimeParams value)  $default,){
final _that = this;
switch (_that) {
case _AddOvertimeParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddOvertimeParams value)?  $default,){
final _that = this;
switch (_that) {
case _AddOvertimeParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'work_date')  String workDate, @JsonKey(name: 'duration_hours')  double durationHours, @JsonKey(name: 'rate_multiplier')  double rateMultiplier, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'attendance_id')  String? attendanceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddOvertimeParams() when $default != null:
return $default(_that.userId,_that.workDate,_that.durationHours,_that.rateMultiplier,_that.reason,_that.attendanceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'work_date')  String workDate, @JsonKey(name: 'duration_hours')  double durationHours, @JsonKey(name: 'rate_multiplier')  double rateMultiplier, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'attendance_id')  String? attendanceId)  $default,) {final _that = this;
switch (_that) {
case _AddOvertimeParams():
return $default(_that.userId,_that.workDate,_that.durationHours,_that.rateMultiplier,_that.reason,_that.attendanceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'work_date')  String workDate, @JsonKey(name: 'duration_hours')  double durationHours, @JsonKey(name: 'rate_multiplier')  double rateMultiplier, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'attendance_id')  String? attendanceId)?  $default,) {final _that = this;
switch (_that) {
case _AddOvertimeParams() when $default != null:
return $default(_that.userId,_that.workDate,_that.durationHours,_that.rateMultiplier,_that.reason,_that.attendanceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddOvertimeParams implements AddOvertimeParams {
  const _AddOvertimeParams({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'work_date') required this.workDate, @JsonKey(name: 'duration_hours') required this.durationHours, @JsonKey(name: 'rate_multiplier') this.rateMultiplier = 1.5, @JsonKey(name: 'reason') this.reason = '', @JsonKey(name: 'attendance_id') this.attendanceId});
  factory _AddOvertimeParams.fromJson(Map<String, dynamic> json) => _$AddOvertimeParamsFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'work_date') final  String workDate;
@override@JsonKey(name: 'duration_hours') final  double durationHours;
@override@JsonKey(name: 'rate_multiplier') final  double rateMultiplier;
@override@JsonKey(name: 'reason') final  String reason;
@override@JsonKey(name: 'attendance_id') final  String? attendanceId;

/// Create a copy of AddOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddOvertimeParamsCopyWith<_AddOvertimeParams> get copyWith => __$AddOvertimeParamsCopyWithImpl<_AddOvertimeParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddOvertimeParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddOvertimeParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.workDate, workDate) || other.workDate == workDate)&&(identical(other.durationHours, durationHours) || other.durationHours == durationHours)&&(identical(other.rateMultiplier, rateMultiplier) || other.rateMultiplier == rateMultiplier)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,workDate,durationHours,rateMultiplier,reason,attendanceId);
}

@override
String toString() {
    return 'AddOvertimeParams(userId: $userId, workDate: $workDate, durationHours: $durationHours, rateMultiplier: $rateMultiplier, reason: $reason, attendanceId: $attendanceId)';
}


}

/// @nodoc
abstract mixin class _$AddOvertimeParamsCopyWith<$Res> implements $AddOvertimeParamsCopyWith<$Res> {
  factory _$AddOvertimeParamsCopyWith(_AddOvertimeParams value, $Res Function(_AddOvertimeParams) _then) = __$AddOvertimeParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'work_date') String workDate,@JsonKey(name: 'duration_hours') double durationHours,@JsonKey(name: 'rate_multiplier') double rateMultiplier,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'attendance_id') String? attendanceId
});




}
/// @nodoc
class __$AddOvertimeParamsCopyWithImpl<$Res>
    implements _$AddOvertimeParamsCopyWith<$Res> {
  __$AddOvertimeParamsCopyWithImpl(this._self, this._then);

  final _AddOvertimeParams _self;
  final $Res Function(_AddOvertimeParams) _then;

/// Create a copy of AddOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? workDate = null,Object? durationHours = null,Object? rateMultiplier = null,Object? reason = null,Object? attendanceId = freezed,}) {
  return _then(_AddOvertimeParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,workDate: null == workDate ? _self.workDate : workDate // ignore: cast_nullable_to_non_nullable
as String,durationHours: null == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as double,rateMultiplier: null == rateMultiplier ? _self.rateMultiplier : rateMultiplier // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
