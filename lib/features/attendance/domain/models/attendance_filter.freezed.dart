// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceFilter {

 DateTime? get fromDate; DateTime? get toDate; AttendanceStatus? get status; String? get userId; String? get departmentId; String? get siteId; String? get searchQuery;
/// Create a copy of AttendanceFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceFilterCopyWith<AttendanceFilter> get copyWith => _$AttendanceFilterCopyWithImpl<AttendanceFilter>(this as AttendanceFilter, _$identity);

  /// Serializes this AttendanceFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AttendanceFilter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceFilter&&(identical(other.fromDate, _this.fromDate) || other.fromDate == _this.fromDate)&&(identical(other.toDate, _this.toDate) || other.toDate == _this.toDate)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.departmentId, _this.departmentId) || other.departmentId == _this.departmentId)&&(identical(other.siteId, _this.siteId) || other.siteId == _this.siteId)&&(identical(other.searchQuery, _this.searchQuery) || other.searchQuery == _this.searchQuery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AttendanceFilter;
  return Object.hash(runtimeType,_this.fromDate,_this.toDate,_this.status,_this.userId,_this.departmentId,_this.siteId,_this.searchQuery);
}

@override
String toString() {
  final _this = this as AttendanceFilter;
  return 'AttendanceFilter(fromDate: ${_this.fromDate}, toDate: ${_this.toDate}, status: ${_this.status}, userId: ${_this.userId}, departmentId: ${_this.departmentId}, siteId: ${_this.siteId}, searchQuery: ${_this.searchQuery})';
}


}

/// @nodoc
abstract mixin class $AttendanceFilterCopyWith<$Res>  {
  factory $AttendanceFilterCopyWith(AttendanceFilter value, $Res Function(AttendanceFilter) _then) = _$AttendanceFilterCopyWithImpl;
@useResult
$Res call({
 DateTime? fromDate, DateTime? toDate, AttendanceStatus? status, String? userId, String? departmentId, String? siteId, String? searchQuery
});




}
/// @nodoc
class _$AttendanceFilterCopyWithImpl<$Res>
    implements $AttendanceFilterCopyWith<$Res> {
  _$AttendanceFilterCopyWithImpl(this._self, this._then);

  final AttendanceFilter _self;
  final $Res Function(AttendanceFilter) _then;

/// Create a copy of AttendanceFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromDate = freezed,Object? toDate = freezed,Object? status = freezed,Object? userId = freezed,Object? departmentId = freezed,Object? siteId = freezed,Object? searchQuery = freezed,}) {
  return _then(AttendanceFilter(
fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,siteId: freezed == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceFilter].
extension AttendanceFilterPatterns on AttendanceFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceFilter value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceFilter value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? fromDate,  DateTime? toDate,  AttendanceStatus? status,  String? userId,  String? departmentId,  String? siteId,  String? searchQuery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceFilter() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.status,_that.userId,_that.departmentId,_that.siteId,_that.searchQuery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? fromDate,  DateTime? toDate,  AttendanceStatus? status,  String? userId,  String? departmentId,  String? siteId,  String? searchQuery)  $default,) {final _that = this;
switch (_that) {
case _AttendanceFilter():
return $default(_that.fromDate,_that.toDate,_that.status,_that.userId,_that.departmentId,_that.siteId,_that.searchQuery);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? fromDate,  DateTime? toDate,  AttendanceStatus? status,  String? userId,  String? departmentId,  String? siteId,  String? searchQuery)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceFilter() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.status,_that.userId,_that.departmentId,_that.siteId,_that.searchQuery);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceFilter implements AttendanceFilter {
  const _AttendanceFilter({this.fromDate, this.toDate, this.status, this.userId, this.departmentId, this.siteId, this.searchQuery});
  factory _AttendanceFilter.fromJson(Map<String, dynamic> json) => _$AttendanceFilterFromJson(json);

@override final  DateTime? fromDate;
@override final  DateTime? toDate;
@override final  AttendanceStatus? status;
@override final  String? userId;
@override final  String? departmentId;
@override final  String? siteId;
@override final  String? searchQuery;

/// Create a copy of AttendanceFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceFilterCopyWith<_AttendanceFilter> get copyWith => __$AttendanceFilterCopyWithImpl<_AttendanceFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceFilterToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceFilter&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fromDate,toDate,status,userId,departmentId,siteId,searchQuery);
}

@override
String toString() {
    return 'AttendanceFilter(fromDate: $fromDate, toDate: $toDate, status: $status, userId: $userId, departmentId: $departmentId, siteId: $siteId, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$AttendanceFilterCopyWith<$Res> implements $AttendanceFilterCopyWith<$Res> {
  factory _$AttendanceFilterCopyWith(_AttendanceFilter value, $Res Function(_AttendanceFilter) _then) = __$AttendanceFilterCopyWithImpl;
@override @useResult
$Res call({
 DateTime? fromDate, DateTime? toDate, AttendanceStatus? status, String? userId, String? departmentId, String? siteId, String? searchQuery
});




}
/// @nodoc
class __$AttendanceFilterCopyWithImpl<$Res>
    implements _$AttendanceFilterCopyWith<$Res> {
  __$AttendanceFilterCopyWithImpl(this._self, this._then);

  final _AttendanceFilter _self;
  final $Res Function(_AttendanceFilter) _then;

/// Create a copy of AttendanceFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromDate = freezed,Object? toDate = freezed,Object? status = freezed,Object? userId = freezed,Object? departmentId = freezed,Object? siteId = freezed,Object? searchQuery = freezed,}) {
  return _then(_AttendanceFilter(
fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as String?,siteId: freezed == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
