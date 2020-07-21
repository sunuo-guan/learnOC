//
//  GZHNormalTableViewCell.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/15.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHNormalTableViewCell.h"
#import "GZHListItem.h"
#import <Masonry/Masonry.h>

@interface GZHNormalTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *sourceLabel;
@property (nonatomic, strong) UILabel *commandLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, strong) UIButton *buttonItem;

@end

@implementation GZHNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.sourceLabel];
        [self addSubview:self.commandLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.rightImageView];
        [self addSubview:self.buttonItem];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(250, 50));
        make.left.equalTo(self.mas_left).offset(20);
        make.top.equalTo(self.mas_top).offset(15);
    }];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 70));
        make.top.equalTo(self.titleLabel);
        make.right.equalTo(self.mas_right).offset(-20);
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
    [self.buttonItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
        make.bottom.equalTo(self.sourceLabel.mas_bottom);
        make.right.equalTo(self.rightImageView.mas_left).offset(-10);
    }];
}

//传入model，根据model的数据调整布局
- (void)layoutTableViewCellWithItem:(GZHListItem *)item {
    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniqueKey];
    if (hasRead) {
        self.titleLabel.textColor = [UIColor lightGrayColor];
    } else {
        self.titleLabel.textColor = [UIColor blackColor];
    }
    self.titleLabel.text = item.title;
    self.sourceLabel.text = item.authorName;
    self.commandLabel.text = item.category;
    self.timeLabel.text = item.date;
    
    
//    NSThread *downloadImageThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        self.rightImageView.image = image;
//    }];
//    downloadImageThread.name = @"downloadImageThread";
//    [downloadImageThread start];
    
    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
    
    //dispatch_async异步
    dispatch_async(downloadQueue, ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
        dispatch_async(mainQueue, ^{
            self.rightImageView.image = image;
        });
    });
    
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

- (void)delectButtonClick {
    //respondsToSelector:用来判断某一个方法是否有实现
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.buttonItem];
    }
}

#pragma mark -- getter & setter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 2;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLabel;
}

- (UILabel *)sourceLabel {
    if (!_sourceLabel) {
        _sourceLabel = [[UILabel alloc] init];
        _sourceLabel.backgroundColor = [UIColor clearColor];
        _sourceLabel.font = [UIFont systemFontOfSize:12];
        _sourceLabel.textColor = [UIColor blackColor];
    }
    return _sourceLabel;
}

- (UILabel *)commandLabel {
    if (!_commandLabel) {
        _commandLabel = [[UILabel alloc] init];
        _commandLabel.backgroundColor = [UIColor clearColor];
        _commandLabel.font = [UIFont systemFontOfSize:12];
        _commandLabel.textColor = [UIColor blackColor];
    }
    return _commandLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor blackColor];
    }
    return _timeLabel;
}

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] init];
        _rightImageView.backgroundColor = [UIColor clearColor];
        _rightImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _rightImageView;
}

- (UIButton *)buttonItem {
    if (!_buttonItem) {
        _buttonItem = [[UIButton alloc] init];
        [_buttonItem setTitle:@"x" forState:UIControlStateNormal];
        [_buttonItem setTitle:@"v" forState:UIControlStateHighlighted];
        [_buttonItem addTarget:self action:@selector(delectButtonClick) forControlEvents:UIControlEventTouchUpInside];
        //_buttonItem.backgroundColor = [UIColor purpleColor];
        _buttonItem.layer.cornerRadius = 10;
        //masksToBoinds属性为YES时候，其作用是剪去子图层（UIImage）超出主图层（CALayer）的部分
        _buttonItem.layer.masksToBounds = YES;
        _buttonItem.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _buttonItem.layer.borderWidth = 1;
    }
    return _buttonItem;
}

@end
