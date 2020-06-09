//
//  Fraction.h
//  PartOneChapter7
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Fraction : NSObject

- (void) print;
- (void) setNumberator: (int) n;
- (void) setDenominator: (int) d;
- (int) getNumberator;
- (int) getDenominator;
- (double) convertToNum;

@end

NS_ASSUME_NONNULL_END
