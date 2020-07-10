//
//  commodityView.m
//  shopCar
//
//  Created by 关智豪 on 2020/7/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "commodityView.h"
#import <Masonry/Masonry.h>

@interface commodityView ()

@property (nonatomic, strong) UIImageView *commodityImage;
@property (nonatomic, strong) UILabel *commodityName;

@end

@implementation commodityView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.commodityImage];
        [self addSubview:self.commodityName];
        [self setupUI];
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)setupUI {
    [self.commodityImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom).offset(-15);
    }];
    [self.commodityName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.commodityImage.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

#pragma mark -- getter & setter
- (void)setCommodity:(GZHCommodityModel *)commodity {
    _commodity = commodity;
    self.commodityImage.image = [UIImage imageNamed:commodity.icon];
    self.commodityName.text = commodity.name;
}

- (UIImageView *)commodityImage {
    if (!_commodityImage) {
        _commodityImage = [[UIImageView alloc] init];
        _commodityImage.backgroundColor = [UIColor clearColor];
    }
    return _commodityImage;
}

- (UILabel *)commodityName {
    if (!_commodityName) {
        _commodityName = [[UILabel alloc] init];
        _commodityName.font = [UIFont systemFontOfSize:15.f];
        _commodityName.textAlignment = NSTextAlignmentCenter;
        _commodityName.backgroundColor = [UIColor clearColor];
    }
    return _commodityName;
}

@end
