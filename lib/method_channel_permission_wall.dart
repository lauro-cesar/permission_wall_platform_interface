import 'dart:async';

import 'package:flutter/services.dart';
import 'permission_wall_platform_interface.dart';

const MethodChannel _channel = MethodChannel('plugins.hostcert.com.br/permission_wall');

class MethodChannelPermissionWall extends PermissionWallPlatform {
  @override
  Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
