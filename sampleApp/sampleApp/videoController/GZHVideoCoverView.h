//
//  GZHVideoCoverView.h
//  sampleApp
//
//  Created by 关智豪 on 2020/7/21.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GZHVideoCoverView : UICollectionViewCell

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl VideoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
