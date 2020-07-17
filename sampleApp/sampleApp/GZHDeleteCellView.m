//
//  GZHDeleteCellView.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/16.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHDeleteCellView.h"

@interface GZHDeleteCellView ()

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIButton *deleteButton;

@end

@implementation GZHDeleteCellView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backgroundView];
        [self addSubview:self.deleteButton];
    }
    return self;
}

- (void)showDeleteView {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
//    [UIView animateWithDuration:1.f animations:^{
//        self.deleteButton.frame = CGRectMake(self.backgroundView.bounds.size.width / 2, self.backgroundView.bounds.size.height / 2, 50, 50);
//    }];
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake(self.backgroundView.bounds.size.width / 2, self.backgroundView.bounds.size.height / 2, 50, 50);
    } completion:^(BOOL finished) {
        NSLog(@"finish");
    }];
}

- (void)dismissDeleteView {
    [self removeFromSuperview];
}

- (void)_clickButton {
    [self removeFromSuperview];
}

- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = 0.5;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
        [_backgroundView addGestureRecognizer:gesture];
    }
    return _backgroundView;
}

- (UIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        _deleteButton.backgroundColor = [UIColor blueColor];
        [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

@end
