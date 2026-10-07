// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_today_status_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetTodayStatusParams {

@JsonKey(name: 'user_id') String get userId;
/// Create a copy of GetTodayStatusParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTodayStatusParamsCopyWith<GetTodayStatusParams> get copyWith => _$GetTodayStatusParamsCopyWithImpl<GetTodayStatusParams>(this as GetTodayStatusParams, _$identity);

  /// Serializes this GetTodayStatusParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GetTodayStatusParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTodayStatusParams&&(identical(other.userId, _this.userId) || other.userId == _this.userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GetTodayStatusParams;
  return Object.hash(runtimeType,_this.userId);
}

@override
String toString() {
  final _this = this as GetTodayStatusParams;
  return 'GetTodayStatusParams(userId: ${_this.userId})';
}


}

/// @nodoc
abstract mixin class $GetTodayStatusParamsCopyWith<$Res>  {
  factory $GetTodayStatusParamsCopyWith(GetTodayStatusParams value, $Res Function(GetTodayStatusParams) _then) = _$GetTodayStatusParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId
});




}
/// @nodoc
class _$GetTodayStatusParamsCopyWithImpl<$Res>
    implements $GetTodayStatusParamsCopyWith<$Res> {
  _$GetTodayStatusParamsCopyWithImpl(this._self, this._then);

  final GetTodayStatusParams _self;
  final $Res Function(GetTodayStatusParams) _then;

/// Create a copy of GetTodayStatusParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,}) {
  return _then(GetTodayStatusParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GetTodayStatusParams].
extension GetTodayStatusParamsPatterns on GetTodayStatusParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetTodayStatusParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetTodayStatusParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetTodayStatusParams value)  $default,){
final _that = this;
switch (_that) {
case _GetTodayStatusParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetTodayStatusParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetTodayStatusParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetTodayStatusParams() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId)  $default,) {final _that = this;
switch (_that) {
case _GetTodayStatusParams():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId)?  $default,) {final _that = this;
switch (_that) {
case _GetTodayStatusParams() when $default != null:
return $default(_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetTodayStatusParams implements GetTodayStatusParams {
  const _GetTodayStatusParams({@JsonKey(name: 'user_id') required this.userId});
  factory _GetTodayStatusParams.fromJson(Map<String, dynamic> json) => _$GetTodayStatusParamsFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;

/// Create a copy of GetTodayStatusParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTodayStatusParamsCopyWith<_GetTodayStatusParams> get copyWith => __$GetTodayStatusParamsCopyWithImpl<_GetTodayStatusParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetTodayStatusParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTodayStatusParams&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId);
}

@override
String toString() {
    return 'GetTodayStatusParams(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$GetTodayStatusParamsCopyWith<$Res> implements $GetTodayStatusParamsCopyWith<$Res> {
  factory _$GetTodayStatusParamsCopyWith(_GetTodayStatusParams value, $Res Function(_GetTodayStatusParams) _then) = __$GetTodayStatusParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId
});




}
/// @nodoc
class __$GetTodayStatusParamsCopyWithImpl<$Res>
    implements _$GetTodayStatusParamsCopyWith<$Res> {
  __$GetTodayStatusParamsCopyWithImpl(this._self, this._then);

  final _GetTodayStatusParams _self;
  final $Res Function(_GetTodayStatusParams) _then;

/// Create a copy of GetTodayStatusParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_GetTodayStatusParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
