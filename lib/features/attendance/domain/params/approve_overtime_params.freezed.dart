// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approve_overtime_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApproveOvertimeParams {

@JsonKey(name: 'ot_id') String get otId;@JsonKey(name: 'approver_id') String get approverId;@JsonKey(name: 'notes') String? get notes;
/// Create a copy of ApproveOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApproveOvertimeParamsCopyWith<ApproveOvertimeParams> get copyWith => _$ApproveOvertimeParamsCopyWithImpl<ApproveOvertimeParams>(this as ApproveOvertimeParams, _$identity);

  /// Serializes this ApproveOvertimeParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApproveOvertimeParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApproveOvertimeParams&&(identical(other.otId, _this.otId) || other.otId == _this.otId)&&(identical(other.approverId, _this.approverId) || other.approverId == _this.approverId)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApproveOvertimeParams;
  return Object.hash(runtimeType,_this.otId,_this.approverId,_this.notes);
}

@override
String toString() {
  final _this = this as ApproveOvertimeParams;
  return 'ApproveOvertimeParams(otId: ${_this.otId}, approverId: ${_this.approverId}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $ApproveOvertimeParamsCopyWith<$Res>  {
  factory $ApproveOvertimeParamsCopyWith(ApproveOvertimeParams value, $Res Function(ApproveOvertimeParams) _then) = _$ApproveOvertimeParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ot_id') String otId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'notes') String? notes
});




}
/// @nodoc
class _$ApproveOvertimeParamsCopyWithImpl<$Res>
    implements $ApproveOvertimeParamsCopyWith<$Res> {
  _$ApproveOvertimeParamsCopyWithImpl(this._self, this._then);

  final ApproveOvertimeParams _self;
  final $Res Function(ApproveOvertimeParams) _then;

/// Create a copy of ApproveOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otId = null,Object? approverId = null,Object? notes = freezed,}) {
  return _then(ApproveOvertimeParams(
otId: null == otId ? _self.otId : otId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApproveOvertimeParams].
extension ApproveOvertimeParamsPatterns on ApproveOvertimeParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApproveOvertimeParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApproveOvertimeParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApproveOvertimeParams value)  $default,){
final _that = this;
switch (_that) {
case _ApproveOvertimeParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApproveOvertimeParams value)?  $default,){
final _that = this;
switch (_that) {
case _ApproveOvertimeParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ot_id')  String otId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'notes')  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApproveOvertimeParams() when $default != null:
return $default(_that.otId,_that.approverId,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ot_id')  String otId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'notes')  String? notes)  $default,) {final _that = this;
switch (_that) {
case _ApproveOvertimeParams():
return $default(_that.otId,_that.approverId,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ot_id')  String otId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'notes')  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _ApproveOvertimeParams() when $default != null:
return $default(_that.otId,_that.approverId,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApproveOvertimeParams implements ApproveOvertimeParams {
  const _ApproveOvertimeParams({@JsonKey(name: 'ot_id') required this.otId, @JsonKey(name: 'approver_id') required this.approverId, @JsonKey(name: 'notes') this.notes});
  factory _ApproveOvertimeParams.fromJson(Map<String, dynamic> json) => _$ApproveOvertimeParamsFromJson(json);

@override@JsonKey(name: 'ot_id') final  String otId;
@override@JsonKey(name: 'approver_id') final  String approverId;
@override@JsonKey(name: 'notes') final  String? notes;

/// Create a copy of ApproveOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApproveOvertimeParamsCopyWith<_ApproveOvertimeParams> get copyWith => __$ApproveOvertimeParamsCopyWithImpl<_ApproveOvertimeParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApproveOvertimeParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApproveOvertimeParams&&(identical(other.otId, otId) || other.otId == otId)&&(identical(other.approverId, approverId) || other.approverId == approverId)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,otId,approverId,notes);
}

@override
String toString() {
    return 'ApproveOvertimeParams(otId: $otId, approverId: $approverId, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ApproveOvertimeParamsCopyWith<$Res> implements $ApproveOvertimeParamsCopyWith<$Res> {
  factory _$ApproveOvertimeParamsCopyWith(_ApproveOvertimeParams value, $Res Function(_ApproveOvertimeParams) _then) = __$ApproveOvertimeParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ot_id') String otId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'notes') String? notes
});




}
/// @nodoc
class __$ApproveOvertimeParamsCopyWithImpl<$Res>
    implements _$ApproveOvertimeParamsCopyWith<$Res> {
  __$ApproveOvertimeParamsCopyWithImpl(this._self, this._then);

  final _ApproveOvertimeParams _self;
  final $Res Function(_ApproveOvertimeParams) _then;

/// Create a copy of ApproveOvertimeParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otId = null,Object? approverId = null,Object? notes = freezed,}) {
  return _then(_ApproveOvertimeParams(
otId: null == otId ? _self.otId : otId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
