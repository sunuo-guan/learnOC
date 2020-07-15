//
//  ViewController.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/14.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "ViewController.h"
#import "GZHNormalTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController 

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = nil;
        self.tabBarItem.selectedImage = nil;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GZHNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[GZHNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    [cell layoutTableViewCell];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
