// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckInState {

 UIStatus get status; Position? get currentPosition; GeofenceResult? get geofenceResult; bool get isMockLocation; bool get isPermissionDenied; bool get isPermissionDeniedForever; bool get isGpsDisabled; bool get isCheckingLocation; String? get errorMessage; AttendanceRecord? get lastRecord; bool get canSubmit; AttendanceSettings? get settings;
/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInStateCopyWith<CheckInState> get copyWith => _$CheckInStateCopyWithImpl<CheckInState>(this as CheckInState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CheckInState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.currentPosition, _this.currentPosition) || other.currentPosition == _this.currentPosition)&&(identical(other.geofenceResult, _this.geofenceResult) || other.geofenceResult == _this.geofenceResult)&&(identical(other.isMockLocation, _this.isMockLocation) || other.isMockLocation == _this.isMockLocation)&&(identical(other.isPermissionDenied, _this.isPermissionDenied) || other.isPermissionDenied == _this.isPermissionDenied)&&(identical(other.isPermissionDeniedForever, _this.isPermissionDeniedForever) || other.isPermissionDeniedForever == _this.isPermissionDeniedForever)&&(identical(other.isGpsDisabled, _this.isGpsDisabled) || other.isGpsDisabled == _this.isGpsDisabled)&&(identical(other.isCheckingLocation, _this.isCheckingLocation) || other.isCheckingLocation == _this.isCheckingLocation)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.lastRecord, _this.lastRecord) || other.lastRecord == _this.lastRecord)&&(identical(other.canSubmit, _this.canSubmit) || other.canSubmit == _this.canSubmit)&&(identical(other.settings, _this.settings) || other.settings == _this.settings));
}


@override
int get hashCode {
  final _this = this as CheckInState;
  return Object.hash(runtimeType,_this.status,_this.currentPosition,_this.geofenceResult,_this.isMockLocation,_this.isPermissionDenied,_this.isPermissionDeniedForever,_this.isGpsDisabled,_this.isCheckingLocation,_this.errorMessage,_this.lastRecord,_this.canSubmit,_this.settings);
}

@override
String toString() {
  final _this = this as CheckInState;
  return 'CheckInState(status: ${_this.status}, currentPosition: ${_this.currentPosition}, geofenceResult: ${_this.geofenceResult}, isMockLocation: ${_this.isMockLocation}, isPermissionDenied: ${_this.isPermissionDenied}, isPermissionDeniedForever: ${_this.isPermissionDeniedForever}, isGpsDisabled: ${_this.isGpsDisabled}, isCheckingLocation: ${_this.isCheckingLocation}, errorMessage: ${_this.errorMessage}, lastRecord: ${_this.lastRecord}, canSubmit: ${_this.canSubmit}, settings: ${_this.settings})';
}


}

/// @nodoc
abstract mixin class $CheckInStateCopyWith<$Res>  {
  factory $CheckInStateCopyWith(CheckInState value, $Res Function(CheckInState) _then) = _$CheckInStateCopyWithImpl;
@useResult
$Res call({
 UIStatus status, Position? currentPosition, GeofenceResult? geofenceResult, bool isMockLocation, bool isPermissionDenied, bool isPermissionDeniedForever, bool isGpsDisabled, bool isCheckingLocation, String? errorMessage, AttendanceRecord? lastRecord, bool canSubmit, AttendanceSettings? settings
});


$AttendanceRecordCopyWith<$Res>? get lastRecord;$AttendanceSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class _$CheckInStateCopyWithImpl<$Res>
    implements $CheckInStateCopyWith<$Res> {
  _$CheckInStateCopyWithImpl(this._self, this._then);

  final CheckInState _self;
  final $Res Function(CheckInState) _then;

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? currentPosition = freezed,Object? geofenceResult = freezed,Object? isMockLocation = null,Object? isPermissionDenied = null,Object? isPermissionDeniedForever = null,Object? isGpsDisabled = null,Object? isCheckingLocation = null,Object? errorMessage = freezed,Object? lastRecord = freezed,Object? canSubmit = null,Object? settings = freezed,}) {
  return _then(CheckInState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,currentPosition: freezed == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as Position?,geofenceResult: freezed == geofenceResult ? _self.geofenceResult : geofenceResult // ignore: cast_nullable_to_non_nullable
as GeofenceResult?,isMockLocation: null == isMockLocation ? _self.isMockLocation : isMockLocation // ignore: cast_nullable_to_non_nullable
as bool,isPermissionDenied: null == isPermissionDenied ? _self.isPermissionDenied : isPermissionDenied // ignore: cast_nullable_to_non_nullable
as bool,isPermissionDeniedForever: null == isPermissionDeniedForever ? _self.isPermissionDeniedForever : isPermissionDeniedForever // ignore: cast_nullable_to_non_nullable
as bool,isGpsDisabled: null == isGpsDisabled ? _self.isGpsDisabled : isGpsDisabled // ignore: cast_nullable_to_non_nullable
as bool,isCheckingLocation: null == isCheckingLocation ? _self.isCheckingLocation : isCheckingLocation // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,lastRecord: freezed == lastRecord ? _self.lastRecord : lastRecord // ignore: cast_nullable_to_non_nullable
as AttendanceRecord?,canSubmit: null == canSubmit ? _self.canSubmit : canSubmit // ignore: cast_nullable_to_non_nullable
as bool,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AttendanceSettings?,
  ));
}
/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceRecordCopyWith<$Res>? get lastRecord {
    if (_self.lastRecord == null) {
    return null;
  }

  return $AttendanceRecordCopyWith<$Res>(_self.lastRecord!, (value) {
    return _then(_self.copyWith(lastRecord: value));
  });
}/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $AttendanceSettingsCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckInState].
extension CheckInStatePatterns on CheckInState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInState value)  $default,){
final _that = this;
switch (_that) {
case _CheckInState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInState value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UIStatus status,  Position? currentPosition,  GeofenceResult? geofenceResult,  bool isMockLocation,  bool isPermissionDenied,  bool isPermissionDeniedForever,  bool isGpsDisabled,  bool isCheckingLocation,  String? errorMessage,  AttendanceRecord? lastRecord,  bool canSubmit,  AttendanceSettings? settings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInState() when $default != null:
return $default(_that.status,_that.currentPosition,_that.geofenceResult,_that.isMockLocation,_that.isPermissionDenied,_that.isPermissionDeniedForever,_that.isGpsDisabled,_that.isCheckingLocation,_that.errorMessage,_that.lastRecord,_that.canSubmit,_that.settings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UIStatus status,  Position? currentPosition,  GeofenceResult? geofenceResult,  bool isMockLocation,  bool isPermissionDenied,  bool isPermissionDeniedForever,  bool isGpsDisabled,  bool isCheckingLocation,  String? errorMessage,  AttendanceRecord? lastRecord,  bool canSubmit,  AttendanceSettings? settings)  $default,) {final _that = this;
switch (_that) {
case _CheckInState():
return $default(_that.status,_that.currentPosition,_that.geofenceResult,_that.isMockLocation,_that.isPermissionDenied,_that.isPermissionDeniedForever,_that.isGpsDisabled,_that.isCheckingLocation,_that.errorMessage,_that.lastRecord,_that.canSubmit,_that.settings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UIStatus status,  Position? currentPosition,  GeofenceResult? geofenceResult,  bool isMockLocation,  bool isPermissionDenied,  bool isPermissionDeniedForever,  bool isGpsDisabled,  bool isCheckingLocation,  String? errorMessage,  AttendanceRecord? lastRecord,  bool canSubmit,  AttendanceSettings? settings)?  $default,) {final _that = this;
switch (_that) {
case _CheckInState() when $default != null:
return $default(_that.status,_that.currentPosition,_that.geofenceResult,_that.isMockLocation,_that.isPermissionDenied,_that.isPermissionDeniedForever,_that.isGpsDisabled,_that.isCheckingLocation,_that.errorMessage,_that.lastRecord,_that.canSubmit,_that.settings);case _:
  return null;

}
}

}

/// @nodoc


class _CheckInState implements CheckInState {
  const _CheckInState({this.status = UIStatus.initial, this.currentPosition, this.geofenceResult, this.isMockLocation = false, this.isPermissionDenied = false, this.isPermissionDeniedForever = false, this.isGpsDisabled = false, this.isCheckingLocation = false, this.errorMessage, this.lastRecord, this.canSubmit = true, this.settings});
  

@override@JsonKey() final  UIStatus status;
@override final  Position? currentPosition;
@override final  GeofenceResult? geofenceResult;
@override@JsonKey() final  bool isMockLocation;
@override@JsonKey() final  bool isPermissionDenied;
@override@JsonKey() final  bool isPermissionDeniedForever;
@override@JsonKey() final  bool isGpsDisabled;
@override@JsonKey() final  bool isCheckingLocation;
@override final  String? errorMessage;
@override final  AttendanceRecord? lastRecord;
@override@JsonKey() final  bool canSubmit;
@override final  AttendanceSettings? settings;

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInStateCopyWith<_CheckInState> get copyWith => __$CheckInStateCopyWithImpl<_CheckInState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInState&&(identical(other.status, status) || other.status == status)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.geofenceResult, geofenceResult) || other.geofenceResult == geofenceResult)&&(identical(other.isMockLocation, isMockLocation) || other.isMockLocation == isMockLocation)&&(identical(other.isPermissionDenied, isPermissionDenied) || other.isPermissionDenied == isPermissionDenied)&&(identical(other.isPermissionDeniedForever, isPermissionDeniedForever) || other.isPermissionDeniedForever == isPermissionDeniedForever)&&(identical(other.isGpsDisabled, isGpsDisabled) || other.isGpsDisabled == isGpsDisabled)&&(identical(other.isCheckingLocation, isCheckingLocation) || other.isCheckingLocation == isCheckingLocation)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.lastRecord, lastRecord) || other.lastRecord == lastRecord)&&(identical(other.canSubmit, canSubmit) || other.canSubmit == canSubmit)&&(identical(other.settings, settings) || other.settings == settings));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,currentPosition,geofenceResult,isMockLocation,isPermissionDenied,isPermissionDeniedForever,isGpsDisabled,isCheckingLocation,errorMessage,lastRecord,canSubmit,settings);
}

@override
String toString() {
    return 'CheckInState(status: $status, currentPosition: $currentPosition, geofenceResult: $geofenceResult, isMockLocation: $isMockLocation, isPermissionDenied: $isPermissionDenied, isPermissionDeniedForever: $isPermissionDeniedForever, isGpsDisabled: $isGpsDisabled, isCheckingLocation: $isCheckingLocation, errorMessage: $errorMessage, lastRecord: $lastRecord, canSubmit: $canSubmit, settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$CheckInStateCopyWith<$Res> implements $CheckInStateCopyWith<$Res> {
  factory _$CheckInStateCopyWith(_CheckInState value, $Res Function(_CheckInState) _then) = __$CheckInStateCopyWithImpl;
@override @useResult
$Res call({
 UIStatus status, Position? currentPosition, GeofenceResult? geofenceResult, bool isMockLocation, bool isPermissionDenied, bool isPermissionDeniedForever, bool isGpsDisabled, bool isCheckingLocation, String? errorMessage, AttendanceRecord? lastRecord, bool canSubmit, AttendanceSettings? settings
});


@override $AttendanceRecordCopyWith<$Res>? get lastRecord;@override $AttendanceSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class __$CheckInStateCopyWithImpl<$Res>
    implements _$CheckInStateCopyWith<$Res> {
  __$CheckInStateCopyWithImpl(this._self, this._then);

  final _CheckInState _self;
  final $Res Function(_CheckInState) _then;

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? currentPosition = freezed,Object? geofenceResult = freezed,Object? isMockLocation = null,Object? isPermissionDenied = null,Object? isPermissionDeniedForever = null,Object? isGpsDisabled = null,Object? isCheckingLocation = null,Object? errorMessage = freezed,Object? lastRecord = freezed,Object? canSubmit = null,Object? settings = freezed,}) {
  return _then(_CheckInState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,currentPosition: freezed == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as Position?,geofenceResult: freezed == geofenceResult ? _self.geofenceResult : geofenceResult // ignore: cast_nullable_to_non_nullable
as GeofenceResult?,isMockLocation: null == isMockLocation ? _self.isMockLocation : isMockLocation // ignore: cast_nullable_to_non_nullable
as bool,isPermissionDenied: null == isPermissionDenied ? _self.isPermissionDenied : isPermissionDenied // ignore: cast_nullable_to_non_nullable
as bool,isPermissionDeniedForever: null == isPermissionDeniedForever ? _self.isPermissionDeniedForever : isPermissionDeniedForever // ignore: cast_nullable_to_non_nullable
as bool,isGpsDisabled: null == isGpsDisabled ? _self.isGpsDisabled : isGpsDisabled // ignore: cast_nullable_to_non_nullable
as bool,isCheckingLocation: null == isCheckingLocation ? _self.isCheckingLocation : isCheckingLocation // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,lastRecord: freezed == lastRecord ? _self.lastRecord : lastRecord // ignore: cast_nullable_to_non_nullable
as AttendanceRecord?,canSubmit: null == canSubmit ? _self.canSubmit : canSubmit // ignore: cast_nullable_to_non_nullable
as bool,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AttendanceSettings?,
  ));
}

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceRecordCopyWith<$Res>? get lastRecord {
    if (_self.lastRecord == null) {
    return null;
  }

  return $AttendanceRecordCopyWith<$Res>(_self.lastRecord!, (value) {
    return _then(_self.copyWith(lastRecord: value));
  });
}/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $AttendanceSettingsCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

// dart format on
