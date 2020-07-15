//
//  GZHRecommendViewController.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/15.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHRecommendViewController.h"

@interface GZHRecommendViewController () <UIScrollViewDelegate>

@end

@implementation GZHRecommendViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = nil;
        self.tabBarItem.selectedImage = nil;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //frame：大小  contentSize：可展示的区域大小
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 6, self.view.bounds.size.height);
    scrollView.delegate = self;
    
    NSArray *colorArr = @[[UIColor yellowColor], [UIColor redColor], [UIColor greenColor], [UIColor orangeColor], [UIColor whiteColor]];
    for (int i = 0; i < 5; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        view.backgroundColor = colorArr[i];
        [scrollView addSubview:view];
    }
    
    scrollView.pagingEnabled = NO;    //翻页效果
    [self.view addSubview:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"contentOffset.x = %f", scrollView.contentOffset.x);
}

@end
