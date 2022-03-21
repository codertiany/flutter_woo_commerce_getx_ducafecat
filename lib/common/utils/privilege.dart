import 'package:get/get_utils/src/platform/platform.dart';
import 'package:permission_handler/permission_handler.dart';

import 'index.dart';

class PrivilegeResultStatus {
  final bool result;
  final String message;

  PrivilegeResultStatus({required this.result, required this.message});
}

class Privilege {
  static Future<PrivilegeResultStatus> photos() async {
    var value = false;
    if (GetPlatform.isIOS) {
      var statuses = await [Permission.photos].request();
      value = statuses[Permission.photos] == PermissionStatus.granted;
    }
    if (GetPlatform.isAndroid) {
      var statuses = await [Permission.storage].request();
      value = statuses[Permission.storage] == PermissionStatus.granted;
    }
    return PrivilegeResultStatus(
      result: value,
      message: value ? 'ok' : 'Please open photo gallery access',
    );
  }

  static Future<PrivilegeResultStatus> camera() async {
    var value = false;
    var permissions = <Permission>[];
    permissions.addAll([Permission.camera, Permission.microphone]);
    if (GetPlatform.isIOS) {
      permissions.add(Permission.photos);
    }
    if (GetPlatform.isAndroid) {
      permissions.add(Permission.storage);
    }
    var statuses = await permissions.request();
    value = statuses[Permission.camera] == PermissionStatus.granted &&
        statuses[Permission.microphone] == PermissionStatus.granted;
    if (GetPlatform.isIOS) {
      value = statuses[Permission.photos] == PermissionStatus.granted;
    }
    if (GetPlatform.isAndroid) {
      value = statuses[Permission.storage] == PermissionStatus.granted;
    }
    return PrivilegeResultStatus(
      result: value,
      message: value ? 'ok' : 'Please turn on camera and microphone access',
    );
  }

  static Future<PrivilegeResultStatus> microphone() async {
    var value = false;
    var statuses = await [Permission.microphone].request();
    value = statuses[Permission.microphone] == PermissionStatus.granted;
    return PrivilegeResultStatus(
      result: value,
      message: value ? 'ok' : 'Please turn on microphone access',
    );
  }

  static Future<bool> install() async {
    bool value = false;
    String text = '';
    if (GetPlatform.isAndroid) {
      value = await Permission.storage.request().isGranted;
      text =
          'Please allow access to storage space, settings will be opened soon';
    }
    if (GetPlatform.isIOS) value = true;
    if (!value) {
      Loading.toast(text);
      await Future.delayed(const Duration(seconds: 2));
      openSettings();
    }
    return value;
  }

  static Future<bool> openSettings() async {
    return await openAppSettings();
  }
}
