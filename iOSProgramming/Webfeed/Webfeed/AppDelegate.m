//
//  AppDelegate.m
//  Webfeed
//
//  Created by 关智豪 on 2020/6/22.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "AppDelegate.h"
#import "CourseViewController.h"
#import "WebViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    CourseViewController *cvc = [[CourseViewController alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController *masterNav = [[UINavigationController alloc]initWithRootViewController:cvc];
    self.window.rootViewController = masterNav;
    WebViewController *wvc = [[WebViewController alloc]init];
    cvc.webViewController = wvc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
