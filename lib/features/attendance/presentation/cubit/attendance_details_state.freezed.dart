// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceDetailsState {

 UIStatus get status; AttendanceRecord? get record; List<AuditLogEntry> get auditLog; String? get errorMessage;
/// Create a copy of AttendanceDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceDetailsStateCopyWith<AttendanceDetailsState> get copyWith => _$AttendanceDetailsStateCopyWithImpl<AttendanceDetailsState>(this as AttendanceDetailsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AttendanceDetailsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceDetailsState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.record, _this.record) || other.record == _this.record)&&const DeepCollectionEquality().equals(other.auditLog, _this.auditLog)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as AttendanceDetailsState;
  return Object.hash(runtimeType,_this.status,_this.record,const DeepCollectionEquality().hash(_this.auditLog),_this.errorMessage);
}

@override
String toString() {
  final _this = this as AttendanceDetailsState;
  return 'AttendanceDetailsState(status: ${_this.status}, record: ${_this.record}, auditLog: ${_this.auditLog}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $AttendanceDetailsStateCopyWith<$Res>  {
  factory $AttendanceDetailsStateCopyWith(AttendanceDetailsState value, $Res Function(AttendanceDetailsState) _then) = _$AttendanceDetailsStateCopyWithImpl;
@useResult
$Res call({
 UIStatus status, AttendanceRecord? record, List<AuditLogEntry> auditLog, String? errorMessage
});


$AttendanceRecordCopyWith<$Res>? get record;

}
/// @nodoc
class _$AttendanceDetailsStateCopyWithImpl<$Res>
    implements $AttendanceDetailsStateCopyWith<$Res> {
  _$AttendanceDetailsStateCopyWithImpl(this._self, this._then);

  final AttendanceDetailsState _self;
  final $Res Function(AttendanceDetailsState) _then;

/// Create a copy of AttendanceDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? record = freezed,Object? auditLog = null,Object? errorMessage = freezed,}) {
  return _then(AttendanceDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,record: freezed == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as AttendanceRecord?,auditLog: null == auditLog ? _self.auditLog : auditLog // ignore: cast_nullable_to_non_nullable
as List<AuditLogEntry>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AttendanceDetailsState
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


/// Adds pattern-matching-related methods to [AttendanceDetailsState].
extension AttendanceDetailsStatePatterns on AttendanceDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UIStatus status,  AttendanceRecord? record,  List<AuditLogEntry> auditLog,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceDetailsState() when $default != null:
return $default(_that.status,_that.record,_that.auditLog,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UIStatus status,  AttendanceRecord? record,  List<AuditLogEntry> auditLog,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AttendanceDetailsState():
return $default(_that.status,_that.record,_that.auditLog,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UIStatus status,  AttendanceRecord? record,  List<AuditLogEntry> auditLog,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceDetailsState() when $default != null:
return $default(_that.status,_that.record,_that.auditLog,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AttendanceDetailsState implements AttendanceDetailsState {
  const _AttendanceDetailsState({this.status = UIStatus.initial, this.record,  List<AuditLogEntry> auditLog = const [], this.errorMessage}): _auditLog = auditLog;
  

@override@JsonKey() final  UIStatus status;
@override final  AttendanceRecord? record;
 final  List<AuditLogEntry> _auditLog;
@override@JsonKey() List<AuditLogEntry> get auditLog {
  if (_auditLog is EqualUnmodifiableListView) return _auditLog;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_auditLog);
}

@override final  String? errorMessage;

/// Create a copy of AttendanceDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceDetailsStateCopyWith<_AttendanceDetailsState> get copyWith => __$AttendanceDetailsStateCopyWithImpl<_AttendanceDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.record, record) || other.record == record)&&const DeepCollectionEquality().equals(other.auditLog, _auditLog)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,record,const DeepCollectionEquality().hash(_auditLog),errorMessage);
}

@override
String toString() {
    return 'AttendanceDetailsState(status: $status, record: $record, auditLog: $auditLog, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AttendanceDetailsStateCopyWith<$Res> implements $AttendanceDetailsStateCopyWith<$Res> {
  factory _$AttendanceDetailsStateCopyWith(_AttendanceDetailsState value, $Res Function(_AttendanceDetailsState) _then) = __$AttendanceDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 UIStatus status, AttendanceRecord? record, List<AuditLogEntry> auditLog, String? errorMessage
});


@override $AttendanceRecordCopyWith<$Res>? get record;

}
/// @nodoc
class __$AttendanceDetailsStateCopyWithImpl<$Res>
    implements _$AttendanceDetailsStateCopyWith<$Res> {
  __$AttendanceDetailsStateCopyWithImpl(this._self, this._then);

  final _AttendanceDetailsState _self;
  final $Res Function(_AttendanceDetailsState) _then;

/// Create a copy of AttendanceDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? record = freezed,Object? auditLog = null,Object? errorMessage = freezed,}) {
  return _then(_AttendanceDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,record: freezed == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as AttendanceRecord?,auditLog: null == auditLog ? _self._auditLog : auditLog // ignore: cast_nullable_to_non_nullable
as List<AuditLogEntry>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AttendanceDetailsState
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
