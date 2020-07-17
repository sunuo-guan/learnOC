//
//  ViewController.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/14.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHNewsViewController.h"
#import "GZHNormalTableViewCell.h"
#import "GZHDetailViewController.h"
#import "GZHDeleteCellView.h"
#import "GZHListLoader.h"

@interface GZHNewsViewController () <UITableViewDataSource, UITableViewDelegate, GZHNormalTableViewCellDelegate>

@property (nonatomic, strong) GZHListLoader *listLoader;

@end

@implementation GZHNewsViewController

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
    
    self.listLoader = [[GZHListLoader alloc] init];
    [self.listLoader loadListData];
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
        cell.delegate = self;
    }
    [cell layoutTableViewCell];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GZHDetailViewController *vc = [[GZHDetailViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    GZHDeleteCellView *deleteCellView = [[GZHDeleteCellView alloc] initWithFrame:self.view.bounds];
    [deleteCellView showDeleteView];
}

@end
