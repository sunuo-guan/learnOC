//
//  GZHNormalTableViewCell.h
//  sampleApp
//
//  Created by 关智豪 on 2020/7/15.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GZHListItem;

@protocol GZHNormalTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface GZHNormalTableViewCell : UITableViewCell

@property (nonatomic, weak) id<GZHNormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCellWithItem:(GZHListItem *)item;

@end

NS_ASSUME_NONNULL_END
