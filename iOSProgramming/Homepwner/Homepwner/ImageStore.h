//
//  ImageStore.h
//  Homepwner
//
//  Created by 关智豪 on 2020/6/17.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageStore : NSObject

+ (instancetype)shareStored;

- (void)setImage:(UIImage *)image forKey:(NSString *)key;

- (UIImage *)imageForKey:(NSString *)key;

- (void)deleteImageForKey:(NSString *)key;


@end

NS_ASSUME_NONNULL_END
