import 'package:geolocator/geolocator.dart';

enum LocationPermissionStatus {
  granted,
  denied,
  deniedForever,
  whileInUse,
  always,
  serviceDisabled,
}

abstract interface class ILocationService {
  Future<Position> getCurrentPosition();
  Stream<Position> getPositionStream();
  Future<LocationPermissionStatus> checkPermission();
  Future<LocationPermissionStatus> requestPermission();
  Future<bool> isLocationServiceEnabled();
  Future<void> openLocationSettings();
  Future<void> openAppSettings();
  bool isMockLocation(Position position);
}
