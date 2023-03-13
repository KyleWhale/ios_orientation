#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#if __has_include(<ios_orientation/IosOrientationPlugin.h>)
#import <ios_orientation/IosOrientationPlugin.h>
#else
@import ios_orientation;
#endif

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
