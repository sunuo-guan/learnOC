//
//  ReminderViewController.m
//  Hypno
//
//  Created by 关智豪 on 2020/6/15.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController ()

@property (nonatomic, weak)IBOutlet UIDatePicker *datePicker;

@end

@implementation ReminderViewController

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    UILocalNotification *note = [[UILocalNotification alloc]init];
    note.alertBody = @"hypnotize me";
    note.fireDate = date;
    [[UIApplication sharedApplication]scheduleLocalNotification:note];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        //设置标签
        self.tabBarItem.title = @"Reminder";
        //加载图片
        UIImage *image = [UIImage imageNamed:@"Time.jpg"];
        self.tabBarItem.image = image;
    }
    return self;
}

@end
