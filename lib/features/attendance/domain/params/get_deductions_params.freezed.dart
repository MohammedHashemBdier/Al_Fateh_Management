// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_deductions_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetDeductionsParams {

@JsonKey(name: 'user_id') String? get userId;
/// Create a copy of GetDeductionsParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetDeductionsParamsCopyWith<GetDeductionsParams> get copyWith => _$GetDeductionsParamsCopyWithImpl<GetDeductionsParams>(this as GetDeductionsParams, _$identity);

  /// Serializes this GetDeductionsParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GetDeductionsParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetDeductionsParams&&(identical(other.userId, _this.userId) || other.userId == _this.userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GetDeductionsParams;
  return Object.hash(runtimeType,_this.userId);
}

@override
String toString() {
  final _this = this as GetDeductionsParams;
  return 'GetDeductionsParams(userId: ${_this.userId})';
}


}

/// @nodoc
abstract mixin class $GetDeductionsParamsCopyWith<$Res>  {
  factory $GetDeductionsParamsCopyWith(GetDeductionsParams value, $Res Function(GetDeductionsParams) _then) = _$GetDeductionsParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String? userId
});




}
/// @nodoc
class _$GetDeductionsParamsCopyWithImpl<$Res>
    implements $GetDeductionsParamsCopyWith<$Res> {
  _$GetDeductionsParamsCopyWithImpl(this._self, this._then);

  final GetDeductionsParams _self;
  final $Res Function(GetDeductionsParams) _then;

/// Create a copy of GetDeductionsParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,}) {
  return _then(GetDeductionsParams(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetDeductionsParams].
extension GetDeductionsParamsPatterns on GetDeductionsParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetDeductionsParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetDeductionsParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetDeductionsParams value)  $default,){
final _that = this;
switch (_that) {
case _GetDeductionsParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetDeductionsParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetDeductionsParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetDeductionsParams() when $default != null:
return $default(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String? userId)  $default,) {final _that = this;
switch (_that) {
case _GetDeductionsParams():
return $default(_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String? userId)?  $default,) {final _that = this;
switch (_that) {
case _GetDeductionsParams() when $default != null:
return $default(_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetDeductionsParams implements GetDeductionsParams {
  const _GetDeductionsParams({@JsonKey(name: 'user_id') this.userId});
  factory _GetDeductionsParams.fromJson(Map<String, dynamic> json) => _$GetDeductionsParamsFromJson(json);

@override@JsonKey(name: 'user_id') final  String? userId;

/// Create a copy of GetDeductionsParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetDeductionsParamsCopyWith<_GetDeductionsParams> get copyWith => __$GetDeductionsParamsCopyWithImpl<_GetDeductionsParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetDeductionsParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetDeductionsParams&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId);
}

@override
String toString() {
    return 'GetDeductionsParams(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$GetDeductionsParamsCopyWith<$Res> implements $GetDeductionsParamsCopyWith<$Res> {
  factory _$GetDeductionsParamsCopyWith(_GetDeductionsParams value, $Res Function(_GetDeductionsParams) _then) = __$GetDeductionsParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String? userId
});




}
/// @nodoc
class __$GetDeductionsParamsCopyWithImpl<$Res>
    implements _$GetDeductionsParamsCopyWith<$Res> {
  __$GetDeductionsParamsCopyWithImpl(this._self, this._then);

  final _GetDeductionsParams _self;
  final $Res Function(_GetDeductionsParams) _then;

/// Create a copy of GetDeductionsParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,}) {
  return _then(_GetDeductionsParams(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
