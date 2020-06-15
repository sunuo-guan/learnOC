//
//  AppDelegate.m
//  Hypno
//
//  Created by 关智豪 on 2020/6/12.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "AppDelegate.h"
#import "GZHHypnosisViewController.h"
#import "ReminderViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //使用init初始化
    GZHHypnosisViewController *gzhvc = [[GZHHypnosisViewController alloc]init];
    ReminderViewController *rvc = [[ReminderViewController alloc]init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = @[gzhvc, rvc];
    
    /*
    //获取NSBundler对象的指针，代表应用的主程序包
    NSBundle *appBundle = [NSBundle mainBundle];
    //告诉初始化方法在appBundle中查找xib文件
    ReminderViewController *rvc = [[ReminderViewController alloc]initWithNibName:@"ReminderViewController" bundle:appBundle];
    */
     
    //设置根视图控制器
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


/*
#pragma mark - UISceneSession lifecycle


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
