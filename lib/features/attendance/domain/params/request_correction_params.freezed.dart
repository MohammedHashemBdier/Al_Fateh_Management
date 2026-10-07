// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_correction_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestCorrectionParams {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'attendance_id') String get attendanceId;@JsonKey(name: 'target_date') String get targetDate;@JsonKey(name: 'corrected_check_in') String? get correctedCheckIn;@JsonKey(name: 'corrected_check_out') String? get correctedCheckOut;@JsonKey(name: 'reason') String get reason;
/// Create a copy of RequestCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestCorrectionParamsCopyWith<RequestCorrectionParams> get copyWith => _$RequestCorrectionParamsCopyWithImpl<RequestCorrectionParams>(this as RequestCorrectionParams, _$identity);

  /// Serializes this RequestCorrectionParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RequestCorrectionParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCorrectionParams&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.attendanceId, _this.attendanceId) || other.attendanceId == _this.attendanceId)&&(identical(other.targetDate, _this.targetDate) || other.targetDate == _this.targetDate)&&(identical(other.correctedCheckIn, _this.correctedCheckIn) || other.correctedCheckIn == _this.correctedCheckIn)&&(identical(other.correctedCheckOut, _this.correctedCheckOut) || other.correctedCheckOut == _this.correctedCheckOut)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RequestCorrectionParams;
  return Object.hash(runtimeType,_this.userId,_this.attendanceId,_this.targetDate,_this.correctedCheckIn,_this.correctedCheckOut,_this.reason);
}

@override
String toString() {
  final _this = this as RequestCorrectionParams;
  return 'RequestCorrectionParams(userId: ${_this.userId}, attendanceId: ${_this.attendanceId}, targetDate: ${_this.targetDate}, correctedCheckIn: ${_this.correctedCheckIn}, correctedCheckOut: ${_this.correctedCheckOut}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $RequestCorrectionParamsCopyWith<$Res>  {
  factory $RequestCorrectionParamsCopyWith(RequestCorrectionParams value, $Res Function(RequestCorrectionParams) _then) = _$RequestCorrectionParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'attendance_id') String attendanceId,@JsonKey(name: 'target_date') String targetDate,@JsonKey(name: 'corrected_check_in') String? correctedCheckIn,@JsonKey(name: 'corrected_check_out') String? correctedCheckOut,@JsonKey(name: 'reason') String reason
});




}
/// @nodoc
class _$RequestCorrectionParamsCopyWithImpl<$Res>
    implements $RequestCorrectionParamsCopyWith<$Res> {
  _$RequestCorrectionParamsCopyWithImpl(this._self, this._then);

  final RequestCorrectionParams _self;
  final $Res Function(RequestCorrectionParams) _then;

/// Create a copy of RequestCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? attendanceId = null,Object? targetDate = null,Object? correctedCheckIn = freezed,Object? correctedCheckOut = freezed,Object? reason = null,}) {
  return _then(RequestCorrectionParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as String,correctedCheckIn: freezed == correctedCheckIn ? _self.correctedCheckIn : correctedCheckIn // ignore: cast_nullable_to_non_nullable
as String?,correctedCheckOut: freezed == correctedCheckOut ? _self.correctedCheckOut : correctedCheckOut // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestCorrectionParams].
extension RequestCorrectionParamsPatterns on RequestCorrectionParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestCorrectionParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestCorrectionParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestCorrectionParams value)  $default,){
final _that = this;
switch (_that) {
case _RequestCorrectionParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestCorrectionParams value)?  $default,){
final _that = this;
switch (_that) {
case _RequestCorrectionParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'attendance_id')  String attendanceId, @JsonKey(name: 'target_date')  String targetDate, @JsonKey(name: 'corrected_check_in')  String? correctedCheckIn, @JsonKey(name: 'corrected_check_out')  String? correctedCheckOut, @JsonKey(name: 'reason')  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestCorrectionParams() when $default != null:
return $default(_that.userId,_that.attendanceId,_that.targetDate,_that.correctedCheckIn,_that.correctedCheckOut,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'attendance_id')  String attendanceId, @JsonKey(name: 'target_date')  String targetDate, @JsonKey(name: 'corrected_check_in')  String? correctedCheckIn, @JsonKey(name: 'corrected_check_out')  String? correctedCheckOut, @JsonKey(name: 'reason')  String reason)  $default,) {final _that = this;
switch (_that) {
case _RequestCorrectionParams():
return $default(_that.userId,_that.attendanceId,_that.targetDate,_that.correctedCheckIn,_that.correctedCheckOut,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'attendance_id')  String attendanceId, @JsonKey(name: 'target_date')  String targetDate, @JsonKey(name: 'corrected_check_in')  String? correctedCheckIn, @JsonKey(name: 'corrected_check_out')  String? correctedCheckOut, @JsonKey(name: 'reason')  String reason)?  $default,) {final _that = this;
switch (_that) {
case _RequestCorrectionParams() when $default != null:
return $default(_that.userId,_that.attendanceId,_that.targetDate,_that.correctedCheckIn,_that.correctedCheckOut,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestCorrectionParams implements RequestCorrectionParams {
  const _RequestCorrectionParams({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'attendance_id') required this.attendanceId, @JsonKey(name: 'target_date') required this.targetDate, @JsonKey(name: 'corrected_check_in') this.correctedCheckIn, @JsonKey(name: 'corrected_check_out') this.correctedCheckOut, @JsonKey(name: 'reason') required this.reason});
  factory _RequestCorrectionParams.fromJson(Map<String, dynamic> json) => _$RequestCorrectionParamsFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'attendance_id') final  String attendanceId;
@override@JsonKey(name: 'target_date') final  String targetDate;
@override@JsonKey(name: 'corrected_check_in') final  String? correctedCheckIn;
@override@JsonKey(name: 'corrected_check_out') final  String? correctedCheckOut;
@override@JsonKey(name: 'reason') final  String reason;

/// Create a copy of RequestCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestCorrectionParamsCopyWith<_RequestCorrectionParams> get copyWith => __$RequestCorrectionParamsCopyWithImpl<_RequestCorrectionParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestCorrectionParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestCorrectionParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.correctedCheckIn, correctedCheckIn) || other.correctedCheckIn == correctedCheckIn)&&(identical(other.correctedCheckOut, correctedCheckOut) || other.correctedCheckOut == correctedCheckOut)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,attendanceId,targetDate,correctedCheckIn,correctedCheckOut,reason);
}

@override
String toString() {
    return 'RequestCorrectionParams(userId: $userId, attendanceId: $attendanceId, targetDate: $targetDate, correctedCheckIn: $correctedCheckIn, correctedCheckOut: $correctedCheckOut, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$RequestCorrectionParamsCopyWith<$Res> implements $RequestCorrectionParamsCopyWith<$Res> {
  factory _$RequestCorrectionParamsCopyWith(_RequestCorrectionParams value, $Res Function(_RequestCorrectionParams) _then) = __$RequestCorrectionParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'attendance_id') String attendanceId,@JsonKey(name: 'target_date') String targetDate,@JsonKey(name: 'corrected_check_in') String? correctedCheckIn,@JsonKey(name: 'corrected_check_out') String? correctedCheckOut,@JsonKey(name: 'reason') String reason
});




}
/// @nodoc
class __$RequestCorrectionParamsCopyWithImpl<$Res>
    implements _$RequestCorrectionParamsCopyWith<$Res> {
  __$RequestCorrectionParamsCopyWithImpl(this._self, this._then);

  final _RequestCorrectionParams _self;
  final $Res Function(_RequestCorrectionParams) _then;

/// Create a copy of RequestCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? attendanceId = null,Object? targetDate = null,Object? correctedCheckIn = freezed,Object? correctedCheckOut = freezed,Object? reason = null,}) {
  return _then(_RequestCorrectionParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as String,correctedCheckIn: freezed == correctedCheckIn ? _self.correctedCheckIn : correctedCheckIn // ignore: cast_nullable_to_non_nullable
as String?,correctedCheckOut: freezed == correctedCheckOut ? _self.correctedCheckOut : correctedCheckOut // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
