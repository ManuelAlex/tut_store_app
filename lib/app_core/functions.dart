import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:tut_store_app/business/domain/models/device_info.dart';

Future<DeviceInfo> getDeviceInfo() async {
  String name = "Unknown";
  String identifier = "Unknown";
  String version = "Unknown";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      // return android device info
      var build = await deviceInfoPlugin.androidInfo;
      name = "${build.brand} ${build.model}";
      identifier = build.id;
      version = build.version.codename;
    } else if (Platform.isIOS) {
      // return ios device info
      var build = await deviceInfoPlugin.iosInfo;
      name = "${build.name} ${build.model}";
      identifier = build.identifierForVendor ?? identifier;
      version = build.systemVersion;
    }
  } on PlatformException {
    // return default data here
    return DeviceInfo(
      name: name,
      identifier: identifier,
      version: version,
    );
  }
  return DeviceInfo(
    name: name,
    identifier: identifier,
    version: version,
  );
}
