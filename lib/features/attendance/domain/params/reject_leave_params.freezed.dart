// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_leave_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RejectLeaveParams {

@JsonKey(name: 'leave_id') String get leaveId;@JsonKey(name: 'approver_id') String get approverId;@JsonKey(name: 'reason') String get reason;
/// Create a copy of RejectLeaveParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RejectLeaveParamsCopyWith<RejectLeaveParams> get copyWith => _$RejectLeaveParamsCopyWithImpl<RejectLeaveParams>(this as RejectLeaveParams, _$identity);

  /// Serializes this RejectLeaveParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RejectLeaveParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RejectLeaveParams&&(identical(other.leaveId, _this.leaveId) || other.leaveId == _this.leaveId)&&(identical(other.approverId, _this.approverId) || other.approverId == _this.approverId)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RejectLeaveParams;
  return Object.hash(runtimeType,_this.leaveId,_this.approverId,_this.reason);
}

@override
String toString() {
  final _this = this as RejectLeaveParams;
  return 'RejectLeaveParams(leaveId: ${_this.leaveId}, approverId: ${_this.approverId}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $RejectLeaveParamsCopyWith<$Res>  {
  factory $RejectLeaveParamsCopyWith(RejectLeaveParams value, $Res Function(RejectLeaveParams) _then) = _$RejectLeaveParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'leave_id') String leaveId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'reason') String reason
});




}
/// @nodoc
class _$RejectLeaveParamsCopyWithImpl<$Res>
    implements $RejectLeaveParamsCopyWith<$Res> {
  _$RejectLeaveParamsCopyWithImpl(this._self, this._then);

  final RejectLeaveParams _self;
  final $Res Function(RejectLeaveParams) _then;

/// Create a copy of RejectLeaveParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaveId = null,Object? approverId = null,Object? reason = null,}) {
  return _then(RejectLeaveParams(
leaveId: null == leaveId ? _self.leaveId : leaveId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RejectLeaveParams].
extension RejectLeaveParamsPatterns on RejectLeaveParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RejectLeaveParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RejectLeaveParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RejectLeaveParams value)  $default,){
final _that = this;
switch (_that) {
case _RejectLeaveParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RejectLeaveParams value)?  $default,){
final _that = this;
switch (_that) {
case _RejectLeaveParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'leave_id')  String leaveId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'reason')  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RejectLeaveParams() when $default != null:
return $default(_that.leaveId,_that.approverId,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'leave_id')  String leaveId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'reason')  String reason)  $default,) {final _that = this;
switch (_that) {
case _RejectLeaveParams():
return $default(_that.leaveId,_that.approverId,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'leave_id')  String leaveId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'reason')  String reason)?  $default,) {final _that = this;
switch (_that) {
case _RejectLeaveParams() when $default != null:
return $default(_that.leaveId,_that.approverId,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RejectLeaveParams implements RejectLeaveParams {
  const _RejectLeaveParams({@JsonKey(name: 'leave_id') required this.leaveId, @JsonKey(name: 'approver_id') required this.approverId, @JsonKey(name: 'reason') required this.reason});
  factory _RejectLeaveParams.fromJson(Map<String, dynamic> json) => _$RejectLeaveParamsFromJson(json);

@override@JsonKey(name: 'leave_id') final  String leaveId;
@override@JsonKey(name: 'approver_id') final  String approverId;
@override@JsonKey(name: 'reason') final  String reason;

/// Create a copy of RejectLeaveParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RejectLeaveParamsCopyWith<_RejectLeaveParams> get copyWith => __$RejectLeaveParamsCopyWithImpl<_RejectLeaveParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RejectLeaveParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RejectLeaveParams&&(identical(other.leaveId, leaveId) || other.leaveId == leaveId)&&(identical(other.approverId, approverId) || other.approverId == approverId)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,leaveId,approverId,reason);
}

@override
String toString() {
    return 'RejectLeaveParams(leaveId: $leaveId, approverId: $approverId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$RejectLeaveParamsCopyWith<$Res> implements $RejectLeaveParamsCopyWith<$Res> {
  factory _$RejectLeaveParamsCopyWith(_RejectLeaveParams value, $Res Function(_RejectLeaveParams) _then) = __$RejectLeaveParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'leave_id') String leaveId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'reason') String reason
});




}
/// @nodoc
class __$RejectLeaveParamsCopyWithImpl<$Res>
    implements _$RejectLeaveParamsCopyWith<$Res> {
  __$RejectLeaveParamsCopyWithImpl(this._self, this._then);

  final _RejectLeaveParams _self;
  final $Res Function(_RejectLeaveParams) _then;

/// Create a copy of RejectLeaveParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaveId = null,Object? approverId = null,Object? reason = null,}) {
  return _then(_RejectLeaveParams(
leaveId: null == leaveId ? _self.leaveId : leaveId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
