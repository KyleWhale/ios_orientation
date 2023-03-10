#import "IosOrientationPlugin.h"

@implementation IosOrientationPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"ios_orientation"
            binaryMessenger:[registrar messenger]];
  IosOrientationPlugin* instance = [[IosOrientationPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    
  if ([@"setOrientation" isEqualToString:call.method]) {
      [self orientation:[call.arguments intValue]];
      result(nil);
  } else {
      result(FlutterMethodNotImplemented);
  }
}

// ios16之后横竖屏转换
- (void)orientation:(int)orientation {
    
    if (orientation == 0) {
        return;
    }
    if (@available(iOS 16.0, *)) {
        NSArray *array = [[[UIApplication sharedApplication] connectedScenes] allObjects];
        UIWindowScene *scene = [array firstObject];
        UIInterfaceOrientationMask mask = [self orientationMask:orientation];
        UIWindowSceneGeometryPreferencesIOS *geometry = [[UIWindowSceneGeometryPreferencesIOS alloc] initWithInterfaceOrientations:mask];
        [scene requestGeometryUpdateWithPreferences:geometry errorHandler:^(NSError * _Nonnull error) {}];
    } else {
        UIDeviceOrientation deviceOrientation = [self deviceOrientation:orientation];
        NSNumber *target = [NSNumber numberWithInteger:deviceOrientation];
        [[UIDevice currentDevice] setValue:target forKey:@"orientation"];
    }
}

- (UIInterfaceOrientationMask)orientationMask:(int)orientation {
    
    if (orientation == 1) {
        return UIInterfaceOrientationMaskPortrait;
    } else if (orientation == 2) {
        return UIInterfaceOrientationMaskLandscapeLeft;
    } else if (orientation == 3) {
        return UIInterfaceOrientationMaskLandscapeRight;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (UIDeviceOrientation)deviceOrientation:(int)orientation {
    
    if (orientation == 1) {
        return UIDeviceOrientationPortrait;
    } else if (orientation == 2) {
        return UIDeviceOrientationLandscapeLeft;
    } else if (orientation == 3) {
        return UIDeviceOrientationLandscapeRight;
    }
    return UIDeviceOrientationPortrait;
}

@end
