abstract interface class IDeviceInfoService {
  Future<String> getDeviceId();
  Future<String> getDeviceModel();
  Future<String> getOsVersion();
}
