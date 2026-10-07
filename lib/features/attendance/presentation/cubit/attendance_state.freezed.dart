// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceState {

 UIStatus get status; TodayStatus? get todayStatus; AttendanceSettings? get settings; List<Shift> get shifts; List<SiteGeofence> get sites; List<AttendanceRecord> get recentRecords; ConnectionStatus? get connectionStatus; int get pendingCount; String? get errorMessage;
/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceStateCopyWith<AttendanceState> get copyWith => _$AttendanceStateCopyWithImpl<AttendanceState>(this as AttendanceState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AttendanceState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.todayStatus, _this.todayStatus) || other.todayStatus == _this.todayStatus)&&(identical(other.settings, _this.settings) || other.settings == _this.settings)&&const DeepCollectionEquality().equals(other.shifts, _this.shifts)&&const DeepCollectionEquality().equals(other.sites, _this.sites)&&const DeepCollectionEquality().equals(other.recentRecords, _this.recentRecords)&&(identical(other.connectionStatus, _this.connectionStatus) || other.connectionStatus == _this.connectionStatus)&&(identical(other.pendingCount, _this.pendingCount) || other.pendingCount == _this.pendingCount)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as AttendanceState;
  return Object.hash(runtimeType,_this.status,_this.todayStatus,_this.settings,const DeepCollectionEquality().hash(_this.shifts),const DeepCollectionEquality().hash(_this.sites),const DeepCollectionEquality().hash(_this.recentRecords),_this.connectionStatus,_this.pendingCount,_this.errorMessage);
}

@override
String toString() {
  final _this = this as AttendanceState;
  return 'AttendanceState(status: ${_this.status}, todayStatus: ${_this.todayStatus}, settings: ${_this.settings}, shifts: ${_this.shifts}, sites: ${_this.sites}, recentRecords: ${_this.recentRecords}, connectionStatus: ${_this.connectionStatus}, pendingCount: ${_this.pendingCount}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $AttendanceStateCopyWith<$Res>  {
  factory $AttendanceStateCopyWith(AttendanceState value, $Res Function(AttendanceState) _then) = _$AttendanceStateCopyWithImpl;
@useResult
$Res call({
 UIStatus status, TodayStatus? todayStatus, AttendanceSettings? settings, List<Shift> shifts, List<SiteGeofence> sites, List<AttendanceRecord> recentRecords, ConnectionStatus? connectionStatus, int pendingCount, String? errorMessage
});


$TodayStatusCopyWith<$Res>? get todayStatus;$AttendanceSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class _$AttendanceStateCopyWithImpl<$Res>
    implements $AttendanceStateCopyWith<$Res> {
  _$AttendanceStateCopyWithImpl(this._self, this._then);

  final AttendanceState _self;
  final $Res Function(AttendanceState) _then;

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? todayStatus = freezed,Object? settings = freezed,Object? shifts = null,Object? sites = null,Object? recentRecords = null,Object? connectionStatus = freezed,Object? pendingCount = null,Object? errorMessage = freezed,}) {
  return _then(AttendanceState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,todayStatus: freezed == todayStatus ? _self.todayStatus : todayStatus // ignore: cast_nullable_to_non_nullable
as TodayStatus?,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AttendanceSettings?,shifts: null == shifts ? _self.shifts : shifts // ignore: cast_nullable_to_non_nullable
as List<Shift>,sites: null == sites ? _self.sites : sites // ignore: cast_nullable_to_non_nullable
as List<SiteGeofence>,recentRecords: null == recentRecords ? _self.recentRecords : recentRecords // ignore: cast_nullable_to_non_nullable
as List<AttendanceRecord>,connectionStatus: freezed == connectionStatus ? _self.connectionStatus : connectionStatus // ignore: cast_nullable_to_non_nullable
as ConnectionStatus?,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodayStatusCopyWith<$Res>? get todayStatus {
    if (_self.todayStatus == null) {
    return null;
  }

  return $TodayStatusCopyWith<$Res>(_self.todayStatus!, (value) {
    return _then(_self.copyWith(todayStatus: value));
  });
}/// Create a copy of AttendanceState
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


/// Adds pattern-matching-related methods to [AttendanceState].
extension AttendanceStatePatterns on AttendanceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceState value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceState value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UIStatus status,  TodayStatus? todayStatus,  AttendanceSettings? settings,  List<Shift> shifts,  List<SiteGeofence> sites,  List<AttendanceRecord> recentRecords,  ConnectionStatus? connectionStatus,  int pendingCount,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceState() when $default != null:
return $default(_that.status,_that.todayStatus,_that.settings,_that.shifts,_that.sites,_that.recentRecords,_that.connectionStatus,_that.pendingCount,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UIStatus status,  TodayStatus? todayStatus,  AttendanceSettings? settings,  List<Shift> shifts,  List<SiteGeofence> sites,  List<AttendanceRecord> recentRecords,  ConnectionStatus? connectionStatus,  int pendingCount,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AttendanceState():
return $default(_that.status,_that.todayStatus,_that.settings,_that.shifts,_that.sites,_that.recentRecords,_that.connectionStatus,_that.pendingCount,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UIStatus status,  TodayStatus? todayStatus,  AttendanceSettings? settings,  List<Shift> shifts,  List<SiteGeofence> sites,  List<AttendanceRecord> recentRecords,  ConnectionStatus? connectionStatus,  int pendingCount,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceState() when $default != null:
return $default(_that.status,_that.todayStatus,_that.settings,_that.shifts,_that.sites,_that.recentRecords,_that.connectionStatus,_that.pendingCount,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AttendanceState implements AttendanceState {
  const _AttendanceState({this.status = UIStatus.initial, this.todayStatus, this.settings,  List<Shift> shifts = const [],  List<SiteGeofence> sites = const [],  List<AttendanceRecord> recentRecords = const [], this.connectionStatus, this.pendingCount = 0, this.errorMessage}): _shifts = shifts,_sites = sites,_recentRecords = recentRecords;
  

@override@JsonKey() final  UIStatus status;
@override final  TodayStatus? todayStatus;
@override final  AttendanceSettings? settings;
 final  List<Shift> _shifts;
@override@JsonKey() List<Shift> get shifts {
  if (_shifts is EqualUnmodifiableListView) return _shifts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shifts);
}

 final  List<SiteGeofence> _sites;
@override@JsonKey() List<SiteGeofence> get sites {
  if (_sites is EqualUnmodifiableListView) return _sites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sites);
}

 final  List<AttendanceRecord> _recentRecords;
@override@JsonKey() List<AttendanceRecord> get recentRecords {
  if (_recentRecords is EqualUnmodifiableListView) return _recentRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentRecords);
}

@override final  ConnectionStatus? connectionStatus;
@override@JsonKey() final  int pendingCount;
@override final  String? errorMessage;

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceStateCopyWith<_AttendanceState> get copyWith => __$AttendanceStateCopyWithImpl<_AttendanceState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceState&&(identical(other.status, status) || other.status == status)&&(identical(other.todayStatus, todayStatus) || other.todayStatus == todayStatus)&&(identical(other.settings, settings) || other.settings == settings)&&const DeepCollectionEquality().equals(other.shifts, _shifts)&&const DeepCollectionEquality().equals(other.sites, _sites)&&const DeepCollectionEquality().equals(other.recentRecords, _recentRecords)&&(identical(other.connectionStatus, connectionStatus) || other.connectionStatus == connectionStatus)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,todayStatus,settings,const DeepCollectionEquality().hash(_shifts),const DeepCollectionEquality().hash(_sites),const DeepCollectionEquality().hash(_recentRecords),connectionStatus,pendingCount,errorMessage);
}

@override
String toString() {
    return 'AttendanceState(status: $status, todayStatus: $todayStatus, settings: $settings, shifts: $shifts, sites: $sites, recentRecords: $recentRecords, connectionStatus: $connectionStatus, pendingCount: $pendingCount, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AttendanceStateCopyWith<$Res> implements $AttendanceStateCopyWith<$Res> {
  factory _$AttendanceStateCopyWith(_AttendanceState value, $Res Function(_AttendanceState) _then) = __$AttendanceStateCopyWithImpl;
@override @useResult
$Res call({
 UIStatus status, TodayStatus? todayStatus, AttendanceSettings? settings, List<Shift> shifts, List<SiteGeofence> sites, List<AttendanceRecord> recentRecords, ConnectionStatus? connectionStatus, int pendingCount, String? errorMessage
});


@override $TodayStatusCopyWith<$Res>? get todayStatus;@override $AttendanceSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class __$AttendanceStateCopyWithImpl<$Res>
    implements _$AttendanceStateCopyWith<$Res> {
  __$AttendanceStateCopyWithImpl(this._self, this._then);

  final _AttendanceState _self;
  final $Res Function(_AttendanceState) _then;

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? todayStatus = freezed,Object? settings = freezed,Object? shifts = null,Object? sites = null,Object? recentRecords = null,Object? connectionStatus = freezed,Object? pendingCount = null,Object? errorMessage = freezed,}) {
  return _then(_AttendanceState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,todayStatus: freezed == todayStatus ? _self.todayStatus : todayStatus // ignore: cast_nullable_to_non_nullable
as TodayStatus?,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AttendanceSettings?,shifts: null == shifts ? _self._shifts : shifts // ignore: cast_nullable_to_non_nullable
as List<Shift>,sites: null == sites ? _self._sites : sites // ignore: cast_nullable_to_non_nullable
as List<SiteGeofence>,recentRecords: null == recentRecords ? _self._recentRecords : recentRecords // ignore: cast_nullable_to_non_nullable
as List<AttendanceRecord>,connectionStatus: freezed == connectionStatus ? _self.connectionStatus : connectionStatus // ignore: cast_nullable_to_non_nullable
as ConnectionStatus?,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodayStatusCopyWith<$Res>? get todayStatus {
    if (_self.todayStatus == null) {
    return null;
  }

  return $TodayStatusCopyWith<$Res>(_self.todayStatus!, (value) {
    return _then(_self.copyWith(todayStatus: value));
  });
}/// Create a copy of AttendanceState
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
