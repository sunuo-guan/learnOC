//
//  AppDelegate.m
//  shopCar
//
//  Created by 关智豪 on 2020/7/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ViewController *vc = [[ViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:vc];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
