//
//  mainView.m
//  shopCar
//
//  Created by 关智豪 on 2020/7/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "mainView.h"
#import <Masonry/Masonry.h>

@interface mainView ()

@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *delButton;
@property (nonatomic, strong) UIView *displayView;

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
        //make.size.mas_equalTo(CGSizeMake(50, 50));
        make.top.equalTo(self.mas_top).offset(100);
        make.left.equalTo(self.mas_left).offset(20);
    }];
    [self.delButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.size.mas_equalTo(CGSizeMake(50, 50));
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

#pragma mark -- getter & setter
- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addButton setTitle:@"添加商品" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_addButton setBackgroundColor:[UIColor orangeColor]];
    }
    return _addButton;
}

- (UIButton *)delButton {
    if (!_delButton) {
        _delButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_delButton setTitle:@"删除商品" forState:UIControlStateNormal];
        [_delButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_delButton setBackgroundColor:[UIColor orangeColor]];
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

@end
