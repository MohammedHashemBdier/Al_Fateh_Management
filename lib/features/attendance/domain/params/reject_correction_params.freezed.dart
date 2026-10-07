// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_correction_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RejectCorrectionParams {

@JsonKey(name: 'request_id') String get requestId;@JsonKey(name: 'approver_id') String get approverId;@JsonKey(name: 'reason') String get reason;
/// Create a copy of RejectCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RejectCorrectionParamsCopyWith<RejectCorrectionParams> get copyWith => _$RejectCorrectionParamsCopyWithImpl<RejectCorrectionParams>(this as RejectCorrectionParams, _$identity);

  /// Serializes this RejectCorrectionParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RejectCorrectionParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RejectCorrectionParams&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.approverId, _this.approverId) || other.approverId == _this.approverId)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RejectCorrectionParams;
  return Object.hash(runtimeType,_this.requestId,_this.approverId,_this.reason);
}

@override
String toString() {
  final _this = this as RejectCorrectionParams;
  return 'RejectCorrectionParams(requestId: ${_this.requestId}, approverId: ${_this.approverId}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $RejectCorrectionParamsCopyWith<$Res>  {
  factory $RejectCorrectionParamsCopyWith(RejectCorrectionParams value, $Res Function(RejectCorrectionParams) _then) = _$RejectCorrectionParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'request_id') String requestId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'reason') String reason
});




}
/// @nodoc
class _$RejectCorrectionParamsCopyWithImpl<$Res>
    implements $RejectCorrectionParamsCopyWith<$Res> {
  _$RejectCorrectionParamsCopyWithImpl(this._self, this._then);

  final RejectCorrectionParams _self;
  final $Res Function(RejectCorrectionParams) _then;

/// Create a copy of RejectCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? approverId = null,Object? reason = null,}) {
  return _then(RejectCorrectionParams(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RejectCorrectionParams].
extension RejectCorrectionParamsPatterns on RejectCorrectionParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RejectCorrectionParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RejectCorrectionParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RejectCorrectionParams value)  $default,){
final _that = this;
switch (_that) {
case _RejectCorrectionParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RejectCorrectionParams value)?  $default,){
final _that = this;
switch (_that) {
case _RejectCorrectionParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'reason')  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RejectCorrectionParams() when $default != null:
return $default(_that.requestId,_that.approverId,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'reason')  String reason)  $default,) {final _that = this;
switch (_that) {
case _RejectCorrectionParams():
return $default(_that.requestId,_that.approverId,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'reason')  String reason)?  $default,) {final _that = this;
switch (_that) {
case _RejectCorrectionParams() when $default != null:
return $default(_that.requestId,_that.approverId,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RejectCorrectionParams implements RejectCorrectionParams {
  const _RejectCorrectionParams({@JsonKey(name: 'request_id') required this.requestId, @JsonKey(name: 'approver_id') required this.approverId, @JsonKey(name: 'reason') required this.reason});
  factory _RejectCorrectionParams.fromJson(Map<String, dynamic> json) => _$RejectCorrectionParamsFromJson(json);

@override@JsonKey(name: 'request_id') final  String requestId;
@override@JsonKey(name: 'approver_id') final  String approverId;
@override@JsonKey(name: 'reason') final  String reason;

/// Create a copy of RejectCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RejectCorrectionParamsCopyWith<_RejectCorrectionParams> get copyWith => __$RejectCorrectionParamsCopyWithImpl<_RejectCorrectionParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RejectCorrectionParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RejectCorrectionParams&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.approverId, approverId) || other.approverId == approverId)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,requestId,approverId,reason);
}

@override
String toString() {
    return 'RejectCorrectionParams(requestId: $requestId, approverId: $approverId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$RejectCorrectionParamsCopyWith<$Res> implements $RejectCorrectionParamsCopyWith<$Res> {
  factory _$RejectCorrectionParamsCopyWith(_RejectCorrectionParams value, $Res Function(_RejectCorrectionParams) _then) = __$RejectCorrectionParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'request_id') String requestId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'reason') String reason
});




}
/// @nodoc
class __$RejectCorrectionParamsCopyWithImpl<$Res>
    implements _$RejectCorrectionParamsCopyWith<$Res> {
  __$RejectCorrectionParamsCopyWithImpl(this._self, this._then);

  final _RejectCorrectionParams _self;
  final $Res Function(_RejectCorrectionParams) _then;

/// Create a copy of RejectCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? approverId = null,Object? reason = null,}) {
  return _then(_RejectCorrectionParams(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
