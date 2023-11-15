import 'dart:io' as io;
import 'package:platform_device_id_platform_interface/platform_device_id_platform_interface.dart';

class PlatformDeviceIdWindowsPlugin extends PlatformDeviceIdPlatform {
  static void registerWith() {
    PlatformDeviceIdPlatform.instance = PlatformDeviceIdWindowsPlugin();
  }

  @override
  Future<String?> getDeviceId() async {
    final id = await io.Process.run('wmic', ['csproduct', 'get', 'uuid']);

    return id.stdout.toString().split('\n')[1].trim();
  }
}
