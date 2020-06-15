//
//  GZHHypnosisViewController.m
//  Hypno
//
//  Created by 关智豪 on 2020/6/15.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHHypnosisViewController.h"
#import "GZHHypnosisView.h"

@interface GZHHypnosisViewController() <UITextFieldDelegate>

@end

@implementation GZHHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        //设置标签
        self.tabBarItem.title = @"Hypnosis";
        //加载图片
        UIImage *image = [UIImage imageNamed:@"Hypno.jpg"];
        self.tabBarItem.image = image;
    }
    return self;
}

- (void)loadView
{
    //将新创建的对象赋予view属性
    //GZHHypnosisView *backgroundView = [[GZHHypnosisView alloc]init];
    //self.view = backgroundView;
    CGRect frame = [UIScreen mainScreen].bounds;
    GZHHypnosisView *backgroundView = [[GZHHypnosisView alloc]initWithFrame:frame];
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc]initWithFrame:textFieldRect];
    //设置边框样式
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    //修改UITextField属性
    textField.placeholder = @"Hypnotize me";   //默认的占位文本
    textField.returnKeyType = UIReturnKeyDone;   //换行键显示为done
    
    //设置委托为控制器自身
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    self.view = backgroundView;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc]init];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.text = message;
        //根据文字调整label大小
        [messageLabel sizeToFit];
        //x的坐标
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        //y的坐标
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        //label的frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        //
        [self.view addSubview:messageLabel];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

@end
