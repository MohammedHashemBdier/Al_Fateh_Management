// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_report_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceReportSummary {

 int get totalDays; int get presentDays; int get absentDays; int get lateDays; int get leaveDays; double get totalActualHours; double get totalOvertimeHours; int get totalLateMinutes; int get totalEarlyLeaveMinutes; double get totalDeductionsAmount;
/// Create a copy of AttendanceReportSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceReportSummaryCopyWith<AttendanceReportSummary> get copyWith => _$AttendanceReportSummaryCopyWithImpl<AttendanceReportSummary>(this as AttendanceReportSummary, _$identity);

  /// Serializes this AttendanceReportSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AttendanceReportSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceReportSummary&&(identical(other.totalDays, _this.totalDays) || other.totalDays == _this.totalDays)&&(identical(other.presentDays, _this.presentDays) || other.presentDays == _this.presentDays)&&(identical(other.absentDays, _this.absentDays) || other.absentDays == _this.absentDays)&&(identical(other.lateDays, _this.lateDays) || other.lateDays == _this.lateDays)&&(identical(other.leaveDays, _this.leaveDays) || other.leaveDays == _this.leaveDays)&&(identical(other.totalActualHours, _this.totalActualHours) || other.totalActualHours == _this.totalActualHours)&&(identical(other.totalOvertimeHours, _this.totalOvertimeHours) || other.totalOvertimeHours == _this.totalOvertimeHours)&&(identical(other.totalLateMinutes, _this.totalLateMinutes) || other.totalLateMinutes == _this.totalLateMinutes)&&(identical(other.totalEarlyLeaveMinutes, _this.totalEarlyLeaveMinutes) || other.totalEarlyLeaveMinutes == _this.totalEarlyLeaveMinutes)&&(identical(other.totalDeductionsAmount, _this.totalDeductionsAmount) || other.totalDeductionsAmount == _this.totalDeductionsAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AttendanceReportSummary;
  return Object.hash(runtimeType,_this.totalDays,_this.presentDays,_this.absentDays,_this.lateDays,_this.leaveDays,_this.totalActualHours,_this.totalOvertimeHours,_this.totalLateMinutes,_this.totalEarlyLeaveMinutes,_this.totalDeductionsAmount);
}

@override
String toString() {
  final _this = this as AttendanceReportSummary;
  return 'AttendanceReportSummary(totalDays: ${_this.totalDays}, presentDays: ${_this.presentDays}, absentDays: ${_this.absentDays}, lateDays: ${_this.lateDays}, leaveDays: ${_this.leaveDays}, totalActualHours: ${_this.totalActualHours}, totalOvertimeHours: ${_this.totalOvertimeHours}, totalLateMinutes: ${_this.totalLateMinutes}, totalEarlyLeaveMinutes: ${_this.totalEarlyLeaveMinutes}, totalDeductionsAmount: ${_this.totalDeductionsAmount})';
}


}

/// @nodoc
abstract mixin class $AttendanceReportSummaryCopyWith<$Res>  {
  factory $AttendanceReportSummaryCopyWith(AttendanceReportSummary value, $Res Function(AttendanceReportSummary) _then) = _$AttendanceReportSummaryCopyWithImpl;
@useResult
$Res call({
 int totalDays, int presentDays, int absentDays, int lateDays, int leaveDays, double totalActualHours, double totalOvertimeHours, int totalLateMinutes, int totalEarlyLeaveMinutes, double totalDeductionsAmount
});




}
/// @nodoc
class _$AttendanceReportSummaryCopyWithImpl<$Res>
    implements $AttendanceReportSummaryCopyWith<$Res> {
  _$AttendanceReportSummaryCopyWithImpl(this._self, this._then);

  final AttendanceReportSummary _self;
  final $Res Function(AttendanceReportSummary) _then;

/// Create a copy of AttendanceReportSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDays = null,Object? presentDays = null,Object? absentDays = null,Object? lateDays = null,Object? leaveDays = null,Object? totalActualHours = null,Object? totalOvertimeHours = null,Object? totalLateMinutes = null,Object? totalEarlyLeaveMinutes = null,Object? totalDeductionsAmount = null,}) {
  return _then(AttendanceReportSummary(
totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,presentDays: null == presentDays ? _self.presentDays : presentDays // ignore: cast_nullable_to_non_nullable
as int,absentDays: null == absentDays ? _self.absentDays : absentDays // ignore: cast_nullable_to_non_nullable
as int,lateDays: null == lateDays ? _self.lateDays : lateDays // ignore: cast_nullable_to_non_nullable
as int,leaveDays: null == leaveDays ? _self.leaveDays : leaveDays // ignore: cast_nullable_to_non_nullable
as int,totalActualHours: null == totalActualHours ? _self.totalActualHours : totalActualHours // ignore: cast_nullable_to_non_nullable
as double,totalOvertimeHours: null == totalOvertimeHours ? _self.totalOvertimeHours : totalOvertimeHours // ignore: cast_nullable_to_non_nullable
as double,totalLateMinutes: null == totalLateMinutes ? _self.totalLateMinutes : totalLateMinutes // ignore: cast_nullable_to_non_nullable
as int,totalEarlyLeaveMinutes: null == totalEarlyLeaveMinutes ? _self.totalEarlyLeaveMinutes : totalEarlyLeaveMinutes // ignore: cast_nullable_to_non_nullable
as int,totalDeductionsAmount: null == totalDeductionsAmount ? _self.totalDeductionsAmount : totalDeductionsAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceReportSummary].
extension AttendanceReportSummaryPatterns on AttendanceReportSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceReportSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceReportSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceReportSummary value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceReportSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceReportSummary value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceReportSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalDays,  int presentDays,  int absentDays,  int lateDays,  int leaveDays,  double totalActualHours,  double totalOvertimeHours,  int totalLateMinutes,  int totalEarlyLeaveMinutes,  double totalDeductionsAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceReportSummary() when $default != null:
return $default(_that.totalDays,_that.presentDays,_that.absentDays,_that.lateDays,_that.leaveDays,_that.totalActualHours,_that.totalOvertimeHours,_that.totalLateMinutes,_that.totalEarlyLeaveMinutes,_that.totalDeductionsAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalDays,  int presentDays,  int absentDays,  int lateDays,  int leaveDays,  double totalActualHours,  double totalOvertimeHours,  int totalLateMinutes,  int totalEarlyLeaveMinutes,  double totalDeductionsAmount)  $default,) {final _that = this;
switch (_that) {
case _AttendanceReportSummary():
return $default(_that.totalDays,_that.presentDays,_that.absentDays,_that.lateDays,_that.leaveDays,_that.totalActualHours,_that.totalOvertimeHours,_that.totalLateMinutes,_that.totalEarlyLeaveMinutes,_that.totalDeductionsAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalDays,  int presentDays,  int absentDays,  int lateDays,  int leaveDays,  double totalActualHours,  double totalOvertimeHours,  int totalLateMinutes,  int totalEarlyLeaveMinutes,  double totalDeductionsAmount)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceReportSummary() when $default != null:
return $default(_that.totalDays,_that.presentDays,_that.absentDays,_that.lateDays,_that.leaveDays,_that.totalActualHours,_that.totalOvertimeHours,_that.totalLateMinutes,_that.totalEarlyLeaveMinutes,_that.totalDeductionsAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceReportSummary implements AttendanceReportSummary {
  const _AttendanceReportSummary({this.totalDays = 0, this.presentDays = 0, this.absentDays = 0, this.lateDays = 0, this.leaveDays = 0, this.totalActualHours = 0.0, this.totalOvertimeHours = 0.0, this.totalLateMinutes = 0, this.totalEarlyLeaveMinutes = 0, this.totalDeductionsAmount = 0.0});
  factory _AttendanceReportSummary.fromJson(Map<String, dynamic> json) => _$AttendanceReportSummaryFromJson(json);

@override@JsonKey() final  int totalDays;
@override@JsonKey() final  int presentDays;
@override@JsonKey() final  int absentDays;
@override@JsonKey() final  int lateDays;
@override@JsonKey() final  int leaveDays;
@override@JsonKey() final  double totalActualHours;
@override@JsonKey() final  double totalOvertimeHours;
@override@JsonKey() final  int totalLateMinutes;
@override@JsonKey() final  int totalEarlyLeaveMinutes;
@override@JsonKey() final  double totalDeductionsAmount;

/// Create a copy of AttendanceReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceReportSummaryCopyWith<_AttendanceReportSummary> get copyWith => __$AttendanceReportSummaryCopyWithImpl<_AttendanceReportSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceReportSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceReportSummary&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.presentDays, presentDays) || other.presentDays == presentDays)&&(identical(other.absentDays, absentDays) || other.absentDays == absentDays)&&(identical(other.lateDays, lateDays) || other.lateDays == lateDays)&&(identical(other.leaveDays, leaveDays) || other.leaveDays == leaveDays)&&(identical(other.totalActualHours, totalActualHours) || other.totalActualHours == totalActualHours)&&(identical(other.totalOvertimeHours, totalOvertimeHours) || other.totalOvertimeHours == totalOvertimeHours)&&(identical(other.totalLateMinutes, totalLateMinutes) || other.totalLateMinutes == totalLateMinutes)&&(identical(other.totalEarlyLeaveMinutes, totalEarlyLeaveMinutes) || other.totalEarlyLeaveMinutes == totalEarlyLeaveMinutes)&&(identical(other.totalDeductionsAmount, totalDeductionsAmount) || other.totalDeductionsAmount == totalDeductionsAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,totalDays,presentDays,absentDays,lateDays,leaveDays,totalActualHours,totalOvertimeHours,totalLateMinutes,totalEarlyLeaveMinutes,totalDeductionsAmount);
}

@override
String toString() {
    return 'AttendanceReportSummary(totalDays: $totalDays, presentDays: $presentDays, absentDays: $absentDays, lateDays: $lateDays, leaveDays: $leaveDays, totalActualHours: $totalActualHours, totalOvertimeHours: $totalOvertimeHours, totalLateMinutes: $totalLateMinutes, totalEarlyLeaveMinutes: $totalEarlyLeaveMinutes, totalDeductionsAmount: $totalDeductionsAmount)';
}


}

/// @nodoc
abstract mixin class _$AttendanceReportSummaryCopyWith<$Res> implements $AttendanceReportSummaryCopyWith<$Res> {
  factory _$AttendanceReportSummaryCopyWith(_AttendanceReportSummary value, $Res Function(_AttendanceReportSummary) _then) = __$AttendanceReportSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalDays, int presentDays, int absentDays, int lateDays, int leaveDays, double totalActualHours, double totalOvertimeHours, int totalLateMinutes, int totalEarlyLeaveMinutes, double totalDeductionsAmount
});




}
/// @nodoc
class __$AttendanceReportSummaryCopyWithImpl<$Res>
    implements _$AttendanceReportSummaryCopyWith<$Res> {
  __$AttendanceReportSummaryCopyWithImpl(this._self, this._then);

  final _AttendanceReportSummary _self;
  final $Res Function(_AttendanceReportSummary) _then;

/// Create a copy of AttendanceReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDays = null,Object? presentDays = null,Object? absentDays = null,Object? lateDays = null,Object? leaveDays = null,Object? totalActualHours = null,Object? totalOvertimeHours = null,Object? totalLateMinutes = null,Object? totalEarlyLeaveMinutes = null,Object? totalDeductionsAmount = null,}) {
  return _then(_AttendanceReportSummary(
totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,presentDays: null == presentDays ? _self.presentDays : presentDays // ignore: cast_nullable_to_non_nullable
as int,absentDays: null == absentDays ? _self.absentDays : absentDays // ignore: cast_nullable_to_non_nullable
as int,lateDays: null == lateDays ? _self.lateDays : lateDays // ignore: cast_nullable_to_non_nullable
as int,leaveDays: null == leaveDays ? _self.leaveDays : leaveDays // ignore: cast_nullable_to_non_nullable
as int,totalActualHours: null == totalActualHours ? _self.totalActualHours : totalActualHours // ignore: cast_nullable_to_non_nullable
as double,totalOvertimeHours: null == totalOvertimeHours ? _self.totalOvertimeHours : totalOvertimeHours // ignore: cast_nullable_to_non_nullable
as double,totalLateMinutes: null == totalLateMinutes ? _self.totalLateMinutes : totalLateMinutes // ignore: cast_nullable_to_non_nullable
as int,totalEarlyLeaveMinutes: null == totalEarlyLeaveMinutes ? _self.totalEarlyLeaveMinutes : totalEarlyLeaveMinutes // ignore: cast_nullable_to_non_nullable
as int,totalDeductionsAmount: null == totalDeductionsAmount ? _self.totalDeductionsAmount : totalDeductionsAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$AttendanceReportEntry {

 String get userId; String get userName; String get date; String get shiftName; String? get checkInTime; String? get checkOutTime; double get actualHours; double get overtimeHours; int get lateMinutes; String get status;
/// Create a copy of AttendanceReportEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceReportEntryCopyWith<AttendanceReportEntry> get copyWith => _$AttendanceReportEntryCopyWithImpl<AttendanceReportEntry>(this as AttendanceReportEntry, _$identity);

  /// Serializes this AttendanceReportEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AttendanceReportEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceReportEntry&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.userName, _this.userName) || other.userName == _this.userName)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.shiftName, _this.shiftName) || other.shiftName == _this.shiftName)&&(identical(other.checkInTime, _this.checkInTime) || other.checkInTime == _this.checkInTime)&&(identical(other.checkOutTime, _this.checkOutTime) || other.checkOutTime == _this.checkOutTime)&&(identical(other.actualHours, _this.actualHours) || other.actualHours == _this.actualHours)&&(identical(other.overtimeHours, _this.overtimeHours) || other.overtimeHours == _this.overtimeHours)&&(identical(other.lateMinutes, _this.lateMinutes) || other.lateMinutes == _this.lateMinutes)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AttendanceReportEntry;
  return Object.hash(runtimeType,_this.userId,_this.userName,_this.date,_this.shiftName,_this.checkInTime,_this.checkOutTime,_this.actualHours,_this.overtimeHours,_this.lateMinutes,_this.status);
}

@override
String toString() {
  final _this = this as AttendanceReportEntry;
  return 'AttendanceReportEntry(userId: ${_this.userId}, userName: ${_this.userName}, date: ${_this.date}, shiftName: ${_this.shiftName}, checkInTime: ${_this.checkInTime}, checkOutTime: ${_this.checkOutTime}, actualHours: ${_this.actualHours}, overtimeHours: ${_this.overtimeHours}, lateMinutes: ${_this.lateMinutes}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $AttendanceReportEntryCopyWith<$Res>  {
  factory $AttendanceReportEntryCopyWith(AttendanceReportEntry value, $Res Function(AttendanceReportEntry) _then) = _$AttendanceReportEntryCopyWithImpl;
@useResult
$Res call({
 String userId, String userName, String date, String shiftName, String? checkInTime, String? checkOutTime, double actualHours, double overtimeHours, int lateMinutes, String status
});




}
/// @nodoc
class _$AttendanceReportEntryCopyWithImpl<$Res>
    implements $AttendanceReportEntryCopyWith<$Res> {
  _$AttendanceReportEntryCopyWithImpl(this._self, this._then);

  final AttendanceReportEntry _self;
  final $Res Function(AttendanceReportEntry) _then;

/// Create a copy of AttendanceReportEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? userName = null,Object? date = null,Object? shiftName = null,Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? actualHours = null,Object? overtimeHours = null,Object? lateMinutes = null,Object? status = null,}) {
  return _then(AttendanceReportEntry(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,shiftName: null == shiftName ? _self.shiftName : shiftName // ignore: cast_nullable_to_non_nullable
as String,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,actualHours: null == actualHours ? _self.actualHours : actualHours // ignore: cast_nullable_to_non_nullable
as double,overtimeHours: null == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as double,lateMinutes: null == lateMinutes ? _self.lateMinutes : lateMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceReportEntry].
extension AttendanceReportEntryPatterns on AttendanceReportEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceReportEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceReportEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceReportEntry value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceReportEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceReportEntry value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceReportEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String userName,  String date,  String shiftName,  String? checkInTime,  String? checkOutTime,  double actualHours,  double overtimeHours,  int lateMinutes,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceReportEntry() when $default != null:
return $default(_that.userId,_that.userName,_that.date,_that.shiftName,_that.checkInTime,_that.checkOutTime,_that.actualHours,_that.overtimeHours,_that.lateMinutes,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String userName,  String date,  String shiftName,  String? checkInTime,  String? checkOutTime,  double actualHours,  double overtimeHours,  int lateMinutes,  String status)  $default,) {final _that = this;
switch (_that) {
case _AttendanceReportEntry():
return $default(_that.userId,_that.userName,_that.date,_that.shiftName,_that.checkInTime,_that.checkOutTime,_that.actualHours,_that.overtimeHours,_that.lateMinutes,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String userName,  String date,  String shiftName,  String? checkInTime,  String? checkOutTime,  double actualHours,  double overtimeHours,  int lateMinutes,  String status)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceReportEntry() when $default != null:
return $default(_that.userId,_that.userName,_that.date,_that.shiftName,_that.checkInTime,_that.checkOutTime,_that.actualHours,_that.overtimeHours,_that.lateMinutes,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceReportEntry implements AttendanceReportEntry {
  const _AttendanceReportEntry({required this.userId, required this.userName, required this.date, required this.shiftName, this.checkInTime, this.checkOutTime, this.actualHours = 0.0, this.overtimeHours = 0.0, this.lateMinutes = 0, required this.status});
  factory _AttendanceReportEntry.fromJson(Map<String, dynamic> json) => _$AttendanceReportEntryFromJson(json);

@override final  String userId;
@override final  String userName;
@override final  String date;
@override final  String shiftName;
@override final  String? checkInTime;
@override final  String? checkOutTime;
@override@JsonKey() final  double actualHours;
@override@JsonKey() final  double overtimeHours;
@override@JsonKey() final  int lateMinutes;
@override final  String status;

/// Create a copy of AttendanceReportEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceReportEntryCopyWith<_AttendanceReportEntry> get copyWith => __$AttendanceReportEntryCopyWithImpl<_AttendanceReportEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceReportEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceReportEntry&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.date, date) || other.date == date)&&(identical(other.shiftName, shiftName) || other.shiftName == shiftName)&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.actualHours, actualHours) || other.actualHours == actualHours)&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.lateMinutes, lateMinutes) || other.lateMinutes == lateMinutes)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,userName,date,shiftName,checkInTime,checkOutTime,actualHours,overtimeHours,lateMinutes,status);
}

@override
String toString() {
    return 'AttendanceReportEntry(userId: $userId, userName: $userName, date: $date, shiftName: $shiftName, checkInTime: $checkInTime, checkOutTime: $checkOutTime, actualHours: $actualHours, overtimeHours: $overtimeHours, lateMinutes: $lateMinutes, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AttendanceReportEntryCopyWith<$Res> implements $AttendanceReportEntryCopyWith<$Res> {
  factory _$AttendanceReportEntryCopyWith(_AttendanceReportEntry value, $Res Function(_AttendanceReportEntry) _then) = __$AttendanceReportEntryCopyWithImpl;
@override @useResult
$Res call({
 String userId, String userName, String date, String shiftName, String? checkInTime, String? checkOutTime, double actualHours, double overtimeHours, int lateMinutes, String status
});




}
/// @nodoc
class __$AttendanceReportEntryCopyWithImpl<$Res>
    implements _$AttendanceReportEntryCopyWith<$Res> {
  __$AttendanceReportEntryCopyWithImpl(this._self, this._then);

  final _AttendanceReportEntry _self;
  final $Res Function(_AttendanceReportEntry) _then;

/// Create a copy of AttendanceReportEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? userName = null,Object? date = null,Object? shiftName = null,Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? actualHours = null,Object? overtimeHours = null,Object? lateMinutes = null,Object? status = null,}) {
  return _then(_AttendanceReportEntry(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,shiftName: null == shiftName ? _self.shiftName : shiftName // ignore: cast_nullable_to_non_nullable
as String,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,actualHours: null == actualHours ? _self.actualHours : actualHours // ignore: cast_nullable_to_non_nullable
as double,overtimeHours: null == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as double,lateMinutes: null == lateMinutes ? _self.lateMinutes : lateMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
