import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../domain/models/site_geofence.dart';

/// ويدجيت الخريطة التفاعلية لعرض موقع الموظف والنطاق الجغرافي للمقر (Geofence Map)
class GeofenceMap extends StatefulWidget {
  final double? userLatitude;
  final double? userLongitude;
  final double? accuracyMeters;
  final SiteGeofence? targetSite;
  final List<SiteGeofence> allSites;
  final bool isInsideGeofence;
  final double height;

  const GeofenceMap({
    super.key,
    this.userLatitude,
    this.userLongitude,
    this.accuracyMeters,
    this.targetSite,
    this.allSites = const [],
    this.isInsideGeofence = false,
    this.height = 300.0,
  });

  @override
  State<GeofenceMap> createState() => _GeofenceMapState();
}

class _GeofenceMapState extends State<GeofenceMap> {
  late final MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  void didUpdateWidget(covariant GeofenceMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.userLatitude != null &&
        widget.userLongitude != null &&
        (oldWidget.userLatitude != widget.userLatitude ||
            oldWidget.userLongitude != widget.userLongitude)) {
      _recenter(LatLng(widget.userLatitude!, widget.userLongitude!));
    }
  }

  void _recenter(LatLng center) {
    try {
      _mapController.move(center, 16.5);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final primarySite =
        widget.targetSite ??
        (widget.allSites.isNotEmpty ? widget.allSites.first : null);

    final siteCenter = primarySite != null
        ? LatLng(primarySite.latitude, primarySite.longitude)
        : const LatLng(33.5138, 36.2765); // الافتراضي: دمشق - الفتح

    final userCenter =
        (widget.userLatitude != null && widget.userLongitude != null)
        ? LatLng(widget.userLatitude!, widget.userLongitude!)
        : null;

    final initialCenter = userCenter ?? siteCenter;

    final sitesToDraw = widget.allSites.isNotEmpty
        ? widget.allSites
        : (primarySite != null ? [primarySite] : <SiteGeofence>[]);

    return ClipRRect(
      borderRadius: AppRadii.lg,
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: AppRadii.lg,
          border: Border.all(
            color: colors.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        child: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: initialCenter,
                initialZoom: 16.0,
                minZoom: 10.0,
                maxZoom: 18.5,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.alfateh.management',
                ),
                // دوائر النطاق الجغرافي للمواقع
                CircleLayer(
                  circles: sitesToDraw.map((site) {
                    final siteColor = widget.isInsideGeofence
                        ? colors.success
                        : colors.primary;

                    return CircleMarker(
                      point: LatLng(site.latitude, site.longitude),
                      radius: site.radiusMeters,
                      useRadiusInMeter: true,
                      color: siteColor.withValues(alpha: 0.18),
                      borderColor: siteColor.withValues(alpha: 0.8),
                      borderStrokeWidth: 2.0,
                    );
                  }).toList(),
                ),
                // دايرة دقة الـ GPS للمستخدم
                if (userCenter != null && widget.accuracyMeters != null)
                  CircleLayer(
                    circles: [
                      CircleMarker(
                        point: userCenter,
                        radius: widget.accuracyMeters!,
                        useRadiusInMeter: true,
                        color: colors.info.withValues(alpha: 0.12),
                        borderColor: colors.info.withValues(alpha: 0.4),
                        borderStrokeWidth: 1.0,
                      ),
                    ],
                  ),
                // دبابيس المواقع
                MarkerLayer(
                  markers: [
                    // مواقع الشركة
                    ...sitesToDraw.map((site) {
                      return Marker(
                        point: LatLng(site.latitude, site.longitude),
                        width: 44,
                        height: 44,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(AppDimens.space6),
                              decoration: BoxDecoration(
                                color: colors.primary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: colors.shadow.withValues(
                                      alpha: 0.25,
                                    ),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.business_rounded,
                                size: AppDimens.iconSm,
                                color: colors.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    // موقع الموظف
                    if (userCenter != null)
                      Marker(
                        point: userCenter,
                        width: 48,
                        height: 48,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (widget.isInsideGeofence
                                        ? colors.success
                                        : colors.error)
                                    .withValues(alpha: 0.25),
                          ),
                          child: Center(
                            child: Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                color: widget.isInsideGeofence
                                    ? colors.success
                                    : colors.error,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.person_pin_circle_rounded,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            // أزرار التحكم وإعادة التوسيط السريع
            Positioned(
              bottom: AppDimens.spacingSmall,
              left: AppDimens.spacingSmall,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (userCenter != null)
                    FloatingActionButton.small(
                      heroTag: 'recenter_user',
                      backgroundColor: colors.surface,
                      foregroundColor: colors.primary,
                      tooltip: context.tr('map_recenter_user'),
                      onPressed: () => _recenter(userCenter),
                      child: const Icon(Icons.my_location_rounded),
                    ),
                  const SizedBox(height: AppDimens.space6),
                  FloatingActionButton.small(
                    heroTag: 'recenter_site',
                    backgroundColor: colors.surface,
                    foregroundColor: colors.primary,
                    tooltip: context.tr('map_recenter_site'),
                    onPressed: () => _recenter(siteCenter),
                    child: const Icon(Icons.apartment_rounded),
                  ),
                ],
              ),
            ),
            // ملصق حالة التواجد داخل/خارج النطاق في أعلى الخريطة
            Positioned(
              top: AppDimens.spacingSmall,
              right: AppDimens.spacingSmall,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.space12,
                  vertical: AppDimens.space6,
                ),
                decoration: BoxDecoration(
                  color:
                      (widget.isInsideGeofence ? colors.success : colors.error)
                          .withValues(alpha: 0.9),
                  borderRadius: AppRadii.full,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.isInsideGeofence
                          ? Icons.check_circle_outline_rounded
                          : Icons.fmd_bad_outlined,
                      size: AppDimens.iconSm,
                      color: Colors.white,
                    ),
                    const SizedBox(width: AppDimens.space6),
                    Text(
                      context.tr(
                        widget.isInsideGeofence
                            ? 'geofence_inside'
                            : 'geofence_outside',
                      ),
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
