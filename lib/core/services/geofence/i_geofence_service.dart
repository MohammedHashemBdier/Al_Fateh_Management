import '../../../features/attendance/domain/models/site_geofence.dart';

class GeofenceResult {
  final bool isInside;
  final double distanceMeters;
  final SiteGeofence? matchedSite;
  final double radiusMeters;

  const GeofenceResult({
    required this.isInside,
    required this.distanceMeters,
    this.matchedSite,
    required this.radiusMeters,
  });
}

abstract interface class IGeofenceService {
  Future<GeofenceResult> checkGeofence({
    required double lat,
    required double lng,
    required List<SiteGeofence> sites,
    double? customRadius,
  });

  double calculateDistance(double lat1, double lng1, double lat2, double lng2);

  Future<void> cacheSites(List<SiteGeofence> sites);

  List<SiteGeofence>? getCachedSites();
}
