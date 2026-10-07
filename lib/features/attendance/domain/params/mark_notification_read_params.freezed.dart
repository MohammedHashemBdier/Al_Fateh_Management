// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mark_notification_read_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarkNotificationReadParams {

@JsonKey(name: 'notification_id') String get notificationId;
/// Create a copy of MarkNotificationReadParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkNotificationReadParamsCopyWith<MarkNotificationReadParams> get copyWith => _$MarkNotificationReadParamsCopyWithImpl<MarkNotificationReadParams>(this as MarkNotificationReadParams, _$identity);

  /// Serializes this MarkNotificationReadParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MarkNotificationReadParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkNotificationReadParams&&(identical(other.notificationId, _this.notificationId) || other.notificationId == _this.notificationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MarkNotificationReadParams;
  return Object.hash(runtimeType,_this.notificationId);
}

@override
String toString() {
  final _this = this as MarkNotificationReadParams;
  return 'MarkNotificationReadParams(notificationId: ${_this.notificationId})';
}


}

/// @nodoc
abstract mixin class $MarkNotificationReadParamsCopyWith<$Res>  {
  factory $MarkNotificationReadParamsCopyWith(MarkNotificationReadParams value, $Res Function(MarkNotificationReadParams) _then) = _$MarkNotificationReadParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'notification_id') String notificationId
});




}
/// @nodoc
class _$MarkNotificationReadParamsCopyWithImpl<$Res>
    implements $MarkNotificationReadParamsCopyWith<$Res> {
  _$MarkNotificationReadParamsCopyWithImpl(this._self, this._then);

  final MarkNotificationReadParams _self;
  final $Res Function(MarkNotificationReadParams) _then;

/// Create a copy of MarkNotificationReadParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notificationId = null,}) {
  return _then(MarkNotificationReadParams(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MarkNotificationReadParams].
extension MarkNotificationReadParamsPatterns on MarkNotificationReadParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarkNotificationReadParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarkNotificationReadParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarkNotificationReadParams value)  $default,){
final _that = this;
switch (_that) {
case _MarkNotificationReadParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarkNotificationReadParams value)?  $default,){
final _that = this;
switch (_that) {
case _MarkNotificationReadParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'notification_id')  String notificationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarkNotificationReadParams() when $default != null:
return $default(_that.notificationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'notification_id')  String notificationId)  $default,) {final _that = this;
switch (_that) {
case _MarkNotificationReadParams():
return $default(_that.notificationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'notification_id')  String notificationId)?  $default,) {final _that = this;
switch (_that) {
case _MarkNotificationReadParams() when $default != null:
return $default(_that.notificationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarkNotificationReadParams implements MarkNotificationReadParams {
  const _MarkNotificationReadParams({@JsonKey(name: 'notification_id') required this.notificationId});
  factory _MarkNotificationReadParams.fromJson(Map<String, dynamic> json) => _$MarkNotificationReadParamsFromJson(json);

@override@JsonKey(name: 'notification_id') final  String notificationId;

/// Create a copy of MarkNotificationReadParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkNotificationReadParamsCopyWith<_MarkNotificationReadParams> get copyWith => __$MarkNotificationReadParamsCopyWithImpl<_MarkNotificationReadParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkNotificationReadParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkNotificationReadParams&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,notificationId);
}

@override
String toString() {
    return 'MarkNotificationReadParams(notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class _$MarkNotificationReadParamsCopyWith<$Res> implements $MarkNotificationReadParamsCopyWith<$Res> {
  factory _$MarkNotificationReadParamsCopyWith(_MarkNotificationReadParams value, $Res Function(_MarkNotificationReadParams) _then) = __$MarkNotificationReadParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'notification_id') String notificationId
});




}
/// @nodoc
class __$MarkNotificationReadParamsCopyWithImpl<$Res>
    implements _$MarkNotificationReadParamsCopyWith<$Res> {
  __$MarkNotificationReadParamsCopyWithImpl(this._self, this._then);

  final _MarkNotificationReadParams _self;
  final $Res Function(_MarkNotificationReadParams) _then;

/// Create a copy of MarkNotificationReadParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notificationId = null,}) {
  return _then(_MarkNotificationReadParams(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
