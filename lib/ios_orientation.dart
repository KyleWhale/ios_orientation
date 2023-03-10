
import 'ios_orientation_platform_interface.dart';

enum OrientationIOS {
  unknown,
  portraitUp,
  landscapeLeft,
  landscapeRight,
}

class IosOrientation {

  setOrientation(OrientationIOS orientation) {
    IosOrientationPlatform.instance.setOrientation(orientation);
  }
}
