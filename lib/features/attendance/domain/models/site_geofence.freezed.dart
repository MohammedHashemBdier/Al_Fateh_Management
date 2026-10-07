// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_geofence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SiteGeofence {

@JsonKey(name: 'site_id') String get siteId;@JsonKey(name: 'site_name') String get siteName;@JsonKey(name: 'latitude') double get latitude;@JsonKey(name: 'longitude') double get longitude;@JsonKey(name: 'radius_meters') double get radiusMeters;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'address_details') String? get addressDetails;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of SiteGeofence
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteGeofenceCopyWith<SiteGeofence> get copyWith => _$SiteGeofenceCopyWithImpl<SiteGeofence>(this as SiteGeofence, _$identity);

  /// Serializes this SiteGeofence to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SiteGeofence;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteGeofence&&(identical(other.siteId, _this.siteId) || other.siteId == _this.siteId)&&(identical(other.siteName, _this.siteName) || other.siteName == _this.siteName)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.radiusMeters, _this.radiusMeters) || other.radiusMeters == _this.radiusMeters)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.addressDetails, _this.addressDetails) || other.addressDetails == _this.addressDetails)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SiteGeofence;
  return Object.hash(runtimeType,_this.siteId,_this.siteName,_this.latitude,_this.longitude,_this.radiusMeters,_this.isActive,_this.addressDetails,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as SiteGeofence;
  return 'SiteGeofence(siteId: ${_this.siteId}, siteName: ${_this.siteName}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, radiusMeters: ${_this.radiusMeters}, isActive: ${_this.isActive}, addressDetails: ${_this.addressDetails}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $SiteGeofenceCopyWith<$Res>  {
  factory $SiteGeofenceCopyWith(SiteGeofence value, $Res Function(SiteGeofence) _then) = _$SiteGeofenceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'site_id') String siteId,@JsonKey(name: 'site_name') String siteName,@JsonKey(name: 'latitude') double latitude,@JsonKey(name: 'longitude') double longitude,@JsonKey(name: 'radius_meters') double radiusMeters,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'address_details') String? addressDetails,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$SiteGeofenceCopyWithImpl<$Res>
    implements $SiteGeofenceCopyWith<$Res> {
  _$SiteGeofenceCopyWithImpl(this._self, this._then);

  final SiteGeofence _self;
  final $Res Function(SiteGeofence) _then;

/// Create a copy of SiteGeofence
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? siteId = null,Object? siteName = null,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,Object? isActive = null,Object? addressDetails = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(SiteGeofence(
siteId: null == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String,siteName: null == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,addressDetails: freezed == addressDetails ? _self.addressDetails : addressDetails // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SiteGeofence].
extension SiteGeofencePatterns on SiteGeofence {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteGeofence value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteGeofence() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteGeofence value)  $default,){
final _that = this;
switch (_that) {
case _SiteGeofence():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteGeofence value)?  $default,){
final _that = this;
switch (_that) {
case _SiteGeofence() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'site_id')  String siteId, @JsonKey(name: 'site_name')  String siteName, @JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude, @JsonKey(name: 'radius_meters')  double radiusMeters, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'address_details')  String? addressDetails, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteGeofence() when $default != null:
return $default(_that.siteId,_that.siteName,_that.latitude,_that.longitude,_that.radiusMeters,_that.isActive,_that.addressDetails,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'site_id')  String siteId, @JsonKey(name: 'site_name')  String siteName, @JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude, @JsonKey(name: 'radius_meters')  double radiusMeters, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'address_details')  String? addressDetails, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SiteGeofence():
return $default(_that.siteId,_that.siteName,_that.latitude,_that.longitude,_that.radiusMeters,_that.isActive,_that.addressDetails,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'site_id')  String siteId, @JsonKey(name: 'site_name')  String siteName, @JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude, @JsonKey(name: 'radius_meters')  double radiusMeters, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'address_details')  String? addressDetails, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SiteGeofence() when $default != null:
return $default(_that.siteId,_that.siteName,_that.latitude,_that.longitude,_that.radiusMeters,_that.isActive,_that.addressDetails,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SiteGeofence implements SiteGeofence {
  const _SiteGeofence({@JsonKey(name: 'site_id') required this.siteId, @JsonKey(name: 'site_name') required this.siteName, @JsonKey(name: 'latitude') required this.latitude, @JsonKey(name: 'longitude') required this.longitude, @JsonKey(name: 'radius_meters') this.radiusMeters = 50.0, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'address_details') this.addressDetails, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _SiteGeofence.fromJson(Map<String, dynamic> json) => _$SiteGeofenceFromJson(json);

@override@JsonKey(name: 'site_id') final  String siteId;
@override@JsonKey(name: 'site_name') final  String siteName;
@override@JsonKey(name: 'latitude') final  double latitude;
@override@JsonKey(name: 'longitude') final  double longitude;
@override@JsonKey(name: 'radius_meters') final  double radiusMeters;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'address_details') final  String? addressDetails;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of SiteGeofence
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteGeofenceCopyWith<_SiteGeofence> get copyWith => __$SiteGeofenceCopyWithImpl<_SiteGeofence>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteGeofenceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteGeofence&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.addressDetails, addressDetails) || other.addressDetails == addressDetails)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,siteId,siteName,latitude,longitude,radiusMeters,isActive,addressDetails,createdAt,updatedAt);
}

@override
String toString() {
    return 'SiteGeofence(siteId: $siteId, siteName: $siteName, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters, isActive: $isActive, addressDetails: $addressDetails, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SiteGeofenceCopyWith<$Res> implements $SiteGeofenceCopyWith<$Res> {
  factory _$SiteGeofenceCopyWith(_SiteGeofence value, $Res Function(_SiteGeofence) _then) = __$SiteGeofenceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'site_id') String siteId,@JsonKey(name: 'site_name') String siteName,@JsonKey(name: 'latitude') double latitude,@JsonKey(name: 'longitude') double longitude,@JsonKey(name: 'radius_meters') double radiusMeters,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'address_details') String? addressDetails,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$SiteGeofenceCopyWithImpl<$Res>
    implements _$SiteGeofenceCopyWith<$Res> {
  __$SiteGeofenceCopyWithImpl(this._self, this._then);

  final _SiteGeofence _self;
  final $Res Function(_SiteGeofence) _then;

/// Create a copy of SiteGeofence
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? siteId = null,Object? siteName = null,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,Object? isActive = null,Object? addressDetails = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_SiteGeofence(
siteId: null == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as String,siteName: null == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,addressDetails: freezed == addressDetails ? _self.addressDetails : addressDetails // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
