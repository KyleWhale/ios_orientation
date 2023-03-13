import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_orientation/ios_orientation.dart';
import 'package:ios_orientation/ios_orientation_platform_interface.dart';
import 'package:ios_orientation/ios_orientation_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIosOrientationPlatform
    with MockPlatformInterfaceMixin
    implements IosOrientationPlatform {

  @override
  setOrientation(OrientationIOS orientation) {
    debugPrint('setOrientation $orientation');
  }

  @override
  setLimitOrientation(SupportOrientationIOS orientation) {
    debugPrint('setLimitOrientation $orientation');
  }
}

void main() {
  final IosOrientationPlatform initialPlatform = IosOrientationPlatform.instance;

  test('$MethodChannelIosOrientation is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIosOrientation>());
  });

  test('setOrientation', () async {
    IosOrientation iosOrientationPlugin = IosOrientation();
    MockIosOrientationPlatform fakePlatform = MockIosOrientationPlatform();
    IosOrientationPlatform.instance = fakePlatform;

    expect(await iosOrientationPlugin.setOrientation(OrientationIOS.portraitUp), '0');
  });
}
