//
//  AppDelegate.m
//  Task7
//
//  Created by Dear Friend on 04.07.2021.
//

#import "AppDelegate.h"
#import "XIBViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    XIBViewController *rootVC = [[XIBViewController alloc] init];
    window.rootViewController = rootVC;
    self.window = window;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

@end
