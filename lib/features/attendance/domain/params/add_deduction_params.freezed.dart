// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_deduction_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddDeductionParams {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'work_date') String get workDate;@JsonKey(name: 'type') DeductionType get type;@JsonKey(name: 'amount_or_hours') double get amountOrHours;@JsonKey(name: 'reason') String get reason;@JsonKey(name: 'attendance_id') String? get attendanceId;@JsonKey(name: 'created_by') String? get createdBy;
/// Create a copy of AddDeductionParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddDeductionParamsCopyWith<AddDeductionParams> get copyWith => _$AddDeductionParamsCopyWithImpl<AddDeductionParams>(this as AddDeductionParams, _$identity);

  /// Serializes this AddDeductionParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AddDeductionParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddDeductionParams&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.workDate, _this.workDate) || other.workDate == _this.workDate)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.amountOrHours, _this.amountOrHours) || other.amountOrHours == _this.amountOrHours)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.attendanceId, _this.attendanceId) || other.attendanceId == _this.attendanceId)&&(identical(other.createdBy, _this.createdBy) || other.createdBy == _this.createdBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AddDeductionParams;
  return Object.hash(runtimeType,_this.userId,_this.workDate,_this.type,_this.amountOrHours,_this.reason,_this.attendanceId,_this.createdBy);
}

@override
String toString() {
  final _this = this as AddDeductionParams;
  return 'AddDeductionParams(userId: ${_this.userId}, workDate: ${_this.workDate}, type: ${_this.type}, amountOrHours: ${_this.amountOrHours}, reason: ${_this.reason}, attendanceId: ${_this.attendanceId}, createdBy: ${_this.createdBy})';
}


}

/// @nodoc
abstract mixin class $AddDeductionParamsCopyWith<$Res>  {
  factory $AddDeductionParamsCopyWith(AddDeductionParams value, $Res Function(AddDeductionParams) _then) = _$AddDeductionParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'work_date') String workDate,@JsonKey(name: 'type') DeductionType type,@JsonKey(name: 'amount_or_hours') double amountOrHours,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'attendance_id') String? attendanceId,@JsonKey(name: 'created_by') String? createdBy
});




}
/// @nodoc
class _$AddDeductionParamsCopyWithImpl<$Res>
    implements $AddDeductionParamsCopyWith<$Res> {
  _$AddDeductionParamsCopyWithImpl(this._self, this._then);

  final AddDeductionParams _self;
  final $Res Function(AddDeductionParams) _then;

/// Create a copy of AddDeductionParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? workDate = null,Object? type = null,Object? amountOrHours = null,Object? reason = null,Object? attendanceId = freezed,Object? createdBy = freezed,}) {
  return _then(AddDeductionParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,workDate: null == workDate ? _self.workDate : workDate // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeductionType,amountOrHours: null == amountOrHours ? _self.amountOrHours : amountOrHours // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddDeductionParams].
extension AddDeductionParamsPatterns on AddDeductionParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddDeductionParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddDeductionParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddDeductionParams value)  $default,){
final _that = this;
switch (_that) {
case _AddDeductionParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddDeductionParams value)?  $default,){
final _that = this;
switch (_that) {
case _AddDeductionParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'work_date')  String workDate, @JsonKey(name: 'type')  DeductionType type, @JsonKey(name: 'amount_or_hours')  double amountOrHours, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'attendance_id')  String? attendanceId, @JsonKey(name: 'created_by')  String? createdBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddDeductionParams() when $default != null:
return $default(_that.userId,_that.workDate,_that.type,_that.amountOrHours,_that.reason,_that.attendanceId,_that.createdBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'work_date')  String workDate, @JsonKey(name: 'type')  DeductionType type, @JsonKey(name: 'amount_or_hours')  double amountOrHours, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'attendance_id')  String? attendanceId, @JsonKey(name: 'created_by')  String? createdBy)  $default,) {final _that = this;
switch (_that) {
case _AddDeductionParams():
return $default(_that.userId,_that.workDate,_that.type,_that.amountOrHours,_that.reason,_that.attendanceId,_that.createdBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'work_date')  String workDate, @JsonKey(name: 'type')  DeductionType type, @JsonKey(name: 'amount_or_hours')  double amountOrHours, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'attendance_id')  String? attendanceId, @JsonKey(name: 'created_by')  String? createdBy)?  $default,) {final _that = this;
switch (_that) {
case _AddDeductionParams() when $default != null:
return $default(_that.userId,_that.workDate,_that.type,_that.amountOrHours,_that.reason,_that.attendanceId,_that.createdBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddDeductionParams implements AddDeductionParams {
  const _AddDeductionParams({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'work_date') required this.workDate, @JsonKey(name: 'type') this.type = DeductionType.manual, @JsonKey(name: 'amount_or_hours') required this.amountOrHours, @JsonKey(name: 'reason') required this.reason, @JsonKey(name: 'attendance_id') this.attendanceId, @JsonKey(name: 'created_by') this.createdBy});
  factory _AddDeductionParams.fromJson(Map<String, dynamic> json) => _$AddDeductionParamsFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'work_date') final  String workDate;
@override@JsonKey(name: 'type') final  DeductionType type;
@override@JsonKey(name: 'amount_or_hours') final  double amountOrHours;
@override@JsonKey(name: 'reason') final  String reason;
@override@JsonKey(name: 'attendance_id') final  String? attendanceId;
@override@JsonKey(name: 'created_by') final  String? createdBy;

/// Create a copy of AddDeductionParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddDeductionParamsCopyWith<_AddDeductionParams> get copyWith => __$AddDeductionParamsCopyWithImpl<_AddDeductionParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddDeductionParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddDeductionParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.workDate, workDate) || other.workDate == workDate)&&(identical(other.type, type) || other.type == type)&&(identical(other.amountOrHours, amountOrHours) || other.amountOrHours == amountOrHours)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,workDate,type,amountOrHours,reason,attendanceId,createdBy);
}

@override
String toString() {
    return 'AddDeductionParams(userId: $userId, workDate: $workDate, type: $type, amountOrHours: $amountOrHours, reason: $reason, attendanceId: $attendanceId, createdBy: $createdBy)';
}


}

/// @nodoc
abstract mixin class _$AddDeductionParamsCopyWith<$Res> implements $AddDeductionParamsCopyWith<$Res> {
  factory _$AddDeductionParamsCopyWith(_AddDeductionParams value, $Res Function(_AddDeductionParams) _then) = __$AddDeductionParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'work_date') String workDate,@JsonKey(name: 'type') DeductionType type,@JsonKey(name: 'amount_or_hours') double amountOrHours,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'attendance_id') String? attendanceId,@JsonKey(name: 'created_by') String? createdBy
});




}
/// @nodoc
class __$AddDeductionParamsCopyWithImpl<$Res>
    implements _$AddDeductionParamsCopyWith<$Res> {
  __$AddDeductionParamsCopyWithImpl(this._self, this._then);

  final _AddDeductionParams _self;
  final $Res Function(_AddDeductionParams) _then;

/// Create a copy of AddDeductionParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? workDate = null,Object? type = null,Object? amountOrHours = null,Object? reason = null,Object? attendanceId = freezed,Object? createdBy = freezed,}) {
  return _then(_AddDeductionParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,workDate: null == workDate ? _self.workDate : workDate // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeductionType,amountOrHours: null == amountOrHours ? _self.amountOrHours : amountOrHours // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
