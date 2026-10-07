import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'i_device_info_service.dart';

@LazySingleton(as: IDeviceInfoService)
class AppDeviceInfoService implements IDeviceInfoService {
  final DeviceInfoPlugin _plugin;

  AppDeviceInfoService() : _plugin = DeviceInfoPlugin();
  AppDeviceInfoService.withPlugin(this._plugin);

  @override
  Future<String> getDeviceId() async {
    try {
      if (kIsWeb) {
        final webInfo = await _plugin.webBrowserInfo;
        return 'WEB-${webInfo.userAgent?.hashCode ?? 'UNKNOWN'}';
      } else if (Platform.isWindows) {
        final winInfo = await _plugin.windowsInfo;
        return winInfo.deviceId;
      } else if (Platform.isAndroid) {
        final androidInfo = await _plugin.androidInfo;
        return androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await _plugin.iosInfo;
        return iosInfo.identifierForVendor ?? 'IOS-UNKNOWN';
      }
    } catch (_) {}
    return 'DEVICE-UNKNOWN';
  }

  @override
  Future<String> getDeviceModel() async {
    try {
      if (kIsWeb) {
        final webInfo = await _plugin.webBrowserInfo;
        return webInfo.browserName.name;
      } else if (Platform.isWindows) {
        final winInfo = await _plugin.windowsInfo;
        return winInfo.computerName;
      } else if (Platform.isAndroid) {
        final androidInfo = await _plugin.androidInfo;
        return '${androidInfo.manufacturer} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        final iosInfo = await _plugin.iosInfo;
        return iosInfo.utsname.machine;
      }
    } catch (_) {}
    return 'Generic Device';
  }

  @override
  Future<String> getOsVersion() async {
    try {
      if (kIsWeb) {
        return 'Web';
      } else if (Platform.isWindows) {
        final winInfo = await _plugin.windowsInfo;
        return 'Windows ${winInfo.majorVersion}.${winInfo.minorVersion}';
      } else if (Platform.isAndroid) {
        final androidInfo = await _plugin.androidInfo;
        return 'Android ${androidInfo.version.release}';
      } else if (Platform.isIOS) {
        final iosInfo = await _plugin.iosInfo;
        return 'iOS ${iosInfo.systemVersion}';
      }
    } catch (_) {}
    return 'Unknown OS';
  }
}
