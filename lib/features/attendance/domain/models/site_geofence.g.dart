// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_geofence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SiteGeofence _$SiteGeofenceFromJson(Map<String, dynamic> json) =>
    _SiteGeofence(
      siteId: json['site_id'] as String,
      siteName: json['site_name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radiusMeters: (json['radius_meters'] as num?)?.toDouble() ?? 50.0,
      isActive: json['is_active'] as bool? ?? true,
      addressDetails: json['address_details'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$SiteGeofenceToJson(_SiteGeofence instance) =>
    <String, dynamic>{
      'site_id': instance.siteId,
      'site_name': instance.siteName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius_meters': instance.radiusMeters,
      'is_active': instance.isActive,
      'address_details': instance.addressDetails,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
