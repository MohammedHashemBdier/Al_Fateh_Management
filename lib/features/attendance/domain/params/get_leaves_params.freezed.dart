// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_leaves_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetLeavesParams {

@JsonKey(name: 'user_id') String? get userId;
/// Create a copy of GetLeavesParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetLeavesParamsCopyWith<GetLeavesParams> get copyWith => _$GetLeavesParamsCopyWithImpl<GetLeavesParams>(this as GetLeavesParams, _$identity);

  /// Serializes this GetLeavesParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GetLeavesParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetLeavesParams&&(identical(other.userId, _this.userId) || other.userId == _this.userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GetLeavesParams;
  return Object.hash(runtimeType,_this.userId);
}

@override
String toString() {
  final _this = this as GetLeavesParams;
  return 'GetLeavesParams(userId: ${_this.userId})';
}


}

/// @nodoc
abstract mixin class $GetLeavesParamsCopyWith<$Res>  {
  factory $GetLeavesParamsCopyWith(GetLeavesParams value, $Res Function(GetLeavesParams) _then) = _$GetLeavesParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String? userId
});




}
/// @nodoc
class _$GetLeavesParamsCopyWithImpl<$Res>
    implements $GetLeavesParamsCopyWith<$Res> {
  _$GetLeavesParamsCopyWithImpl(this._self, this._then);

  final GetLeavesParams _self;
  final $Res Function(GetLeavesParams) _then;

/// Create a copy of GetLeavesParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,}) {
  return _then(GetLeavesParams(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetLeavesParams].
extension GetLeavesParamsPatterns on GetLeavesParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetLeavesParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetLeavesParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetLeavesParams value)  $default,){
final _that = this;
switch (_that) {
case _GetLeavesParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetLeavesParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetLeavesParams() when $default != null:
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
case _GetLeavesParams() when $default != null:
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
case _GetLeavesParams():
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
case _GetLeavesParams() when $default != null:
return $default(_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetLeavesParams implements GetLeavesParams {
  const _GetLeavesParams({@JsonKey(name: 'user_id') this.userId});
  factory _GetLeavesParams.fromJson(Map<String, dynamic> json) => _$GetLeavesParamsFromJson(json);

@override@JsonKey(name: 'user_id') final  String? userId;

/// Create a copy of GetLeavesParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetLeavesParamsCopyWith<_GetLeavesParams> get copyWith => __$GetLeavesParamsCopyWithImpl<_GetLeavesParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetLeavesParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLeavesParams&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId);
}

@override
String toString() {
    return 'GetLeavesParams(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$GetLeavesParamsCopyWith<$Res> implements $GetLeavesParamsCopyWith<$Res> {
  factory _$GetLeavesParamsCopyWith(_GetLeavesParams value, $Res Function(_GetLeavesParams) _then) = __$GetLeavesParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String? userId
});




}
/// @nodoc
class __$GetLeavesParamsCopyWithImpl<$Res>
    implements _$GetLeavesParamsCopyWith<$Res> {
  __$GetLeavesParamsCopyWithImpl(this._self, this._then);

  final _GetLeavesParams _self;
  final $Res Function(_GetLeavesParams) _then;

/// Create a copy of GetLeavesParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,}) {
  return _then(_GetLeavesParams(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
