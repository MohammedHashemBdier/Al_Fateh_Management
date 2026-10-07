import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import 'i_location_service.dart';

@LazySingleton(as: ILocationService)
class AppLocationService implements ILocationService {
  @override
  Future<Position> getCurrentPosition() async {
    final isEnabled = await isLocationServiceEnabled();
    if (!isEnabled) {
      throw StateError('خدمات الموقع الجغرافي معطلة على هذا الجهاز');
    }

    final permission = await checkPermission();
    if (permission == LocationPermissionStatus.denied ||
        permission == LocationPermissionStatus.deniedForever) {
      final req = await requestPermission();
      if (req == LocationPermissionStatus.denied ||
          req == LocationPermissionStatus.deniedForever) {
        throw StateError('تم رفض صلاحية الوصول إلى الموقع الجغرافي');
      }
    }

    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      ),
    );
  }

  @override
  Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    );
  }

  @override
  Future<LocationPermissionStatus> checkPermission() async {
    final perm = await Geolocator.checkPermission();
    return _mapPermission(perm);
  }

  @override
  Future<LocationPermissionStatus> requestPermission() async {
    final perm = await Geolocator.requestPermission();
    return _mapPermission(perm);
  }

  @override
  Future<bool> isLocationServiceEnabled() {
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<void> openLocationSettings() {
    return Geolocator.openLocationSettings();
  }

  @override
  Future<void> openAppSettings() {
    return Geolocator.openAppSettings();
  }

  @override
  bool isMockLocation(Position position) {
    return position.isMocked;
  }

  LocationPermissionStatus _mapPermission(LocationPermission permission) {
    return switch (permission) {
      LocationPermission.always => LocationPermissionStatus.always,
      LocationPermission.whileInUse => LocationPermissionStatus.whileInUse,
      LocationPermission.denied => LocationPermissionStatus.denied,
      LocationPermission.deniedForever =>
        LocationPermissionStatus.deniedForever,
      LocationPermission.unableToDetermine => LocationPermissionStatus.denied,
    };
  }
}
