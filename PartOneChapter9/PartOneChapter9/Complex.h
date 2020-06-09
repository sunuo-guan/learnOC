//
//  Complex.h
//  PartOneChapter9
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Complex : NSObject

@property double real, imaginary;

- (void)print;
- (void)setReal:(double)a andImaginary:(double)b;
- (Complex *)add:(Complex *)f;

@end

NS_ASSUME_NONNULL_END
