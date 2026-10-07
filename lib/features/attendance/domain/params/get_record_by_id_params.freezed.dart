// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_record_by_id_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetRecordByIdParams {

@JsonKey(name: 'record_id') String get recordId;
/// Create a copy of GetRecordByIdParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetRecordByIdParamsCopyWith<GetRecordByIdParams> get copyWith => _$GetRecordByIdParamsCopyWithImpl<GetRecordByIdParams>(this as GetRecordByIdParams, _$identity);

  /// Serializes this GetRecordByIdParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GetRecordByIdParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetRecordByIdParams&&(identical(other.recordId, _this.recordId) || other.recordId == _this.recordId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GetRecordByIdParams;
  return Object.hash(runtimeType,_this.recordId);
}

@override
String toString() {
  final _this = this as GetRecordByIdParams;
  return 'GetRecordByIdParams(recordId: ${_this.recordId})';
}


}

/// @nodoc
abstract mixin class $GetRecordByIdParamsCopyWith<$Res>  {
  factory $GetRecordByIdParamsCopyWith(GetRecordByIdParams value, $Res Function(GetRecordByIdParams) _then) = _$GetRecordByIdParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'record_id') String recordId
});




}
/// @nodoc
class _$GetRecordByIdParamsCopyWithImpl<$Res>
    implements $GetRecordByIdParamsCopyWith<$Res> {
  _$GetRecordByIdParamsCopyWithImpl(this._self, this._then);

  final GetRecordByIdParams _self;
  final $Res Function(GetRecordByIdParams) _then;

/// Create a copy of GetRecordByIdParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recordId = null,}) {
  return _then(GetRecordByIdParams(
recordId: null == recordId ? _self.recordId : recordId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GetRecordByIdParams].
extension GetRecordByIdParamsPatterns on GetRecordByIdParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetRecordByIdParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetRecordByIdParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetRecordByIdParams value)  $default,){
final _that = this;
switch (_that) {
case _GetRecordByIdParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetRecordByIdParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetRecordByIdParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'record_id')  String recordId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetRecordByIdParams() when $default != null:
return $default(_that.recordId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'record_id')  String recordId)  $default,) {final _that = this;
switch (_that) {
case _GetRecordByIdParams():
return $default(_that.recordId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'record_id')  String recordId)?  $default,) {final _that = this;
switch (_that) {
case _GetRecordByIdParams() when $default != null:
return $default(_that.recordId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetRecordByIdParams implements GetRecordByIdParams {
  const _GetRecordByIdParams({@JsonKey(name: 'record_id') required this.recordId});
  factory _GetRecordByIdParams.fromJson(Map<String, dynamic> json) => _$GetRecordByIdParamsFromJson(json);

@override@JsonKey(name: 'record_id') final  String recordId;

/// Create a copy of GetRecordByIdParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetRecordByIdParamsCopyWith<_GetRecordByIdParams> get copyWith => __$GetRecordByIdParamsCopyWithImpl<_GetRecordByIdParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetRecordByIdParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetRecordByIdParams&&(identical(other.recordId, recordId) || other.recordId == recordId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,recordId);
}

@override
String toString() {
    return 'GetRecordByIdParams(recordId: $recordId)';
}


}

/// @nodoc
abstract mixin class _$GetRecordByIdParamsCopyWith<$Res> implements $GetRecordByIdParamsCopyWith<$Res> {
  factory _$GetRecordByIdParamsCopyWith(_GetRecordByIdParams value, $Res Function(_GetRecordByIdParams) _then) = __$GetRecordByIdParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'record_id') String recordId
});




}
/// @nodoc
class __$GetRecordByIdParamsCopyWithImpl<$Res>
    implements _$GetRecordByIdParamsCopyWith<$Res> {
  __$GetRecordByIdParamsCopyWithImpl(this._self, this._then);

  final _GetRecordByIdParams _self;
  final $Res Function(_GetRecordByIdParams) _then;

/// Create a copy of GetRecordByIdParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recordId = null,}) {
  return _then(_GetRecordByIdParams(
recordId: null == recordId ? _self.recordId : recordId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
