// lib/core/services/device_identifier_service.dart
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceIdentifierService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<String> getDeviceIdentifier() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return androidInfo.id ?? 'AnonymousAndroid';
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        return iosInfo.identifierForVendor ?? 'AnonymousIOS';
      } else {
        return 'UnknownDevice';
      }
    } catch (e) {
      return 'Anonymous';
    }
  }
}
