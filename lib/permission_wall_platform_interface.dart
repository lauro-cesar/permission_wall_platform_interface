import 'dart:async';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'method_channel_permission_wall.dart';

abstract class PermissionWallPlatform extends PlatformInterface {
  PermissionWallPlatform() : super(token: _token);

  static final Object _token = Object();

  static PermissionWallPlatform _instance = MethodChannelPermissionWall();
  static PermissionWallPlatform get instance => _instance;

  static set instance(PermissionWallPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> get platformVersion async {
    throw UnimplementedError('platformVersion has not been implemented.');
  }
}
