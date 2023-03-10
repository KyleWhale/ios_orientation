import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_orientation/ios_orientation.dart';
import 'package:ios_orientation/ios_orientation_method_channel.dart';

void main() {
  MethodChannelIosOrientation platform = MethodChannelIosOrientation();
  const MethodChannel channel = MethodChannel('ios_orientation');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '0';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('setOrientation', () async {
    expect(await platform.setOrientation(OrientationIOS.portraitUp), '0');
  });
}
