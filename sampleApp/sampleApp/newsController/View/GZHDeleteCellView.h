//
//  GZHDeleteCellView.h
//  sampleApp
//
//  Created by 关智豪 on 2020/7/16.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GZHDeleteCellView : UIView

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock;

@end

NS_ASSUME_NONNULL_END
