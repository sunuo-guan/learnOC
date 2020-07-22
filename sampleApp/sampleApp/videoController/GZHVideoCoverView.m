//
//  GZHVideoCoverView.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/21.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHVideoCoverView.h"
#import <Masonry/Masonry.h>

@interface GZHVideoCoverView()

@property (nonatomic, strong) UIImageView *coverView;
@property (nonatomic, strong) UIImageView *playButton;

@end

@implementation GZHVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.coverView];
        [self addSubview:self.playButton];
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:recognizer];
    }
    return self;
}

- (void)setupUI {
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
}

- (void)_tapToPlay {
    
}

- (UIImageView *)coverView {
    if (!_coverView) {
        _coverView = [[UIImageView alloc] init];
    }
    return _coverView;
}

- (UIImageView *)playButton {
    if (!_playButton) {
        _playButton = [[UIImageView alloc] init];
        _playButton.image = [UIImage imageNamed:@""];
    }
    return _playButton;
}
@end
