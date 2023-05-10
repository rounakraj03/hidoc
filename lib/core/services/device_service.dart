import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';


enum _SupportedDevice { android, ios }

@singleton
class DeviceService {
  final deviceInfo = DeviceInfoPlugin();

  _SupportedDevice get _supportedDevice {
    if(Platform.isAndroid) {
      return _SupportedDevice.android;
    }
    if(Platform.isIOS) {
      return _SupportedDevice.ios;
    }
    throw UnsupportedError('Unsupported platform');
  }


  Future<IosDeviceInfo> get _iosInfo => deviceInfo.iosInfo;

  Future<AndroidDeviceInfo> get _androidInfo => deviceInfo.androidInfo;

  Future<String> getDeviceId() async {
    switch(_supportedDevice) {
      case _SupportedDevice.android:
        return (await _androidInfo).id;
      case _SupportedDevice.ios:
        return (await _iosInfo).identifierForVendor!;
    }
  }

  Future<String> getDeviceName() async {
    switch (_supportedDevice) {
      case _SupportedDevice.android:
        return (await _androidInfo).model;
      case _SupportedDevice.ios:
        return (await _iosInfo).model!;
    }
  }



  Future<Map<String, dynamic>> getDeviceDetailMap() async {
    return (await deviceInfo.deviceInfo).data;
  }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return '${packageInfo.version}+${packageInfo.buildNumber}';
  }



}