//
//  ViewController.m
//  shopCar
//
//  Created by 关智豪 on 2020/7/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "ViewController.h"
#import "mainView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    self.view = [[mainView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
