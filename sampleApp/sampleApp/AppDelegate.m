//
//  AppDelegate.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/14.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "AppDelegate.h"
#import "GZHNewsViewController.h"
#import "GZHVideoViewController.h"
#import "GZHRecommendViewController.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tbc = [[UITabBarController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:tbc];
    
    GZHNewsViewController *vc0 = [[GZHNewsViewController alloc] init];
    GZHVideoViewController *vc1 = [[GZHVideoViewController alloc] init];
    GZHRecommendViewController *vc2 = [[GZHRecommendViewController alloc] init];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor whiteColor];
    vc3.tabBarItem.title = @"我的";
    
    [tbc setViewControllers:@[vc0,vc1,vc2,vc3]];
    tbc.delegate = self;
    
    [self.window setRootViewController:nc];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"hello");
}

@end
