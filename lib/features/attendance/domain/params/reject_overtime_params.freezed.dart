// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_overtime_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RejectOvertimeParams {

@JsonKey(name: 'ot_id') String get otId;@JsonKey(name: 'approver_id') String get approverId;@JsonKey(name: 'reason') String get reason;
/// Create a copy of RejectOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RejectOvertimeParamsCopyWith<RejectOvertimeParams> get copyWith => _$RejectOvertimeParamsCopyWithImpl<RejectOvertimeParams>(this as RejectOvertimeParams, _$identity);

  /// Serializes this RejectOvertimeParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RejectOvertimeParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RejectOvertimeParams&&(identical(other.otId, _this.otId) || other.otId == _this.otId)&&(identical(other.approverId, _this.approverId) || other.approverId == _this.approverId)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RejectOvertimeParams;
  return Object.hash(runtimeType,_this.otId,_this.approverId,_this.reason);
}

@override
String toString() {
  final _this = this as RejectOvertimeParams;
  return 'RejectOvertimeParams(otId: ${_this.otId}, approverId: ${_this.approverId}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $RejectOvertimeParamsCopyWith<$Res>  {
  factory $RejectOvertimeParamsCopyWith(RejectOvertimeParams value, $Res Function(RejectOvertimeParams) _then) = _$RejectOvertimeParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ot_id') String otId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'reason') String reason
});




}
/// @nodoc
class _$RejectOvertimeParamsCopyWithImpl<$Res>
    implements $RejectOvertimeParamsCopyWith<$Res> {
  _$RejectOvertimeParamsCopyWithImpl(this._self, this._then);

  final RejectOvertimeParams _self;
  final $Res Function(RejectOvertimeParams) _then;

/// Create a copy of RejectOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otId = null,Object? approverId = null,Object? reason = null,}) {
  return _then(RejectOvertimeParams(
otId: null == otId ? _self.otId : otId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RejectOvertimeParams].
extension RejectOvertimeParamsPatterns on RejectOvertimeParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RejectOvertimeParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RejectOvertimeParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RejectOvertimeParams value)  $default,){
final _that = this;
switch (_that) {
case _RejectOvertimeParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RejectOvertimeParams value)?  $default,){
final _that = this;
switch (_that) {
case _RejectOvertimeParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ot_id')  String otId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'reason')  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RejectOvertimeParams() when $default != null:
return $default(_that.otId,_that.approverId,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ot_id')  String otId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'reason')  String reason)  $default,) {final _that = this;
switch (_that) {
case _RejectOvertimeParams():
return $default(_that.otId,_that.approverId,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ot_id')  String otId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'reason')  String reason)?  $default,) {final _that = this;
switch (_that) {
case _RejectOvertimeParams() when $default != null:
return $default(_that.otId,_that.approverId,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RejectOvertimeParams implements RejectOvertimeParams {
  const _RejectOvertimeParams({@JsonKey(name: 'ot_id') required this.otId, @JsonKey(name: 'approver_id') required this.approverId, @JsonKey(name: 'reason') required this.reason});
  factory _RejectOvertimeParams.fromJson(Map<String, dynamic> json) => _$RejectOvertimeParamsFromJson(json);

@override@JsonKey(name: 'ot_id') final  String otId;
@override@JsonKey(name: 'approver_id') final  String approverId;
@override@JsonKey(name: 'reason') final  String reason;

/// Create a copy of RejectOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RejectOvertimeParamsCopyWith<_RejectOvertimeParams> get copyWith => __$RejectOvertimeParamsCopyWithImpl<_RejectOvertimeParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RejectOvertimeParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RejectOvertimeParams&&(identical(other.otId, otId) || other.otId == otId)&&(identical(other.approverId, approverId) || other.approverId == approverId)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,otId,approverId,reason);
}

@override
String toString() {
    return 'RejectOvertimeParams(otId: $otId, approverId: $approverId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$RejectOvertimeParamsCopyWith<$Res> implements $RejectOvertimeParamsCopyWith<$Res> {
  factory _$RejectOvertimeParamsCopyWith(_RejectOvertimeParams value, $Res Function(_RejectOvertimeParams) _then) = __$RejectOvertimeParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ot_id') String otId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'reason') String reason
});




}
/// @nodoc
class __$RejectOvertimeParamsCopyWithImpl<$Res>
    implements _$RejectOvertimeParamsCopyWith<$Res> {
  __$RejectOvertimeParamsCopyWithImpl(this._self, this._then);

  final _RejectOvertimeParams _self;
  final $Res Function(_RejectOvertimeParams) _then;

/// Create a copy of RejectOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otId = null,Object? approverId = null,Object? reason = null,}) {
  return _then(_RejectOvertimeParams(
otId: null == otId ? _self.otId : otId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
