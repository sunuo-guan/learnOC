//
//  GZHNormalTableViewCell.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/15.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHNormalTableViewCell.h"
#import <Masonry/Masonry.h>

@interface GZHNormalTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *sourceLabel;
@property (nonatomic, strong) UILabel *commandLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation GZHNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.sourceLabel];
        [self addSubview:self.commandLabel];
        [self addSubview:self.timeLabel];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 50));
        make.left.equalTo(self.mas_left).offset(20);
        make.top.equalTo(self.mas_top).offset(15);
    }];
    [self.sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.size.mas_equalTo(CGSizeMake(50, 20));
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
    }];
    [self.commandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.size.mas_equalTo(CGSizeMake(50, 20));
        make.left.equalTo(self.sourceLabel.mas_right).offset(10);
        make.top.equalTo(self.sourceLabel.mas_top);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.size.mas_equalTo(CGSizeMake(50, 20));
        make.left.equalTo(self.commandLabel.mas_right).offset(10);
        make.top.equalTo(self.commandLabel.mas_top);
    }];
}

//传入model，根据model的数据调整布局
- (void)layoutTableViewCell {
    self.titleLabel.text = @"《Objective-C 高级编程》干货三部曲（一）：引用计数篇";
    self.sourceLabel.text = @"掘金";
    self.commandLabel.text = @"阅读 5162";
    self.timeLabel.text = @"2017年04月10日";
    
    //自动布局情况下sizeToFit麻烦了，特定情况下可以使用
//    self.sourceLabel.text = @"掘金";
//    [self.sourceLabel sizeToFit];
//    [self.sourceLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(self.sourceLabel.frame.size.width, 20));
//    }];
//    self.commandLabel.text = @"阅读 5162";
//    [self.commandLabel sizeToFit];
//    [self.commandLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(self.commandLabel.frame.size.width, 20));
//    }];
//    self.timeLabel.text = @"2017年04月10日";
//    [self.timeLabel sizeToFit];
//    [self.timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(self.timeLabel.frame.size.width, 20));
//    }];
}

#pragma mark -- getter & setter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)sourceLabel {
    if (!_sourceLabel) {
        _sourceLabel = [[UILabel alloc] init];
        _sourceLabel.backgroundColor = [UIColor redColor];
        _sourceLabel.font = [UIFont systemFontOfSize:12];
        _sourceLabel.textColor = [UIColor blackColor];
    }
    return _sourceLabel;
}

- (UILabel *)commandLabel {
    if (!_commandLabel) {
        _commandLabel = [[UILabel alloc] init];
        _commandLabel.backgroundColor = [UIColor redColor];
        _commandLabel.font = [UIFont systemFontOfSize:12];
        _commandLabel.textColor = [UIColor blackColor];
    }
    return _commandLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.backgroundColor = [UIColor redColor];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor blackColor];
    }
    return _timeLabel;
}

@end
