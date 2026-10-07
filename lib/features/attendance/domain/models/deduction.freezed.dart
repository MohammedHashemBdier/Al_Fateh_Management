// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deduction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Deduction {

@JsonKey(name: 'deduction_id') String get deductionId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'attendance_id') String? get attendanceId;@JsonKey(name: 'deduction_date') String get deductionDate;@JsonKey(name: 'type') DeductionType get type;@JsonKey(name: 'amount_or_hours') double get amountOrHours;@JsonKey(name: 'reason') String get reason;@JsonKey(name: 'status') String get status;@JsonKey(name: 'created_by') String? get createdBy;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of Deduction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeductionCopyWith<Deduction> get copyWith => _$DeductionCopyWithImpl<Deduction>(this as Deduction, _$identity);

  /// Serializes this Deduction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Deduction;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Deduction&&(identical(other.deductionId, _this.deductionId) || other.deductionId == _this.deductionId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.attendanceId, _this.attendanceId) || other.attendanceId == _this.attendanceId)&&(identical(other.deductionDate, _this.deductionDate) || other.deductionDate == _this.deductionDate)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.amountOrHours, _this.amountOrHours) || other.amountOrHours == _this.amountOrHours)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdBy, _this.createdBy) || other.createdBy == _this.createdBy)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Deduction;
  return Object.hash(runtimeType,_this.deductionId,_this.userId,_this.attendanceId,_this.deductionDate,_this.type,_this.amountOrHours,_this.reason,_this.status,_this.createdBy,_this.createdAt);
}

@override
String toString() {
  final _this = this as Deduction;
  return 'Deduction(deductionId: ${_this.deductionId}, userId: ${_this.userId}, attendanceId: ${_this.attendanceId}, deductionDate: ${_this.deductionDate}, type: ${_this.type}, amountOrHours: ${_this.amountOrHours}, reason: ${_this.reason}, status: ${_this.status}, createdBy: ${_this.createdBy}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $DeductionCopyWith<$Res>  {
  factory $DeductionCopyWith(Deduction value, $Res Function(Deduction) _then) = _$DeductionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'deduction_id') String deductionId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'attendance_id') String? attendanceId,@JsonKey(name: 'deduction_date') String deductionDate,@JsonKey(name: 'type') DeductionType type,@JsonKey(name: 'amount_or_hours') double amountOrHours,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'status') String status,@JsonKey(name: 'created_by') String? createdBy,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$DeductionCopyWithImpl<$Res>
    implements $DeductionCopyWith<$Res> {
  _$DeductionCopyWithImpl(this._self, this._then);

  final Deduction _self;
  final $Res Function(Deduction) _then;

/// Create a copy of Deduction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deductionId = null,Object? userId = null,Object? attendanceId = freezed,Object? deductionDate = null,Object? type = null,Object? amountOrHours = null,Object? reason = null,Object? status = null,Object? createdBy = freezed,Object? createdAt = freezed,}) {
  return _then(Deduction(
deductionId: null == deductionId ? _self.deductionId : deductionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,deductionDate: null == deductionDate ? _self.deductionDate : deductionDate // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeductionType,amountOrHours: null == amountOrHours ? _self.amountOrHours : amountOrHours // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Deduction].
extension DeductionPatterns on Deduction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Deduction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Deduction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Deduction value)  $default,){
final _that = this;
switch (_that) {
case _Deduction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Deduction value)?  $default,){
final _that = this;
switch (_that) {
case _Deduction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'deduction_id')  String deductionId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'attendance_id')  String? attendanceId, @JsonKey(name: 'deduction_date')  String deductionDate, @JsonKey(name: 'type')  DeductionType type, @JsonKey(name: 'amount_or_hours')  double amountOrHours, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  String status, @JsonKey(name: 'created_by')  String? createdBy, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Deduction() when $default != null:
return $default(_that.deductionId,_that.userId,_that.attendanceId,_that.deductionDate,_that.type,_that.amountOrHours,_that.reason,_that.status,_that.createdBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'deduction_id')  String deductionId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'attendance_id')  String? attendanceId, @JsonKey(name: 'deduction_date')  String deductionDate, @JsonKey(name: 'type')  DeductionType type, @JsonKey(name: 'amount_or_hours')  double amountOrHours, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  String status, @JsonKey(name: 'created_by')  String? createdBy, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Deduction():
return $default(_that.deductionId,_that.userId,_that.attendanceId,_that.deductionDate,_that.type,_that.amountOrHours,_that.reason,_that.status,_that.createdBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'deduction_id')  String deductionId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'attendance_id')  String? attendanceId, @JsonKey(name: 'deduction_date')  String deductionDate, @JsonKey(name: 'type')  DeductionType type, @JsonKey(name: 'amount_or_hours')  double amountOrHours, @JsonKey(name: 'reason')  String reason, @JsonKey(name: 'status')  String status, @JsonKey(name: 'created_by')  String? createdBy, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Deduction() when $default != null:
return $default(_that.deductionId,_that.userId,_that.attendanceId,_that.deductionDate,_that.type,_that.amountOrHours,_that.reason,_that.status,_that.createdBy,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Deduction implements Deduction {
  const _Deduction({@JsonKey(name: 'deduction_id') required this.deductionId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'attendance_id') this.attendanceId, @JsonKey(name: 'deduction_date') required this.deductionDate, @JsonKey(name: 'type') this.type = DeductionType.manual, @JsonKey(name: 'amount_or_hours') this.amountOrHours = 0.0, @JsonKey(name: 'reason') this.reason = '', @JsonKey(name: 'status') this.status = 'APPLIED', @JsonKey(name: 'created_by') this.createdBy, @JsonKey(name: 'created_at') this.createdAt});
  factory _Deduction.fromJson(Map<String, dynamic> json) => _$DeductionFromJson(json);

@override@JsonKey(name: 'deduction_id') final  String deductionId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'attendance_id') final  String? attendanceId;
@override@JsonKey(name: 'deduction_date') final  String deductionDate;
@override@JsonKey(name: 'type') final  DeductionType type;
@override@JsonKey(name: 'amount_or_hours') final  double amountOrHours;
@override@JsonKey(name: 'reason') final  String reason;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'created_by') final  String? createdBy;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of Deduction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeductionCopyWith<_Deduction> get copyWith => __$DeductionCopyWithImpl<_Deduction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeductionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deduction&&(identical(other.deductionId, deductionId) || other.deductionId == deductionId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.deductionDate, deductionDate) || other.deductionDate == deductionDate)&&(identical(other.type, type) || other.type == type)&&(identical(other.amountOrHours, amountOrHours) || other.amountOrHours == amountOrHours)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,deductionId,userId,attendanceId,deductionDate,type,amountOrHours,reason,status,createdBy,createdAt);
}

@override
String toString() {
    return 'Deduction(deductionId: $deductionId, userId: $userId, attendanceId: $attendanceId, deductionDate: $deductionDate, type: $type, amountOrHours: $amountOrHours, reason: $reason, status: $status, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DeductionCopyWith<$Res> implements $DeductionCopyWith<$Res> {
  factory _$DeductionCopyWith(_Deduction value, $Res Function(_Deduction) _then) = __$DeductionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'deduction_id') String deductionId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'attendance_id') String? attendanceId,@JsonKey(name: 'deduction_date') String deductionDate,@JsonKey(name: 'type') DeductionType type,@JsonKey(name: 'amount_or_hours') double amountOrHours,@JsonKey(name: 'reason') String reason,@JsonKey(name: 'status') String status,@JsonKey(name: 'created_by') String? createdBy,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$DeductionCopyWithImpl<$Res>
    implements _$DeductionCopyWith<$Res> {
  __$DeductionCopyWithImpl(this._self, this._then);

  final _Deduction _self;
  final $Res Function(_Deduction) _then;

/// Create a copy of Deduction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deductionId = null,Object? userId = null,Object? attendanceId = freezed,Object? deductionDate = null,Object? type = null,Object? amountOrHours = null,Object? reason = null,Object? status = null,Object? createdBy = freezed,Object? createdAt = freezed,}) {
  return _then(_Deduction(
deductionId: null == deductionId ? _self.deductionId : deductionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: freezed == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String?,deductionDate: null == deductionDate ? _self.deductionDate : deductionDate // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeductionType,amountOrHours: null == amountOrHours ? _self.amountOrHours : amountOrHours // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
