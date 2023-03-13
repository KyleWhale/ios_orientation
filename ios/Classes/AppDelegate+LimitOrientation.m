//
//  AppDelegate+LimitOrientation.m
//  ios_orientation
//
//  Created by admin on 2023/3/13.
//

#import "AppDelegate+LimitOrientation.h"
#import "IosOrientationPlugin.h"

@implementation AppDelegate (LimitOrientation)

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    
    if (IosOrientationPlugin.portrait == 1) {
        return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
    } else if (IosOrientationPlugin.portrait == 2) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    return UIInterfaceOrientationMaskPortrait;
}

@end
