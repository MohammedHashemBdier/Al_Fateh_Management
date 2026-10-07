// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approve_leave_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApproveLeaveParams {

@JsonKey(name: 'leave_id') String get leaveId;@JsonKey(name: 'approver_id') String get approverId;@JsonKey(name: 'notes') String? get notes;
/// Create a copy of ApproveLeaveParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApproveLeaveParamsCopyWith<ApproveLeaveParams> get copyWith => _$ApproveLeaveParamsCopyWithImpl<ApproveLeaveParams>(this as ApproveLeaveParams, _$identity);

  /// Serializes this ApproveLeaveParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApproveLeaveParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApproveLeaveParams&&(identical(other.leaveId, _this.leaveId) || other.leaveId == _this.leaveId)&&(identical(other.approverId, _this.approverId) || other.approverId == _this.approverId)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApproveLeaveParams;
  return Object.hash(runtimeType,_this.leaveId,_this.approverId,_this.notes);
}

@override
String toString() {
  final _this = this as ApproveLeaveParams;
  return 'ApproveLeaveParams(leaveId: ${_this.leaveId}, approverId: ${_this.approverId}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $ApproveLeaveParamsCopyWith<$Res>  {
  factory $ApproveLeaveParamsCopyWith(ApproveLeaveParams value, $Res Function(ApproveLeaveParams) _then) = _$ApproveLeaveParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'leave_id') String leaveId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'notes') String? notes
});




}
/// @nodoc
class _$ApproveLeaveParamsCopyWithImpl<$Res>
    implements $ApproveLeaveParamsCopyWith<$Res> {
  _$ApproveLeaveParamsCopyWithImpl(this._self, this._then);

  final ApproveLeaveParams _self;
  final $Res Function(ApproveLeaveParams) _then;

/// Create a copy of ApproveLeaveParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaveId = null,Object? approverId = null,Object? notes = freezed,}) {
  return _then(ApproveLeaveParams(
leaveId: null == leaveId ? _self.leaveId : leaveId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApproveLeaveParams].
extension ApproveLeaveParamsPatterns on ApproveLeaveParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApproveLeaveParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApproveLeaveParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApproveLeaveParams value)  $default,){
final _that = this;
switch (_that) {
case _ApproveLeaveParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApproveLeaveParams value)?  $default,){
final _that = this;
switch (_that) {
case _ApproveLeaveParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'leave_id')  String leaveId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'notes')  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApproveLeaveParams() when $default != null:
return $default(_that.leaveId,_that.approverId,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'leave_id')  String leaveId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'notes')  String? notes)  $default,) {final _that = this;
switch (_that) {
case _ApproveLeaveParams():
return $default(_that.leaveId,_that.approverId,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'leave_id')  String leaveId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'notes')  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _ApproveLeaveParams() when $default != null:
return $default(_that.leaveId,_that.approverId,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApproveLeaveParams implements ApproveLeaveParams {
  const _ApproveLeaveParams({@JsonKey(name: 'leave_id') required this.leaveId, @JsonKey(name: 'approver_id') required this.approverId, @JsonKey(name: 'notes') this.notes});
  factory _ApproveLeaveParams.fromJson(Map<String, dynamic> json) => _$ApproveLeaveParamsFromJson(json);

@override@JsonKey(name: 'leave_id') final  String leaveId;
@override@JsonKey(name: 'approver_id') final  String approverId;
@override@JsonKey(name: 'notes') final  String? notes;

/// Create a copy of ApproveLeaveParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApproveLeaveParamsCopyWith<_ApproveLeaveParams> get copyWith => __$ApproveLeaveParamsCopyWithImpl<_ApproveLeaveParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApproveLeaveParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApproveLeaveParams&&(identical(other.leaveId, leaveId) || other.leaveId == leaveId)&&(identical(other.approverId, approverId) || other.approverId == approverId)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,leaveId,approverId,notes);
}

@override
String toString() {
    return 'ApproveLeaveParams(leaveId: $leaveId, approverId: $approverId, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ApproveLeaveParamsCopyWith<$Res> implements $ApproveLeaveParamsCopyWith<$Res> {
  factory _$ApproveLeaveParamsCopyWith(_ApproveLeaveParams value, $Res Function(_ApproveLeaveParams) _then) = __$ApproveLeaveParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'leave_id') String leaveId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'notes') String? notes
});




}
/// @nodoc
class __$ApproveLeaveParamsCopyWithImpl<$Res>
    implements _$ApproveLeaveParamsCopyWith<$Res> {
  __$ApproveLeaveParamsCopyWithImpl(this._self, this._then);

  final _ApproveLeaveParams _self;
  final $Res Function(_ApproveLeaveParams) _then;

/// Create a copy of ApproveLeaveParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaveId = null,Object? approverId = null,Object? notes = freezed,}) {
  return _then(_ApproveLeaveParams(
leaveId: null == leaveId ? _self.leaveId : leaveId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
