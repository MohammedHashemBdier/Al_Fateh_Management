import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_geofence.freezed.dart';
part 'site_geofence.g.dart';

/// الكيان الخاص بمواقع الدوام والنطاق الجغرافي (Site Geofence Entity)
@freezed
abstract class SiteGeofence with _$SiteGeofence {
  const factory SiteGeofence({
    @JsonKey(name: 'site_id') required String siteId,
    @JsonKey(name: 'site_name') required String siteName,
    @JsonKey(name: 'latitude') required double latitude,
    @JsonKey(name: 'longitude') required double longitude,
    @JsonKey(name: 'radius_meters') @Default(50.0) double radiusMeters,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'address_details') String? addressDetails,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _SiteGeofence;

  factory SiteGeofence.fromJson(Map<String, dynamic> json) =>
      _$SiteGeofenceFromJson(json);
}
