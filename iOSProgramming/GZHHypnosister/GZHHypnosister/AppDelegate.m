//
//  AppDelegate.m
//  GZHHypnosister
//
//  Created by 关智豪 on 2020/6/12.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "AppDelegate.h"
#import "GZHHypnosisView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 1.创建UIWindow
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //解决必须要controller的问题
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for(UIWindow *window in windows) {
        if(window.rootViewController == nil){
            UIViewController *vc = [[UIViewController alloc]initWithNibName:nil bundle:nil];
            window.rootViewController = vc;
        }
    }
    //=========
    
    
    // 设置UIWindow的背景颜色
    self.window.backgroundColor = [UIColor whiteColor];
    
    CGRect firstFrame = CGRectMake(160, 240, 100, 150);
    GZHHypnosisView *firstView = [[GZHHypnosisView alloc]initWithFrame:firstFrame];
    firstView.backgroundColor = [UIColor redColor];
    
    CGRect secondFrame = CGRectMake(20, 30, 50, 50);
    GZHHypnosisView *secondView = [[GZHHypnosisView alloc]initWithFrame:secondFrame];
    secondView.backgroundColor = [UIColor blueColor];
    [firstView addSubview:secondView];
    
    //添加进window属性
    [self.window addSubview:firstView];
    [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - UISceneSession lifecycle

/*
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}
*/

@end
