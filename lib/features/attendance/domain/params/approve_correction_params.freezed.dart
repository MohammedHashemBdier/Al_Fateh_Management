// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approve_correction_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApproveCorrectionParams {

@JsonKey(name: 'request_id') String get requestId;@JsonKey(name: 'approver_id') String get approverId;@JsonKey(name: 'decision') String get decision;@JsonKey(name: 'notes') String? get notes;
/// Create a copy of ApproveCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApproveCorrectionParamsCopyWith<ApproveCorrectionParams> get copyWith => _$ApproveCorrectionParamsCopyWithImpl<ApproveCorrectionParams>(this as ApproveCorrectionParams, _$identity);

  /// Serializes this ApproveCorrectionParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApproveCorrectionParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApproveCorrectionParams&&(identical(other.requestId, _this.requestId) || other.requestId == _this.requestId)&&(identical(other.approverId, _this.approverId) || other.approverId == _this.approverId)&&(identical(other.decision, _this.decision) || other.decision == _this.decision)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApproveCorrectionParams;
  return Object.hash(runtimeType,_this.requestId,_this.approverId,_this.decision,_this.notes);
}

@override
String toString() {
  final _this = this as ApproveCorrectionParams;
  return 'ApproveCorrectionParams(requestId: ${_this.requestId}, approverId: ${_this.approverId}, decision: ${_this.decision}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $ApproveCorrectionParamsCopyWith<$Res>  {
  factory $ApproveCorrectionParamsCopyWith(ApproveCorrectionParams value, $Res Function(ApproveCorrectionParams) _then) = _$ApproveCorrectionParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'request_id') String requestId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'decision') String decision,@JsonKey(name: 'notes') String? notes
});




}
/// @nodoc
class _$ApproveCorrectionParamsCopyWithImpl<$Res>
    implements $ApproveCorrectionParamsCopyWith<$Res> {
  _$ApproveCorrectionParamsCopyWithImpl(this._self, this._then);

  final ApproveCorrectionParams _self;
  final $Res Function(ApproveCorrectionParams) _then;

/// Create a copy of ApproveCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? approverId = null,Object? decision = null,Object? notes = freezed,}) {
  return _then(ApproveCorrectionParams(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,decision: null == decision ? _self.decision : decision // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApproveCorrectionParams].
extension ApproveCorrectionParamsPatterns on ApproveCorrectionParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApproveCorrectionParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApproveCorrectionParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApproveCorrectionParams value)  $default,){
final _that = this;
switch (_that) {
case _ApproveCorrectionParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApproveCorrectionParams value)?  $default,){
final _that = this;
switch (_that) {
case _ApproveCorrectionParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'decision')  String decision, @JsonKey(name: 'notes')  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApproveCorrectionParams() when $default != null:
return $default(_that.requestId,_that.approverId,_that.decision,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'decision')  String decision, @JsonKey(name: 'notes')  String? notes)  $default,) {final _that = this;
switch (_that) {
case _ApproveCorrectionParams():
return $default(_that.requestId,_that.approverId,_that.decision,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'approver_id')  String approverId, @JsonKey(name: 'decision')  String decision, @JsonKey(name: 'notes')  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _ApproveCorrectionParams() when $default != null:
return $default(_that.requestId,_that.approverId,_that.decision,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApproveCorrectionParams implements ApproveCorrectionParams {
  const _ApproveCorrectionParams({@JsonKey(name: 'request_id') required this.requestId, @JsonKey(name: 'approver_id') required this.approverId, @JsonKey(name: 'decision') this.decision = 'APPROVED', @JsonKey(name: 'notes') this.notes});
  factory _ApproveCorrectionParams.fromJson(Map<String, dynamic> json) => _$ApproveCorrectionParamsFromJson(json);

@override@JsonKey(name: 'request_id') final  String requestId;
@override@JsonKey(name: 'approver_id') final  String approverId;
@override@JsonKey(name: 'decision') final  String decision;
@override@JsonKey(name: 'notes') final  String? notes;

/// Create a copy of ApproveCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApproveCorrectionParamsCopyWith<_ApproveCorrectionParams> get copyWith => __$ApproveCorrectionParamsCopyWithImpl<_ApproveCorrectionParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApproveCorrectionParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApproveCorrectionParams&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.approverId, approverId) || other.approverId == approverId)&&(identical(other.decision, decision) || other.decision == decision)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,requestId,approverId,decision,notes);
}

@override
String toString() {
    return 'ApproveCorrectionParams(requestId: $requestId, approverId: $approverId, decision: $decision, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ApproveCorrectionParamsCopyWith<$Res> implements $ApproveCorrectionParamsCopyWith<$Res> {
  factory _$ApproveCorrectionParamsCopyWith(_ApproveCorrectionParams value, $Res Function(_ApproveCorrectionParams) _then) = __$ApproveCorrectionParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'request_id') String requestId,@JsonKey(name: 'approver_id') String approverId,@JsonKey(name: 'decision') String decision,@JsonKey(name: 'notes') String? notes
});




}
/// @nodoc
class __$ApproveCorrectionParamsCopyWithImpl<$Res>
    implements _$ApproveCorrectionParamsCopyWith<$Res> {
  __$ApproveCorrectionParamsCopyWithImpl(this._self, this._then);

  final _ApproveCorrectionParams _self;
  final $Res Function(_ApproveCorrectionParams) _then;

/// Create a copy of ApproveCorrectionParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? approverId = null,Object? decision = null,Object? notes = freezed,}) {
  return _then(_ApproveCorrectionParams(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,approverId: null == approverId ? _self.approverId : approverId // ignore: cast_nullable_to_non_nullable
as String,decision: null == decision ? _self.decision : decision // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
