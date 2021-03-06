//
//  mainView.m
//  shopCar
//
//  Created by 关智豪 on 2020/7/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "mainView.h"
#import <Masonry/Masonry.h>
#import "commodityView.h"
#import "GZHCommodityModel.h"

@interface mainView ()

@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *delButton;
@property (nonatomic, strong) UIView *displayView;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation mainView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.displayView];
        [self addSubview:self.addButton];
        [self addSubview:self.delButton];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 50));
        make.top.equalTo(self.mas_top).offset(100);
        make.left.equalTo(self.mas_left).offset(20);
    }];
    [self.delButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 50));
        make.top.equalTo(self.addButton.mas_top);
        make.right.equalTo(self.mas_right).offset(-20);
    }];
    [self.displayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addButton.mas_bottom).offset(30);
        make.left.equalTo(self.addButton.mas_left);
        make.right.equalTo(self.delButton.mas_right);
        make.bottom.equalTo(self.mas_bottom).offset(-30);
    }];
}

#pragma mark -- actions
- (void)addCommodity {
    CGFloat commodityWidth = 100.f;
    CGFloat commodityHeight = 150.f;
    CGFloat gapWidth = 10.f;
    CGFloat dispalyViewWidth = [UIScreen mainScreen].bounds.size.width - 40;
    CGFloat dispalyViewHeight = [UIScreen mainScreen].bounds.size.height - 30 - 100 - 30 - 50;
    NSInteger columns = floor(dispalyViewWidth / (commodityWidth + gapWidth));
    NSInteger rows = floor(dispalyViewHeight / (commodityHeight + gapWidth));
    
    commodityView *lastCommodityView = self.displayView.subviews.lastObject;
    commodityView *newCommodityView = [[commodityView alloc] init];
    [self.displayView addSubview:newCommodityView];
    NSInteger index = self.displayView.subviews.count;
    NSInteger random = arc4random() % 6;
    GZHCommodityModel *commodity = self.dataArr[random];
    [newCommodityView setCommodity:commodity];
    if (index % columns == 1) {
        [newCommodityView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(commodityWidth, commodityHeight));
            make.left.equalTo(self.displayView.mas_left);
            make.top.equalTo(self.displayView.mas_top).offset((commodityHeight + gapWidth) * (index / columns));
        }];
    } else {
        [newCommodityView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(commodityWidth, commodityHeight));
            make.left.equalTo(lastCommodityView.mas_right).offset(gapWidth);
            make.top.equalTo(lastCommodityView.mas_top);
        }];
    }
    
    if (index == columns * rows) {
        self.addButton.enabled = NO;
    }
    self.delButton.enabled = YES;
}

- (void)deleteCommodity {
    commodityView *lastCommodity = self.displayView.subviews.lastObject;
    [lastCommodity removeFromSuperview];
    if (self.displayView.subviews.count == 0) {
        self.delButton.enabled = NO;
    }
    self.addButton.enabled = YES;
}

#pragma mark -- getter & setter
- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addButton setTitle:@"添加商品" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_addButton setBackgroundColor:[UIColor orangeColor]];
        _addButton.enabled = YES;
        [_addButton addTarget:self action:@selector(addCommodity) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}

- (UIButton *)delButton {
    if (!_delButton) {
        _delButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_delButton setTitle:@"删除商品" forState:UIControlStateNormal];
        [_delButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_delButton setBackgroundColor:[UIColor orangeColor]];
        _delButton.enabled = NO;
        //监听按钮的点击事件
        [_delButton addTarget:self action:@selector(deleteCommodity) forControlEvents:UIControlEventTouchUpInside];
    }
    return _delButton;
}

- (UIView *)displayView {
    if (!_displayView) {
        _displayView = [[UIView alloc] init];
        _displayView.backgroundColor = [UIColor yellowColor];
    }
    return _displayView;
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"commodityResource.plist" ofType:nil];
        _dataArr = [NSArray arrayWithContentsOfFile:dataPath];
        NSMutableArray *modelArr = [NSMutableArray array];
        for (NSDictionary *dict in _dataArr) {
            GZHCommodityModel *commodity = [GZHCommodityModel shopWithDictionary:dict];
            [modelArr addObject:commodity];
        }
        _dataArr = modelArr;
    }
    return _dataArr;
}

@end
