import 'dart:math';

import 'package:injectable/injectable.dart';

import '../../../features/attendance/domain/models/site_geofence.dart';
import 'i_geofence_service.dart';

@LazySingleton(as: IGeofenceService)
class AppGeofenceService implements IGeofenceService {
  List<SiteGeofence>? _cachedSites;

  @override
  Future<GeofenceResult> checkGeofence({
    required double lat,
    required double lng,
    required List<SiteGeofence> sites,
    double? customRadius,
  }) async {
    final activeSites = sites.where((s) => s.isActive).toList();
    if (activeSites.isEmpty) {
      return const GeofenceResult(
        isInside: false,
        distanceMeters: double.infinity,
        radiusMeters: 50.0,
      );
    }

    double minDistance = double.infinity;
    SiteGeofence? closestSite;
    bool isInside = false;

    for (final site in activeSites) {
      final distance = calculateDistance(
        lat,
        lng,
        site.latitude,
        site.longitude,
      );

      final allowedRadius = customRadius ?? site.radiusMeters;

      if (distance < minDistance) {
        minDistance = distance;
        closestSite = site;
      }

      if (distance <= allowedRadius) {
        isInside = true;
        closestSite = site;
        break;
      }
    }

    return GeofenceResult(
      isInside: isInside,
      distanceMeters: minDistance,
      matchedSite: closestSite,
      radiusMeters: customRadius ?? closestSite?.radiusMeters ?? 50.0,
    );
  }

  @override
  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    const double earthRadiusMeters = 6371000;
    final double dLat = _degToRad(lat2 - lat1);
    final double dLng = _degToRad(lng2 - lng1);

    final double a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_degToRad(lat1)) *
            cos(_degToRad(lat2)) *
            sin(dLng / 2) *
            sin(dLng / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadiusMeters * c;
  }

  double _degToRad(double deg) => deg * (pi / 180.0);

  @override
  Future<void> cacheSites(List<SiteGeofence> sites) async {
    _cachedSites = List.unmodifiable(sites);
  }

  @override
  List<SiteGeofence>? getCachedSites() => _cachedSites;
}
