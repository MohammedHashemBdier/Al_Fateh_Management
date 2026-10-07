// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditLogEntry {

 String get logId; String get timestamp; String get actorId; String get actorRole; String get action; String? get recordId; String? get oldValues; String? get newValues; String? get ipAddress; String? get deviceFp; String? get notes;
/// Create a copy of AuditLogEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditLogEntryCopyWith<AuditLogEntry> get copyWith => _$AuditLogEntryCopyWithImpl<AuditLogEntry>(this as AuditLogEntry, _$identity);

  /// Serializes this AuditLogEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuditLogEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditLogEntry&&(identical(other.logId, _this.logId) || other.logId == _this.logId)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp)&&(identical(other.actorId, _this.actorId) || other.actorId == _this.actorId)&&(identical(other.actorRole, _this.actorRole) || other.actorRole == _this.actorRole)&&(identical(other.action, _this.action) || other.action == _this.action)&&(identical(other.recordId, _this.recordId) || other.recordId == _this.recordId)&&(identical(other.oldValues, _this.oldValues) || other.oldValues == _this.oldValues)&&(identical(other.newValues, _this.newValues) || other.newValues == _this.newValues)&&(identical(other.ipAddress, _this.ipAddress) || other.ipAddress == _this.ipAddress)&&(identical(other.deviceFp, _this.deviceFp) || other.deviceFp == _this.deviceFp)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuditLogEntry;
  return Object.hash(runtimeType,_this.logId,_this.timestamp,_this.actorId,_this.actorRole,_this.action,_this.recordId,_this.oldValues,_this.newValues,_this.ipAddress,_this.deviceFp,_this.notes);
}

@override
String toString() {
  final _this = this as AuditLogEntry;
  return 'AuditLogEntry(logId: ${_this.logId}, timestamp: ${_this.timestamp}, actorId: ${_this.actorId}, actorRole: ${_this.actorRole}, action: ${_this.action}, recordId: ${_this.recordId}, oldValues: ${_this.oldValues}, newValues: ${_this.newValues}, ipAddress: ${_this.ipAddress}, deviceFp: ${_this.deviceFp}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $AuditLogEntryCopyWith<$Res>  {
  factory $AuditLogEntryCopyWith(AuditLogEntry value, $Res Function(AuditLogEntry) _then) = _$AuditLogEntryCopyWithImpl;
@useResult
$Res call({
 String logId, String timestamp, String actorId, String actorRole, String action, String? recordId, String? oldValues, String? newValues, String? ipAddress, String? deviceFp, String? notes
});




}
/// @nodoc
class _$AuditLogEntryCopyWithImpl<$Res>
    implements $AuditLogEntryCopyWith<$Res> {
  _$AuditLogEntryCopyWithImpl(this._self, this._then);

  final AuditLogEntry _self;
  final $Res Function(AuditLogEntry) _then;

/// Create a copy of AuditLogEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logId = null,Object? timestamp = null,Object? actorId = null,Object? actorRole = null,Object? action = null,Object? recordId = freezed,Object? oldValues = freezed,Object? newValues = freezed,Object? ipAddress = freezed,Object? deviceFp = freezed,Object? notes = freezed,}) {
  return _then(AuditLogEntry(
logId: null == logId ? _self.logId : logId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,recordId: freezed == recordId ? _self.recordId : recordId // ignore: cast_nullable_to_non_nullable
as String?,oldValues: freezed == oldValues ? _self.oldValues : oldValues // ignore: cast_nullable_to_non_nullable
as String?,newValues: freezed == newValues ? _self.newValues : newValues // ignore: cast_nullable_to_non_nullable
as String?,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,deviceFp: freezed == deviceFp ? _self.deviceFp : deviceFp // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditLogEntry].
extension AuditLogEntryPatterns on AuditLogEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditLogEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditLogEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditLogEntry value)  $default,){
final _that = this;
switch (_that) {
case _AuditLogEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditLogEntry value)?  $default,){
final _that = this;
switch (_that) {
case _AuditLogEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String logId,  String timestamp,  String actorId,  String actorRole,  String action,  String? recordId,  String? oldValues,  String? newValues,  String? ipAddress,  String? deviceFp,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditLogEntry() when $default != null:
return $default(_that.logId,_that.timestamp,_that.actorId,_that.actorRole,_that.action,_that.recordId,_that.oldValues,_that.newValues,_that.ipAddress,_that.deviceFp,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String logId,  String timestamp,  String actorId,  String actorRole,  String action,  String? recordId,  String? oldValues,  String? newValues,  String? ipAddress,  String? deviceFp,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _AuditLogEntry():
return $default(_that.logId,_that.timestamp,_that.actorId,_that.actorRole,_that.action,_that.recordId,_that.oldValues,_that.newValues,_that.ipAddress,_that.deviceFp,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String logId,  String timestamp,  String actorId,  String actorRole,  String action,  String? recordId,  String? oldValues,  String? newValues,  String? ipAddress,  String? deviceFp,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _AuditLogEntry() when $default != null:
return $default(_that.logId,_that.timestamp,_that.actorId,_that.actorRole,_that.action,_that.recordId,_that.oldValues,_that.newValues,_that.ipAddress,_that.deviceFp,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditLogEntry implements AuditLogEntry {
  const _AuditLogEntry({required this.logId, required this.timestamp, required this.actorId, required this.actorRole, required this.action, this.recordId, this.oldValues, this.newValues, this.ipAddress, this.deviceFp, this.notes});
  factory _AuditLogEntry.fromJson(Map<String, dynamic> json) => _$AuditLogEntryFromJson(json);

@override final  String logId;
@override final  String timestamp;
@override final  String actorId;
@override final  String actorRole;
@override final  String action;
@override final  String? recordId;
@override final  String? oldValues;
@override final  String? newValues;
@override final  String? ipAddress;
@override final  String? deviceFp;
@override final  String? notes;

/// Create a copy of AuditLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditLogEntryCopyWith<_AuditLogEntry> get copyWith => __$AuditLogEntryCopyWithImpl<_AuditLogEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditLogEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditLogEntry&&(identical(other.logId, logId) || other.logId == logId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.action, action) || other.action == action)&&(identical(other.recordId, recordId) || other.recordId == recordId)&&(identical(other.oldValues, oldValues) || other.oldValues == oldValues)&&(identical(other.newValues, newValues) || other.newValues == newValues)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.deviceFp, deviceFp) || other.deviceFp == deviceFp)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,logId,timestamp,actorId,actorRole,action,recordId,oldValues,newValues,ipAddress,deviceFp,notes);
}

@override
String toString() {
    return 'AuditLogEntry(logId: $logId, timestamp: $timestamp, actorId: $actorId, actorRole: $actorRole, action: $action, recordId: $recordId, oldValues: $oldValues, newValues: $newValues, ipAddress: $ipAddress, deviceFp: $deviceFp, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$AuditLogEntryCopyWith<$Res> implements $AuditLogEntryCopyWith<$Res> {
  factory _$AuditLogEntryCopyWith(_AuditLogEntry value, $Res Function(_AuditLogEntry) _then) = __$AuditLogEntryCopyWithImpl;
@override @useResult
$Res call({
 String logId, String timestamp, String actorId, String actorRole, String action, String? recordId, String? oldValues, String? newValues, String? ipAddress, String? deviceFp, String? notes
});




}
/// @nodoc
class __$AuditLogEntryCopyWithImpl<$Res>
    implements _$AuditLogEntryCopyWith<$Res> {
  __$AuditLogEntryCopyWithImpl(this._self, this._then);

  final _AuditLogEntry _self;
  final $Res Function(_AuditLogEntry) _then;

/// Create a copy of AuditLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logId = null,Object? timestamp = null,Object? actorId = null,Object? actorRole = null,Object? action = null,Object? recordId = freezed,Object? oldValues = freezed,Object? newValues = freezed,Object? ipAddress = freezed,Object? deviceFp = freezed,Object? notes = freezed,}) {
  return _then(_AuditLogEntry(
logId: null == logId ? _self.logId : logId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,recordId: freezed == recordId ? _self.recordId : recordId // ignore: cast_nullable_to_non_nullable
as String?,oldValues: freezed == oldValues ? _self.oldValues : oldValues // ignore: cast_nullable_to_non_nullable
as String?,newValues: freezed == newValues ? _self.newValues : newValues // ignore: cast_nullable_to_non_nullable
as String?,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,deviceFp: freezed == deviceFp ? _self.deviceFp : deviceFp // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
