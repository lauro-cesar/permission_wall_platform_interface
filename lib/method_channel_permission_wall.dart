import 'dart:async';

import 'package:flutter/services.dart';
import 'permission_wall_platform_interface.dart';

const MethodChannel _channel = MethodChannel('plugins.hostcert.com.br/permission_wall');

class MethodChannelPermissionWall extends PermissionWallPlatform {
  @override
  Future<bool> canLaunch(String url) {
    return _channel.invokeMethod<bool>(
      'canLaunch',
      <String, Object>{'url': url},
    ).then((value) => value ?? false);
  }
}
