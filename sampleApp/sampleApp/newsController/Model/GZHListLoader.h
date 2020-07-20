//
//  GZHListLoader.h
//  sampleApp
//
//  Created by 关智豪 on 2020/7/17.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GZHListItem;
NS_ASSUME_NONNULL_BEGIN

typedef void(^GZHListLoaderFinishBlock)(BOOL success, NSArray<GZHListItem *> *dataArray);

/// 列表请求
@interface GZHListLoader : NSObject

- (void)loadListDataWithFinishBlock:(GZHListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
