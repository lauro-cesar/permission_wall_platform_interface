import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package:permission_wall_platform_interface/permission_wall_platform_interface.dart';
import 'package:permission_wall_platform_interface/method_channel_permission_wall.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('$PermissionWallPlatform', () {
    test('$MethodChannelPermissionWall() is the default instance', () {
      expect(PermissionWallPlatform.instance, isInstanceOf<MethodChannelPermissionWall>());
    });

    test('Cannot be implemented with `implements`', () {
      expect(() {
        PermissionWallPlatform.instance = ImplementsPermissionWallPlatform();
      }, throwsA(isInstanceOf<AssertionError>()));
    });

    test('Can be mocked with `implements`', () {
      final PermissionWallPlatformMock mock = PermissionWallPlatformMock();
      PermissionWallPlatform.instance = mock;
    });

    test('Can be extended', () {
      PermissionWallPlatform.instance = ExtendsPermissionWallPlatform();
    });
  });
}

class ExtendsPermissionWallPlatform extends PermissionWallPlatform {}

class PermissionWallPlatformMock extends Mock with MockPlatformInterfaceMixin implements PermissionWallPlatform {}

class ImplementsPermissionWallPlatform extends Mock implements PermissionWallPlatform {}
