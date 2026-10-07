// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Shift {

@JsonKey(name: 'shift_id') String get shiftId;@JsonKey(name: 'shift_name') String get shiftName;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime;@JsonKey(name: 'grace_period_mins') int get gracePeriodMins;@JsonKey(name: 'overtime_threshold_mins') int get overtimeThresholdMins;@JsonKey(name: 'early_checkin_mins') int get earlyCheckinMins;@JsonKey(name: 'standard_hours') double get standardHours;@JsonKey(name: 'applicable_roles') List<String> get applicableRoles;@JsonKey(name: 'work_days') List<String> get workDays;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftCopyWith<Shift> get copyWith => _$ShiftCopyWithImpl<Shift>(this as Shift, _$identity);

  /// Serializes this Shift to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Shift;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shift&&(identical(other.shiftId, _this.shiftId) || other.shiftId == _this.shiftId)&&(identical(other.shiftName, _this.shiftName) || other.shiftName == _this.shiftName)&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.endTime, _this.endTime) || other.endTime == _this.endTime)&&(identical(other.gracePeriodMins, _this.gracePeriodMins) || other.gracePeriodMins == _this.gracePeriodMins)&&(identical(other.overtimeThresholdMins, _this.overtimeThresholdMins) || other.overtimeThresholdMins == _this.overtimeThresholdMins)&&(identical(other.earlyCheckinMins, _this.earlyCheckinMins) || other.earlyCheckinMins == _this.earlyCheckinMins)&&(identical(other.standardHours, _this.standardHours) || other.standardHours == _this.standardHours)&&const DeepCollectionEquality().equals(other.applicableRoles, _this.applicableRoles)&&const DeepCollectionEquality().equals(other.workDays, _this.workDays)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Shift;
  return Object.hash(runtimeType,_this.shiftId,_this.shiftName,_this.startTime,_this.endTime,_this.gracePeriodMins,_this.overtimeThresholdMins,_this.earlyCheckinMins,_this.standardHours,const DeepCollectionEquality().hash(_this.applicableRoles),const DeepCollectionEquality().hash(_this.workDays),_this.isActive,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as Shift;
  return 'Shift(shiftId: ${_this.shiftId}, shiftName: ${_this.shiftName}, startTime: ${_this.startTime}, endTime: ${_this.endTime}, gracePeriodMins: ${_this.gracePeriodMins}, overtimeThresholdMins: ${_this.overtimeThresholdMins}, earlyCheckinMins: ${_this.earlyCheckinMins}, standardHours: ${_this.standardHours}, applicableRoles: ${_this.applicableRoles}, workDays: ${_this.workDays}, isActive: ${_this.isActive}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ShiftCopyWith<$Res>  {
  factory $ShiftCopyWith(Shift value, $Res Function(Shift) _then) = _$ShiftCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'shift_id') String shiftId,@JsonKey(name: 'shift_name') String shiftName,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'grace_period_mins') int gracePeriodMins,@JsonKey(name: 'overtime_threshold_mins') int overtimeThresholdMins,@JsonKey(name: 'early_checkin_mins') int earlyCheckinMins,@JsonKey(name: 'standard_hours') double standardHours,@JsonKey(name: 'applicable_roles') List<String> applicableRoles,@JsonKey(name: 'work_days') List<String> workDays,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$ShiftCopyWithImpl<$Res>
    implements $ShiftCopyWith<$Res> {
  _$ShiftCopyWithImpl(this._self, this._then);

  final Shift _self;
  final $Res Function(Shift) _then;

/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shiftId = null,Object? shiftName = null,Object? startTime = null,Object? endTime = null,Object? gracePeriodMins = null,Object? overtimeThresholdMins = null,Object? earlyCheckinMins = null,Object? standardHours = null,Object? applicableRoles = null,Object? workDays = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(Shift(
shiftId: null == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String,shiftName: null == shiftName ? _self.shiftName : shiftName // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,gracePeriodMins: null == gracePeriodMins ? _self.gracePeriodMins : gracePeriodMins // ignore: cast_nullable_to_non_nullable
as int,overtimeThresholdMins: null == overtimeThresholdMins ? _self.overtimeThresholdMins : overtimeThresholdMins // ignore: cast_nullable_to_non_nullable
as int,earlyCheckinMins: null == earlyCheckinMins ? _self.earlyCheckinMins : earlyCheckinMins // ignore: cast_nullable_to_non_nullable
as int,standardHours: null == standardHours ? _self.standardHours : standardHours // ignore: cast_nullable_to_non_nullable
as double,applicableRoles: null == applicableRoles ? _self.applicableRoles : applicableRoles // ignore: cast_nullable_to_non_nullable
as List<String>,workDays: null == workDays ? _self.workDays : workDays // ignore: cast_nullable_to_non_nullable
as List<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Shift].
extension ShiftPatterns on Shift {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shift value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shift() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shift value)  $default,){
final _that = this;
switch (_that) {
case _Shift():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shift value)?  $default,){
final _that = this;
switch (_that) {
case _Shift() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'shift_id')  String shiftId, @JsonKey(name: 'shift_name')  String shiftName, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'grace_period_mins')  int gracePeriodMins, @JsonKey(name: 'overtime_threshold_mins')  int overtimeThresholdMins, @JsonKey(name: 'early_checkin_mins')  int earlyCheckinMins, @JsonKey(name: 'standard_hours')  double standardHours, @JsonKey(name: 'applicable_roles')  List<String> applicableRoles, @JsonKey(name: 'work_days')  List<String> workDays, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shift() when $default != null:
return $default(_that.shiftId,_that.shiftName,_that.startTime,_that.endTime,_that.gracePeriodMins,_that.overtimeThresholdMins,_that.earlyCheckinMins,_that.standardHours,_that.applicableRoles,_that.workDays,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'shift_id')  String shiftId, @JsonKey(name: 'shift_name')  String shiftName, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'grace_period_mins')  int gracePeriodMins, @JsonKey(name: 'overtime_threshold_mins')  int overtimeThresholdMins, @JsonKey(name: 'early_checkin_mins')  int earlyCheckinMins, @JsonKey(name: 'standard_hours')  double standardHours, @JsonKey(name: 'applicable_roles')  List<String> applicableRoles, @JsonKey(name: 'work_days')  List<String> workDays, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Shift():
return $default(_that.shiftId,_that.shiftName,_that.startTime,_that.endTime,_that.gracePeriodMins,_that.overtimeThresholdMins,_that.earlyCheckinMins,_that.standardHours,_that.applicableRoles,_that.workDays,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'shift_id')  String shiftId, @JsonKey(name: 'shift_name')  String shiftName, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'grace_period_mins')  int gracePeriodMins, @JsonKey(name: 'overtime_threshold_mins')  int overtimeThresholdMins, @JsonKey(name: 'early_checkin_mins')  int earlyCheckinMins, @JsonKey(name: 'standard_hours')  double standardHours, @JsonKey(name: 'applicable_roles')  List<String> applicableRoles, @JsonKey(name: 'work_days')  List<String> workDays, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Shift() when $default != null:
return $default(_that.shiftId,_that.shiftName,_that.startTime,_that.endTime,_that.gracePeriodMins,_that.overtimeThresholdMins,_that.earlyCheckinMins,_that.standardHours,_that.applicableRoles,_that.workDays,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Shift implements Shift {
  const _Shift({@JsonKey(name: 'shift_id') required this.shiftId, @JsonKey(name: 'shift_name') required this.shiftName, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'grace_period_mins') this.gracePeriodMins = 15, @JsonKey(name: 'overtime_threshold_mins') this.overtimeThresholdMins = 30, @JsonKey(name: 'early_checkin_mins') this.earlyCheckinMins = 30, @JsonKey(name: 'standard_hours') this.standardHours = 8.0, @JsonKey(name: 'applicable_roles')  List<String> applicableRoles = const [], @JsonKey(name: 'work_days')  List<String> workDays = const [], @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _applicableRoles = applicableRoles,_workDays = workDays;
  factory _Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

@override@JsonKey(name: 'shift_id') final  String shiftId;
@override@JsonKey(name: 'shift_name') final  String shiftName;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override@JsonKey(name: 'grace_period_mins') final  int gracePeriodMins;
@override@JsonKey(name: 'overtime_threshold_mins') final  int overtimeThresholdMins;
@override@JsonKey(name: 'early_checkin_mins') final  int earlyCheckinMins;
@override@JsonKey(name: 'standard_hours') final  double standardHours;
 final  List<String> _applicableRoles;
@override@JsonKey(name: 'applicable_roles') List<String> get applicableRoles {
  if (_applicableRoles is EqualUnmodifiableListView) return _applicableRoles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applicableRoles);
}

 final  List<String> _workDays;
@override@JsonKey(name: 'work_days') List<String> get workDays {
  if (_workDays is EqualUnmodifiableListView) return _workDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workDays);
}

@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftCopyWith<_Shift> get copyWith => __$ShiftCopyWithImpl<_Shift>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShiftToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shift&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.shiftName, shiftName) || other.shiftName == shiftName)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.gracePeriodMins, gracePeriodMins) || other.gracePeriodMins == gracePeriodMins)&&(identical(other.overtimeThresholdMins, overtimeThresholdMins) || other.overtimeThresholdMins == overtimeThresholdMins)&&(identical(other.earlyCheckinMins, earlyCheckinMins) || other.earlyCheckinMins == earlyCheckinMins)&&(identical(other.standardHours, standardHours) || other.standardHours == standardHours)&&const DeepCollectionEquality().equals(other.applicableRoles, _applicableRoles)&&const DeepCollectionEquality().equals(other.workDays, _workDays)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,shiftId,shiftName,startTime,endTime,gracePeriodMins,overtimeThresholdMins,earlyCheckinMins,standardHours,const DeepCollectionEquality().hash(_applicableRoles),const DeepCollectionEquality().hash(_workDays),isActive,createdAt,updatedAt);
}

@override
String toString() {
    return 'Shift(shiftId: $shiftId, shiftName: $shiftName, startTime: $startTime, endTime: $endTime, gracePeriodMins: $gracePeriodMins, overtimeThresholdMins: $overtimeThresholdMins, earlyCheckinMins: $earlyCheckinMins, standardHours: $standardHours, applicableRoles: $applicableRoles, workDays: $workDays, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ShiftCopyWith<$Res> implements $ShiftCopyWith<$Res> {
  factory _$ShiftCopyWith(_Shift value, $Res Function(_Shift) _then) = __$ShiftCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'shift_id') String shiftId,@JsonKey(name: 'shift_name') String shiftName,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'grace_period_mins') int gracePeriodMins,@JsonKey(name: 'overtime_threshold_mins') int overtimeThresholdMins,@JsonKey(name: 'early_checkin_mins') int earlyCheckinMins,@JsonKey(name: 'standard_hours') double standardHours,@JsonKey(name: 'applicable_roles') List<String> applicableRoles,@JsonKey(name: 'work_days') List<String> workDays,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$ShiftCopyWithImpl<$Res>
    implements _$ShiftCopyWith<$Res> {
  __$ShiftCopyWithImpl(this._self, this._then);

  final _Shift _self;
  final $Res Function(_Shift) _then;

/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shiftId = null,Object? shiftName = null,Object? startTime = null,Object? endTime = null,Object? gracePeriodMins = null,Object? overtimeThresholdMins = null,Object? earlyCheckinMins = null,Object? standardHours = null,Object? applicableRoles = null,Object? workDays = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Shift(
shiftId: null == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String,shiftName: null == shiftName ? _self.shiftName : shiftName // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,gracePeriodMins: null == gracePeriodMins ? _self.gracePeriodMins : gracePeriodMins // ignore: cast_nullable_to_non_nullable
as int,overtimeThresholdMins: null == overtimeThresholdMins ? _self.overtimeThresholdMins : overtimeThresholdMins // ignore: cast_nullable_to_non_nullable
as int,earlyCheckinMins: null == earlyCheckinMins ? _self.earlyCheckinMins : earlyCheckinMins // ignore: cast_nullable_to_non_nullable
as int,standardHours: null == standardHours ? _self.standardHours : standardHours // ignore: cast_nullable_to_non_nullable
as double,applicableRoles: null == applicableRoles ? _self._applicableRoles : applicableRoles // ignore: cast_nullable_to_non_nullable
as List<String>,workDays: null == workDays ? _self._workDays : workDays // ignore: cast_nullable_to_non_nullable
as List<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
