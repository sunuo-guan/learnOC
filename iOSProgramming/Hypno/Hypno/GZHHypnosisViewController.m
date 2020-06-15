//
//  GZHHypnosisViewController.m
//  Hypno
//
//  Created by 关智豪 on 2020/6/15.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHHypnosisViewController.h"
#import "GZHHypnosisView.h"

@implementation GZHHypnosisViewController

- (void)loadView
{
    //将新创建的对象赋予view属性
    GZHHypnosisView *backgroundView = [[GZHHypnosisView alloc]init];
    self.view = backgroundView;
}

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

@end
