import 'dart:io' as io;
import 'package:platform_device_id_platform_interface/platform_device_id_platform_interface.dart';

class PlatformDeviceIdWindows extends PlatformDeviceIdPlatform {
  @override
  Future<String?> getDeviceId() async {
    return io.Process.runSync('wmic', ['csproduct', 'get', 'uuid']).stdout.toString().split('\n')[1].trim();
  }
}
