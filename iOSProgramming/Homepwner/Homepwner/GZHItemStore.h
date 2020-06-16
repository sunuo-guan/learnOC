//
//  GZHItemStore.h
//  Homepwner
//
//  Created by 关智豪 on 2020/6/16.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

NS_ASSUME_NONNULL_BEGIN

@interface GZHItemStore : NSObject

+ (instancetype)sharedStore;

@property (nonatomic, readonly)NSArray *allItems;

- (BNRItem *)createItem;

- (void)removeItem:(BNRItem *)item;

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end

NS_ASSUME_NONNULL_END
