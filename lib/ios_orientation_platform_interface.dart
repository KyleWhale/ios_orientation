import 'package:ios_orientation/ios_orientation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ios_orientation_method_channel.dart';

abstract class IosOrientationPlatform extends PlatformInterface {
  /// Constructs a IosOrientationPlatform.
  IosOrientationPlatform() : super(token: _token);

  static final Object _token = Object();

  static IosOrientationPlatform _instance = MethodChannelIosOrientation();

  /// The default instance of [IosOrientationPlatform] to use.
  ///
  /// Defaults to [MethodChannelIosOrientation].
  static IosOrientationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IosOrientationPlatform] when
  /// they register themselves.
  static set instance(IosOrientationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  setOrientation(OrientationIOS orientation) {
    throw UnimplementedError('setOrientation() has not been implemented.');
  }

  setLimitOrientation(SupportOrientationIOS orientation) {
    throw UnimplementedError('setLimitOrientation() has not been implemented.');
  }
}
