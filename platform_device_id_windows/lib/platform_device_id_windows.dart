import 'package:platform_device_id_platform_interface/platform_device_id_platform_interface.dart';
import 'package:win32_registry/win32_registry.dart';

class PlatformDeviceIdWindowsPlugin extends PlatformDeviceIdPlatform {
  static void registerWith() {
    PlatformDeviceIdPlatform.instance = PlatformDeviceIdWindowsPlugin();
  }

  @override
  Future<String?> getDeviceId() async {
    const keypath = r'SOFTWARE\Microsoft\Cryptography';
    final key = Registry.openPath(RegistryHive.localMachine, path: keypath);

    final machineGuid = key.getValue('MachineGuid');

    key.close();

    try {
      return machineGuid?.data as String?;
    } catch (e) {
      return null;
    }
  }
}
