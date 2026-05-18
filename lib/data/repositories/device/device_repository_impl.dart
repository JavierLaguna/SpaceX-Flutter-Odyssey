import 'dart:ui';

import 'package:SpaceXFlutterOdyssey/domain/repositories/device/device_repository.dart';

class DeviceRepositoryImpl extends DeviceRepository {
  @override
  Future<bool> isDeviceDarkModeEnabled() async {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    return brightness == Brightness.dark;
  }
}
