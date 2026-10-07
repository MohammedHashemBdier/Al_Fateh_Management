// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftManagementState {

 UIStatus get status; List<Shift> get shifts; String? get errorMessage; bool get isSaving;
/// Create a copy of ShiftManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftManagementStateCopyWith<ShiftManagementState> get copyWith => _$ShiftManagementStateCopyWithImpl<ShiftManagementState>(this as ShiftManagementState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ShiftManagementState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftManagementState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.shifts, _this.shifts)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.isSaving, _this.isSaving) || other.isSaving == _this.isSaving));
}


@override
int get hashCode {
  final _this = this as ShiftManagementState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.shifts),_this.errorMessage,_this.isSaving);
}

@override
String toString() {
  final _this = this as ShiftManagementState;
  return 'ShiftManagementState(status: ${_this.status}, shifts: ${_this.shifts}, errorMessage: ${_this.errorMessage}, isSaving: ${_this.isSaving})';
}


}

/// @nodoc
abstract mixin class $ShiftManagementStateCopyWith<$Res>  {
  factory $ShiftManagementStateCopyWith(ShiftManagementState value, $Res Function(ShiftManagementState) _then) = _$ShiftManagementStateCopyWithImpl;
@useResult
$Res call({
 UIStatus status, List<Shift> shifts, String? errorMessage, bool isSaving
});




}
/// @nodoc
class _$ShiftManagementStateCopyWithImpl<$Res>
    implements $ShiftManagementStateCopyWith<$Res> {
  _$ShiftManagementStateCopyWithImpl(this._self, this._then);

  final ShiftManagementState _self;
  final $Res Function(ShiftManagementState) _then;

/// Create a copy of ShiftManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? shifts = null,Object? errorMessage = freezed,Object? isSaving = null,}) {
  return _then(ShiftManagementState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,shifts: null == shifts ? _self.shifts : shifts // ignore: cast_nullable_to_non_nullable
as List<Shift>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ShiftManagementState].
extension ShiftManagementStatePatterns on ShiftManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftManagementState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftManagementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UIStatus status,  List<Shift> shifts,  String? errorMessage,  bool isSaving)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftManagementState() when $default != null:
return $default(_that.status,_that.shifts,_that.errorMessage,_that.isSaving);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UIStatus status,  List<Shift> shifts,  String? errorMessage,  bool isSaving)  $default,) {final _that = this;
switch (_that) {
case _ShiftManagementState():
return $default(_that.status,_that.shifts,_that.errorMessage,_that.isSaving);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UIStatus status,  List<Shift> shifts,  String? errorMessage,  bool isSaving)?  $default,) {final _that = this;
switch (_that) {
case _ShiftManagementState() when $default != null:
return $default(_that.status,_that.shifts,_that.errorMessage,_that.isSaving);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftManagementState implements ShiftManagementState {
  const _ShiftManagementState({this.status = UIStatus.initial,  List<Shift> shifts = const [], this.errorMessage, this.isSaving = false}): _shifts = shifts;
  

@override@JsonKey() final  UIStatus status;
 final  List<Shift> _shifts;
@override@JsonKey() List<Shift> get shifts {
  if (_shifts is EqualUnmodifiableListView) return _shifts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shifts);
}

@override final  String? errorMessage;
@override@JsonKey() final  bool isSaving;

/// Create a copy of ShiftManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftManagementStateCopyWith<_ShiftManagementState> get copyWith => __$ShiftManagementStateCopyWithImpl<_ShiftManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftManagementState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.shifts, _shifts)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_shifts),errorMessage,isSaving);
}

@override
String toString() {
    return 'ShiftManagementState(status: $status, shifts: $shifts, errorMessage: $errorMessage, isSaving: $isSaving)';
}


}

/// @nodoc
abstract mixin class _$ShiftManagementStateCopyWith<$Res> implements $ShiftManagementStateCopyWith<$Res> {
  factory _$ShiftManagementStateCopyWith(_ShiftManagementState value, $Res Function(_ShiftManagementState) _then) = __$ShiftManagementStateCopyWithImpl;
@override @useResult
$Res call({
 UIStatus status, List<Shift> shifts, String? errorMessage, bool isSaving
});




}
/// @nodoc
class __$ShiftManagementStateCopyWithImpl<$Res>
    implements _$ShiftManagementStateCopyWith<$Res> {
  __$ShiftManagementStateCopyWithImpl(this._self, this._then);

  final _ShiftManagementState _self;
  final $Res Function(_ShiftManagementState) _then;

/// Create a copy of ShiftManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? shifts = null,Object? errorMessage = freezed,Object? isSaving = null,}) {
  return _then(_ShiftManagementState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,shifts: null == shifts ? _self._shifts : shifts // ignore: cast_nullable_to_non_nullable
as List<Shift>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
