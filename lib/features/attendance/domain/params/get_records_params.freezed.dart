// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_records_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetRecordsParams {

@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'month') String? get month;@JsonKey(name: 'date') String? get date;@JsonKey(name: 'limit') int get limit;
/// Create a copy of GetRecordsParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetRecordsParamsCopyWith<GetRecordsParams> get copyWith => _$GetRecordsParamsCopyWithImpl<GetRecordsParams>(this as GetRecordsParams, _$identity);

  /// Serializes this GetRecordsParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GetRecordsParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetRecordsParams&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.month, _this.month) || other.month == _this.month)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.limit, _this.limit) || other.limit == _this.limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GetRecordsParams;
  return Object.hash(runtimeType,_this.userId,_this.month,_this.date,_this.limit);
}

@override
String toString() {
  final _this = this as GetRecordsParams;
  return 'GetRecordsParams(userId: ${_this.userId}, month: ${_this.month}, date: ${_this.date}, limit: ${_this.limit})';
}


}

/// @nodoc
abstract mixin class $GetRecordsParamsCopyWith<$Res>  {
  factory $GetRecordsParamsCopyWith(GetRecordsParams value, $Res Function(GetRecordsParams) _then) = _$GetRecordsParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'month') String? month,@JsonKey(name: 'date') String? date,@JsonKey(name: 'limit') int limit
});




}
/// @nodoc
class _$GetRecordsParamsCopyWithImpl<$Res>
    implements $GetRecordsParamsCopyWith<$Res> {
  _$GetRecordsParamsCopyWithImpl(this._self, this._then);

  final GetRecordsParams _self;
  final $Res Function(GetRecordsParams) _then;

/// Create a copy of GetRecordsParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? month = freezed,Object? date = freezed,Object? limit = null,}) {
  return _then(GetRecordsParams(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GetRecordsParams].
extension GetRecordsParamsPatterns on GetRecordsParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetRecordsParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetRecordsParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetRecordsParams value)  $default,){
final _that = this;
switch (_that) {
case _GetRecordsParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetRecordsParams value)?  $default,){
final _that = this;
switch (_that) {
case _GetRecordsParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'month')  String? month, @JsonKey(name: 'date')  String? date, @JsonKey(name: 'limit')  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetRecordsParams() when $default != null:
return $default(_that.userId,_that.month,_that.date,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'month')  String? month, @JsonKey(name: 'date')  String? date, @JsonKey(name: 'limit')  int limit)  $default,) {final _that = this;
switch (_that) {
case _GetRecordsParams():
return $default(_that.userId,_that.month,_that.date,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String? userId, @JsonKey(name: 'month')  String? month, @JsonKey(name: 'date')  String? date, @JsonKey(name: 'limit')  int limit)?  $default,) {final _that = this;
switch (_that) {
case _GetRecordsParams() when $default != null:
return $default(_that.userId,_that.month,_that.date,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetRecordsParams implements GetRecordsParams {
  const _GetRecordsParams({@JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'month') this.month, @JsonKey(name: 'date') this.date, @JsonKey(name: 'limit') this.limit = 50});
  factory _GetRecordsParams.fromJson(Map<String, dynamic> json) => _$GetRecordsParamsFromJson(json);

@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'month') final  String? month;
@override@JsonKey(name: 'date') final  String? date;
@override@JsonKey(name: 'limit') final  int limit;

/// Create a copy of GetRecordsParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetRecordsParamsCopyWith<_GetRecordsParams> get copyWith => __$GetRecordsParamsCopyWithImpl<_GetRecordsParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetRecordsParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetRecordsParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.month, month) || other.month == month)&&(identical(other.date, date) || other.date == date)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,month,date,limit);
}

@override
String toString() {
    return 'GetRecordsParams(userId: $userId, month: $month, date: $date, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$GetRecordsParamsCopyWith<$Res> implements $GetRecordsParamsCopyWith<$Res> {
  factory _$GetRecordsParamsCopyWith(_GetRecordsParams value, $Res Function(_GetRecordsParams) _then) = __$GetRecordsParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'month') String? month,@JsonKey(name: 'date') String? date,@JsonKey(name: 'limit') int limit
});




}
/// @nodoc
class __$GetRecordsParamsCopyWithImpl<$Res>
    implements _$GetRecordsParamsCopyWith<$Res> {
  __$GetRecordsParamsCopyWithImpl(this._self, this._then);

  final _GetRecordsParams _self;
  final $Res Function(_GetRecordsParams) _then;

/// Create a copy of GetRecordsParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? month = freezed,Object? date = freezed,Object? limit = null,}) {
  return _then(_GetRecordsParams(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
