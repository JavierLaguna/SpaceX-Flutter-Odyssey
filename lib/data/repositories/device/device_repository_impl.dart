import 'package:SpaceXFlutterOdyssey/domain/repositories/device/device_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DeviceRepositoryImpl extends DeviceRepository {
  @override
  Future<bool> isDeviceDarkModeEnabled() async {
    final brightness = SchedulerBinding.instance!.window.platformBrightness;
    return brightness == Brightness.dark;
  }
}
