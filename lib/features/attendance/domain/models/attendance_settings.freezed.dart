// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceSettings {

@JsonKey(name: 'default_geofence_radius') double get defaultGeofenceRadius;@JsonKey(name: 'max_allowed_gps_accuracy') double get maxAllowedGpsAccuracy;@JsonKey(name: 'enable_mock_detection') bool get enableMockDetection;@JsonKey(name: 'allow_browser_checkin') bool get allowBrowserCheckin;@JsonKey(name: 'payroll_lock_day') int get payrollLockDay;
/// Create a copy of AttendanceSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceSettingsCopyWith<AttendanceSettings> get copyWith => _$AttendanceSettingsCopyWithImpl<AttendanceSettings>(this as AttendanceSettings, _$identity);

  /// Serializes this AttendanceSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AttendanceSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceSettings&&(identical(other.defaultGeofenceRadius, _this.defaultGeofenceRadius) || other.defaultGeofenceRadius == _this.defaultGeofenceRadius)&&(identical(other.maxAllowedGpsAccuracy, _this.maxAllowedGpsAccuracy) || other.maxAllowedGpsAccuracy == _this.maxAllowedGpsAccuracy)&&(identical(other.enableMockDetection, _this.enableMockDetection) || other.enableMockDetection == _this.enableMockDetection)&&(identical(other.allowBrowserCheckin, _this.allowBrowserCheckin) || other.allowBrowserCheckin == _this.allowBrowserCheckin)&&(identical(other.payrollLockDay, _this.payrollLockDay) || other.payrollLockDay == _this.payrollLockDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AttendanceSettings;
  return Object.hash(runtimeType,_this.defaultGeofenceRadius,_this.maxAllowedGpsAccuracy,_this.enableMockDetection,_this.allowBrowserCheckin,_this.payrollLockDay);
}

@override
String toString() {
  final _this = this as AttendanceSettings;
  return 'AttendanceSettings(defaultGeofenceRadius: ${_this.defaultGeofenceRadius}, maxAllowedGpsAccuracy: ${_this.maxAllowedGpsAccuracy}, enableMockDetection: ${_this.enableMockDetection}, allowBrowserCheckin: ${_this.allowBrowserCheckin}, payrollLockDay: ${_this.payrollLockDay})';
}


}

/// @nodoc
abstract mixin class $AttendanceSettingsCopyWith<$Res>  {
  factory $AttendanceSettingsCopyWith(AttendanceSettings value, $Res Function(AttendanceSettings) _then) = _$AttendanceSettingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'default_geofence_radius') double defaultGeofenceRadius,@JsonKey(name: 'max_allowed_gps_accuracy') double maxAllowedGpsAccuracy,@JsonKey(name: 'enable_mock_detection') bool enableMockDetection,@JsonKey(name: 'allow_browser_checkin') bool allowBrowserCheckin,@JsonKey(name: 'payroll_lock_day') int payrollLockDay
});




}
/// @nodoc
class _$AttendanceSettingsCopyWithImpl<$Res>
    implements $AttendanceSettingsCopyWith<$Res> {
  _$AttendanceSettingsCopyWithImpl(this._self, this._then);

  final AttendanceSettings _self;
  final $Res Function(AttendanceSettings) _then;

/// Create a copy of AttendanceSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? defaultGeofenceRadius = null,Object? maxAllowedGpsAccuracy = null,Object? enableMockDetection = null,Object? allowBrowserCheckin = null,Object? payrollLockDay = null,}) {
  return _then(AttendanceSettings(
defaultGeofenceRadius: null == defaultGeofenceRadius ? _self.defaultGeofenceRadius : defaultGeofenceRadius // ignore: cast_nullable_to_non_nullable
as double,maxAllowedGpsAccuracy: null == maxAllowedGpsAccuracy ? _self.maxAllowedGpsAccuracy : maxAllowedGpsAccuracy // ignore: cast_nullable_to_non_nullable
as double,enableMockDetection: null == enableMockDetection ? _self.enableMockDetection : enableMockDetection // ignore: cast_nullable_to_non_nullable
as bool,allowBrowserCheckin: null == allowBrowserCheckin ? _self.allowBrowserCheckin : allowBrowserCheckin // ignore: cast_nullable_to_non_nullable
as bool,payrollLockDay: null == payrollLockDay ? _self.payrollLockDay : payrollLockDay // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceSettings].
extension AttendanceSettingsPatterns on AttendanceSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceSettings value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'default_geofence_radius')  double defaultGeofenceRadius, @JsonKey(name: 'max_allowed_gps_accuracy')  double maxAllowedGpsAccuracy, @JsonKey(name: 'enable_mock_detection')  bool enableMockDetection, @JsonKey(name: 'allow_browser_checkin')  bool allowBrowserCheckin, @JsonKey(name: 'payroll_lock_day')  int payrollLockDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceSettings() when $default != null:
return $default(_that.defaultGeofenceRadius,_that.maxAllowedGpsAccuracy,_that.enableMockDetection,_that.allowBrowserCheckin,_that.payrollLockDay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'default_geofence_radius')  double defaultGeofenceRadius, @JsonKey(name: 'max_allowed_gps_accuracy')  double maxAllowedGpsAccuracy, @JsonKey(name: 'enable_mock_detection')  bool enableMockDetection, @JsonKey(name: 'allow_browser_checkin')  bool allowBrowserCheckin, @JsonKey(name: 'payroll_lock_day')  int payrollLockDay)  $default,) {final _that = this;
switch (_that) {
case _AttendanceSettings():
return $default(_that.defaultGeofenceRadius,_that.maxAllowedGpsAccuracy,_that.enableMockDetection,_that.allowBrowserCheckin,_that.payrollLockDay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'default_geofence_radius')  double defaultGeofenceRadius, @JsonKey(name: 'max_allowed_gps_accuracy')  double maxAllowedGpsAccuracy, @JsonKey(name: 'enable_mock_detection')  bool enableMockDetection, @JsonKey(name: 'allow_browser_checkin')  bool allowBrowserCheckin, @JsonKey(name: 'payroll_lock_day')  int payrollLockDay)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceSettings() when $default != null:
return $default(_that.defaultGeofenceRadius,_that.maxAllowedGpsAccuracy,_that.enableMockDetection,_that.allowBrowserCheckin,_that.payrollLockDay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceSettings implements AttendanceSettings {
  const _AttendanceSettings({@JsonKey(name: 'default_geofence_radius') this.defaultGeofenceRadius = 50.0, @JsonKey(name: 'max_allowed_gps_accuracy') this.maxAllowedGpsAccuracy = 30.0, @JsonKey(name: 'enable_mock_detection') this.enableMockDetection = true, @JsonKey(name: 'allow_browser_checkin') this.allowBrowserCheckin = true, @JsonKey(name: 'payroll_lock_day') this.payrollLockDay = 28});
  factory _AttendanceSettings.fromJson(Map<String, dynamic> json) => _$AttendanceSettingsFromJson(json);

@override@JsonKey(name: 'default_geofence_radius') final  double defaultGeofenceRadius;
@override@JsonKey(name: 'max_allowed_gps_accuracy') final  double maxAllowedGpsAccuracy;
@override@JsonKey(name: 'enable_mock_detection') final  bool enableMockDetection;
@override@JsonKey(name: 'allow_browser_checkin') final  bool allowBrowserCheckin;
@override@JsonKey(name: 'payroll_lock_day') final  int payrollLockDay;

/// Create a copy of AttendanceSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceSettingsCopyWith<_AttendanceSettings> get copyWith => __$AttendanceSettingsCopyWithImpl<_AttendanceSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceSettings&&(identical(other.defaultGeofenceRadius, defaultGeofenceRadius) || other.defaultGeofenceRadius == defaultGeofenceRadius)&&(identical(other.maxAllowedGpsAccuracy, maxAllowedGpsAccuracy) || other.maxAllowedGpsAccuracy == maxAllowedGpsAccuracy)&&(identical(other.enableMockDetection, enableMockDetection) || other.enableMockDetection == enableMockDetection)&&(identical(other.allowBrowserCheckin, allowBrowserCheckin) || other.allowBrowserCheckin == allowBrowserCheckin)&&(identical(other.payrollLockDay, payrollLockDay) || other.payrollLockDay == payrollLockDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,defaultGeofenceRadius,maxAllowedGpsAccuracy,enableMockDetection,allowBrowserCheckin,payrollLockDay);
}

@override
String toString() {
    return 'AttendanceSettings(defaultGeofenceRadius: $defaultGeofenceRadius, maxAllowedGpsAccuracy: $maxAllowedGpsAccuracy, enableMockDetection: $enableMockDetection, allowBrowserCheckin: $allowBrowserCheckin, payrollLockDay: $payrollLockDay)';
}


}

/// @nodoc
abstract mixin class _$AttendanceSettingsCopyWith<$Res> implements $AttendanceSettingsCopyWith<$Res> {
  factory _$AttendanceSettingsCopyWith(_AttendanceSettings value, $Res Function(_AttendanceSettings) _then) = __$AttendanceSettingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'default_geofence_radius') double defaultGeofenceRadius,@JsonKey(name: 'max_allowed_gps_accuracy') double maxAllowedGpsAccuracy,@JsonKey(name: 'enable_mock_detection') bool enableMockDetection,@JsonKey(name: 'allow_browser_checkin') bool allowBrowserCheckin,@JsonKey(name: 'payroll_lock_day') int payrollLockDay
});




}
/// @nodoc
class __$AttendanceSettingsCopyWithImpl<$Res>
    implements _$AttendanceSettingsCopyWith<$Res> {
  __$AttendanceSettingsCopyWithImpl(this._self, this._then);

  final _AttendanceSettings _self;
  final $Res Function(_AttendanceSettings) _then;

/// Create a copy of AttendanceSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? defaultGeofenceRadius = null,Object? maxAllowedGpsAccuracy = null,Object? enableMockDetection = null,Object? allowBrowserCheckin = null,Object? payrollLockDay = null,}) {
  return _then(_AttendanceSettings(
defaultGeofenceRadius: null == defaultGeofenceRadius ? _self.defaultGeofenceRadius : defaultGeofenceRadius // ignore: cast_nullable_to_non_nullable
as double,maxAllowedGpsAccuracy: null == maxAllowedGpsAccuracy ? _self.maxAllowedGpsAccuracy : maxAllowedGpsAccuracy // ignore: cast_nullable_to_non_nullable
as double,enableMockDetection: null == enableMockDetection ? _self.enableMockDetection : enableMockDetection // ignore: cast_nullable_to_non_nullable
as bool,allowBrowserCheckin: null == allowBrowserCheckin ? _self.allowBrowserCheckin : allowBrowserCheckin // ignore: cast_nullable_to_non_nullable
as bool,payrollLockDay: null == payrollLockDay ? _self.payrollLockDay : payrollLockDay // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
