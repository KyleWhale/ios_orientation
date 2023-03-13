
import 'ios_orientation_platform_interface.dart';

enum OrientationIOS {
  unknown,
  portraitUp,
  landscapeLeft,
  landscapeRight,
}

enum SupportOrientationIOS {
  portraitUp,
  landscape,
  allButUpsideDown,
}

class IosOrientation {

  setOrientation(OrientationIOS orientation) {
    IosOrientationPlatform.instance.setOrientation(orientation);
  }

  setLimitOrientation(SupportOrientationIOS orientation) {
    IosOrientationPlatform.instance.setLimitOrientation(orientation);
  }
}
