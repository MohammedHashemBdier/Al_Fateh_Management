// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_out_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckOutParams {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'lat') double get lat;@JsonKey(name: 'lng') double get lng;@JsonKey(name: 'accuracy') double get accuracy;@JsonKey(name: 'is_mock') bool get isMock;@JsonKey(name: 'site_id') String? get siteId;
/// Create a copy of CheckOutParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckOutParamsCopyWith<CheckOutParams> get copyWith => _$CheckOutParamsCopyWithImpl<CheckOutParams>(this as CheckOutParams, _$identity);

  /// Serializes this CheckOutParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CheckOutParams;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckOutParams&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng)&&(identical(other.accuracy, _this.accuracy) || other.accuracy == _this.accuracy)&&(identical(other.isMock, _this.isMock) || other.isMock == _this.isMock)&&(identical(other.siteId, _this.siteId) || other.siteId == _this.siteId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CheckOutParams;
  return Object.hash(runtimeType,_this.userId,_this.lat,_this.lng,_this.accuracy,_this.isMock,_this.siteId);
}

@override
String toString() {
  final _this = this as CheckOutParams;
  return 'CheckOutParams(userId: ${_this.userId}, lat: ${_this.lat}, lng: ${_this.lng}, accuracy: ${_this.accuracy}, isMock: ${_this.isMock}, siteId: ${_this.siteId})';
}


}

/// @nodoc
abstract mixin class $CheckOutParamsCopyWith<$Res>  {
  factory $CheckOutParamsCopyWith(CheckOutParams value, $Res Function(CheckOutParams) _then) = _$CheckOutParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'lat') double lat,@JsonKey(name: 'lng') double lng,@JsonKey(name: 'accuracy') double accuracy,@JsonKey(name: 'is_mock') bool isMock,@JsonKey(name: 'site_id') String? siteId
});




}
/// @nodoc
class _$CheckOutParamsCopyWithImpl<$Res>
    implements $CheckOutParamsCopyWith<$Res> {
  _$CheckOutParamsCopyWithImpl(this._self, this._then);

  final CheckOutParams _self;
  final $Res Function(CheckOutParams) _then;

/// Create a copy of CheckOutParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? lat = null,Object? lng = null,Object? accuracy = null,Object? isMock = null,Object? siteId = freezed,}) {
  return _then(CheckOutParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,isMock: null == isMock ? _self.isMock : isMock // ignore: cast_nullable_to_non_nullable
as bool,siteId: freezed == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckOutParams].
extension CheckOutParamsPatterns on CheckOutParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckOutParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckOutParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckOutParams value)  $default,){
final _that = this;
switch (_that) {
case _CheckOutParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckOutParams value)?  $default,){
final _that = this;
switch (_that) {
case _CheckOutParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'lng')  double lng, @JsonKey(name: 'accuracy')  double accuracy, @JsonKey(name: 'is_mock')  bool isMock, @JsonKey(name: 'site_id')  String? siteId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckOutParams() when $default != null:
return $default(_that.userId,_that.lat,_that.lng,_that.accuracy,_that.isMock,_that.siteId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'lng')  double lng, @JsonKey(name: 'accuracy')  double accuracy, @JsonKey(name: 'is_mock')  bool isMock, @JsonKey(name: 'site_id')  String? siteId)  $default,) {final _that = this;
switch (_that) {
case _CheckOutParams():
return $default(_that.userId,_that.lat,_that.lng,_that.accuracy,_that.isMock,_that.siteId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'lat')  double lat, @JsonKey(name: 'lng')  double lng, @JsonKey(name: 'accuracy')  double accuracy, @JsonKey(name: 'is_mock')  bool isMock, @JsonKey(name: 'site_id')  String? siteId)?  $default,) {final _that = this;
switch (_that) {
case _CheckOutParams() when $default != null:
return $default(_that.userId,_that.lat,_that.lng,_that.accuracy,_that.isMock,_that.siteId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckOutParams implements CheckOutParams {
  const _CheckOutParams({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'lat') required this.lat, @JsonKey(name: 'lng') required this.lng, @JsonKey(name: 'accuracy') this.accuracy = 0.0, @JsonKey(name: 'is_mock') this.isMock = false, @JsonKey(name: 'site_id') this.siteId});
  factory _CheckOutParams.fromJson(Map<String, dynamic> json) => _$CheckOutParamsFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'lat') final  double lat;
@override@JsonKey(name: 'lng') final  double lng;
@override@JsonKey(name: 'accuracy') final  double accuracy;
@override@JsonKey(name: 'is_mock') final  bool isMock;
@override@JsonKey(name: 'site_id') final  String? siteId;

/// Create a copy of CheckOutParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckOutParamsCopyWith<_CheckOutParams> get copyWith => __$CheckOutParamsCopyWithImpl<_CheckOutParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckOutParamsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckOutParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.isMock, isMock) || other.isMock == isMock)&&(identical(other.siteId, siteId) || other.siteId == siteId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,lat,lng,accuracy,isMock,siteId);
}

@override
String toString() {
    return 'CheckOutParams(userId: $userId, lat: $lat, lng: $lng, accuracy: $accuracy, isMock: $isMock, siteId: $siteId)';
}


}

/// @nodoc
abstract mixin class _$CheckOutParamsCopyWith<$Res> implements $CheckOutParamsCopyWith<$Res> {
  factory _$CheckOutParamsCopyWith(_CheckOutParams value, $Res Function(_CheckOutParams) _then) = __$CheckOutParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'lat') double lat,@JsonKey(name: 'lng') double lng,@JsonKey(name: 'accuracy') double accuracy,@JsonKey(name: 'is_mock') bool isMock,@JsonKey(name: 'site_id') String? siteId
});




}
/// @nodoc
class __$CheckOutParamsCopyWithImpl<$Res>
    implements _$CheckOutParamsCopyWith<$Res> {
  __$CheckOutParamsCopyWithImpl(this._self, this._then);

  final _CheckOutParams _self;
  final $Res Function(_CheckOutParams) _then;

/// Create a copy of CheckOutParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? lat = null,Object? lng = null,Object? accuracy = null,Object? isMock = null,Object? siteId = freezed,}) {
  return _then(_CheckOutParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,isMock: null == isMock ? _self.isMock : isMock // ignore: cast_nullable_to_non_nullable
as bool,siteId: freezed == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
