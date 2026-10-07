// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodayStatus {

@JsonKey(name: 'has_checked_in') bool get hasCheckedIn;@JsonKey(name: 'has_checked_out') bool get hasCheckedOut;@JsonKey(name: 'status') AttendanceStatus get status;@JsonKey(name: 'check_in_time') String? get checkInTime;@JsonKey(name: 'check_out_time') String? get checkOutTime;@JsonKey(name: 'record') AttendanceRecord? get record;
/// Create a copy of TodayStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayStatusCopyWith<TodayStatus> get copyWith => _$TodayStatusCopyWithImpl<TodayStatus>(this as TodayStatus, _$identity);

  /// Serializes this TodayStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TodayStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayStatus&&(identical(other.hasCheckedIn, _this.hasCheckedIn) || other.hasCheckedIn == _this.hasCheckedIn)&&(identical(other.hasCheckedOut, _this.hasCheckedOut) || other.hasCheckedOut == _this.hasCheckedOut)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.checkInTime, _this.checkInTime) || other.checkInTime == _this.checkInTime)&&(identical(other.checkOutTime, _this.checkOutTime) || other.checkOutTime == _this.checkOutTime)&&(identical(other.record, _this.record) || other.record == _this.record));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TodayStatus;
  return Object.hash(runtimeType,_this.hasCheckedIn,_this.hasCheckedOut,_this.status,_this.checkInTime,_this.checkOutTime,_this.record);
}

@override
String toString() {
  final _this = this as TodayStatus;
  return 'TodayStatus(hasCheckedIn: ${_this.hasCheckedIn}, hasCheckedOut: ${_this.hasCheckedOut}, status: ${_this.status}, checkInTime: ${_this.checkInTime}, checkOutTime: ${_this.checkOutTime}, record: ${_this.record})';
}


}

/// @nodoc
abstract mixin class $TodayStatusCopyWith<$Res>  {
  factory $TodayStatusCopyWith(TodayStatus value, $Res Function(TodayStatus) _then) = _$TodayStatusCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'has_checked_in') bool hasCheckedIn,@JsonKey(name: 'has_checked_out') bool hasCheckedOut,@JsonKey(name: 'status') AttendanceStatus status,@JsonKey(name: 'check_in_time') String? checkInTime,@JsonKey(name: 'check_out_time') String? checkOutTime,@JsonKey(name: 'record') AttendanceRecord? record
});


$AttendanceRecordCopyWith<$Res>? get record;

}
/// @nodoc
class _$TodayStatusCopyWithImpl<$Res>
    implements $TodayStatusCopyWith<$Res> {
  _$TodayStatusCopyWithImpl(this._self, this._then);

  final TodayStatus _self;
  final $Res Function(TodayStatus) _then;

/// Create a copy of TodayStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasCheckedIn = null,Object? hasCheckedOut = null,Object? status = null,Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? record = freezed,}) {
  return _then(TodayStatus(
hasCheckedIn: null == hasCheckedIn ? _self.hasCheckedIn : hasCheckedIn // ignore: cast_nullable_to_non_nullable
as bool,hasCheckedOut: null == hasCheckedOut ? _self.hasCheckedOut : hasCheckedOut // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,record: freezed == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as AttendanceRecord?,
  ));
}
/// Create a copy of TodayStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceRecordCopyWith<$Res>? get record {
    if (_self.record == null) {
    return null;
  }

  return $AttendanceRecordCopyWith<$Res>(_self.record!, (value) {
    return _then(_self.copyWith(record: value));
  });
}
}


/// Adds pattern-matching-related methods to [TodayStatus].
extension TodayStatusPatterns on TodayStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayStatus value)  $default,){
final _that = this;
switch (_that) {
case _TodayStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayStatus value)?  $default,){
final _that = this;
switch (_that) {
case _TodayStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'has_checked_in')  bool hasCheckedIn, @JsonKey(name: 'has_checked_out')  bool hasCheckedOut, @JsonKey(name: 'status')  AttendanceStatus status, @JsonKey(name: 'check_in_time')  String? checkInTime, @JsonKey(name: 'check_out_time')  String? checkOutTime, @JsonKey(name: 'record')  AttendanceRecord? record)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayStatus() when $default != null:
return $default(_that.hasCheckedIn,_that.hasCheckedOut,_that.status,_that.checkInTime,_that.checkOutTime,_that.record);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'has_checked_in')  bool hasCheckedIn, @JsonKey(name: 'has_checked_out')  bool hasCheckedOut, @JsonKey(name: 'status')  AttendanceStatus status, @JsonKey(name: 'check_in_time')  String? checkInTime, @JsonKey(name: 'check_out_time')  String? checkOutTime, @JsonKey(name: 'record')  AttendanceRecord? record)  $default,) {final _that = this;
switch (_that) {
case _TodayStatus():
return $default(_that.hasCheckedIn,_that.hasCheckedOut,_that.status,_that.checkInTime,_that.checkOutTime,_that.record);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'has_checked_in')  bool hasCheckedIn, @JsonKey(name: 'has_checked_out')  bool hasCheckedOut, @JsonKey(name: 'status')  AttendanceStatus status, @JsonKey(name: 'check_in_time')  String? checkInTime, @JsonKey(name: 'check_out_time')  String? checkOutTime, @JsonKey(name: 'record')  AttendanceRecord? record)?  $default,) {final _that = this;
switch (_that) {
case _TodayStatus() when $default != null:
return $default(_that.hasCheckedIn,_that.hasCheckedOut,_that.status,_that.checkInTime,_that.checkOutTime,_that.record);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodayStatus implements TodayStatus {
  const _TodayStatus({@JsonKey(name: 'has_checked_in') this.hasCheckedIn = false, @JsonKey(name: 'has_checked_out') this.hasCheckedOut = false, @JsonKey(name: 'status') this.status = AttendanceStatus.absent, @JsonKey(name: 'check_in_time') this.checkInTime, @JsonKey(name: 'check_out_time') this.checkOutTime, @JsonKey(name: 'record') this.record});
  factory _TodayStatus.fromJson(Map<String, dynamic> json) => _$TodayStatusFromJson(json);

@override@JsonKey(name: 'has_checked_in') final  bool hasCheckedIn;
@override@JsonKey(name: 'has_checked_out') final  bool hasCheckedOut;
@override@JsonKey(name: 'status') final  AttendanceStatus status;
@override@JsonKey(name: 'check_in_time') final  String? checkInTime;
@override@JsonKey(name: 'check_out_time') final  String? checkOutTime;
@override@JsonKey(name: 'record') final  AttendanceRecord? record;

/// Create a copy of TodayStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayStatusCopyWith<_TodayStatus> get copyWith => __$TodayStatusCopyWithImpl<_TodayStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodayStatusToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayStatus&&(identical(other.hasCheckedIn, hasCheckedIn) || other.hasCheckedIn == hasCheckedIn)&&(identical(other.hasCheckedOut, hasCheckedOut) || other.hasCheckedOut == hasCheckedOut)&&(identical(other.status, status) || other.status == status)&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.record, record) || other.record == record));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,hasCheckedIn,hasCheckedOut,status,checkInTime,checkOutTime,record);
}

@override
String toString() {
    return 'TodayStatus(hasCheckedIn: $hasCheckedIn, hasCheckedOut: $hasCheckedOut, status: $status, checkInTime: $checkInTime, checkOutTime: $checkOutTime, record: $record)';
}


}

/// @nodoc
abstract mixin class _$TodayStatusCopyWith<$Res> implements $TodayStatusCopyWith<$Res> {
  factory _$TodayStatusCopyWith(_TodayStatus value, $Res Function(_TodayStatus) _then) = __$TodayStatusCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'has_checked_in') bool hasCheckedIn,@JsonKey(name: 'has_checked_out') bool hasCheckedOut,@JsonKey(name: 'status') AttendanceStatus status,@JsonKey(name: 'check_in_time') String? checkInTime,@JsonKey(name: 'check_out_time') String? checkOutTime,@JsonKey(name: 'record') AttendanceRecord? record
});


@override $AttendanceRecordCopyWith<$Res>? get record;

}
/// @nodoc
class __$TodayStatusCopyWithImpl<$Res>
    implements _$TodayStatusCopyWith<$Res> {
  __$TodayStatusCopyWithImpl(this._self, this._then);

  final _TodayStatus _self;
  final $Res Function(_TodayStatus) _then;

/// Create a copy of TodayStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasCheckedIn = null,Object? hasCheckedOut = null,Object? status = null,Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? record = freezed,}) {
  return _then(_TodayStatus(
hasCheckedIn: null == hasCheckedIn ? _self.hasCheckedIn : hasCheckedIn // ignore: cast_nullable_to_non_nullable
as bool,hasCheckedOut: null == hasCheckedOut ? _self.hasCheckedOut : hasCheckedOut // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus,checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,record: freezed == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as AttendanceRecord?,
  ));
}

/// Create a copy of TodayStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceRecordCopyWith<$Res>? get record {
    if (_self.record == null) {
    return null;
  }

  return $AttendanceRecordCopyWith<$Res>(_self.record!, (value) {
    return _then(_self.copyWith(record: value));
  });
}
}

// dart format on
