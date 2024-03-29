#import "IosOrientationPlugin.h"
#import <objc/runtime.h>

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
  }
  else if ([@"setLimitOrientation" isEqualToString:call.method]) {
      [[NSUserDefaults standardUserDefaults] setObject:call.arguments forKey:@"ios_orientation"];
      if (@available(iOS 16.0, *)) {
          [[UIApplication sharedApplication].keyWindow.rootViewController setNeedsUpdateOfSupportedInterfaceOrientations];
      }
      result(nil);
  } else {
      result(FlutterMethodNotImplemented);
  }
}

- (void)orientation:(int)orientation {
    
    if (orientation == 0) {
        return;
    }
    if (@available(iOS 16.0, *)) {
        [[UIApplication sharedApplication].keyWindow.rootViewController setNeedsUpdateOfSupportedInterfaceOrientations];
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
        return UIInterfaceOrientationMaskLandscapeRight;
    } else if (orientation == 3) {
        return UIInterfaceOrientationMaskLandscapeLeft;
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
