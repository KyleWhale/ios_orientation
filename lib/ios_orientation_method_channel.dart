import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:ios_orientation/ios_orientation.dart';

import 'ios_orientation_platform_interface.dart';

/// An implementation of [IosOrientationPlatform] that uses method channels.
class MethodChannelIosOrientation extends IosOrientationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ios_orientation');

  @override
  setOrientation(OrientationIOS orientation) {
    methodChannel.invokeMethod<String>('setOrientation', transOrientation(orientation));
  }

  @override
  setLimitOrientation(SupportOrientationIOS orientation) {
    methodChannel.invokeMethod<bool>('setLimitOrientation', transSupportOrientation(orientation));
  }

  int transSupportOrientation(SupportOrientationIOS orientation) {
    switch (orientation) {
      case SupportOrientationIOS.portraitUp: {
        return 0;
      }
      case SupportOrientationIOS.landscape: {
        return 1;
      }
      case SupportOrientationIOS.allButUpsideDown: {
        return 2;
      }
    }
  }

  int transOrientation(OrientationIOS orientation) {
    switch (orientation) {
      case OrientationIOS.unknown: {
        return 0;
      }
      case OrientationIOS.portraitUp: {
        return 1;
      }
      case OrientationIOS.landscapeLeft: {
        return 2;
      }
      case OrientationIOS.landscapeRight: {
        return 3;
      }
    }
  }
}
