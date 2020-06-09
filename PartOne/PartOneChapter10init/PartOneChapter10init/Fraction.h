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

@property int numerator, denominator;

- (Fraction *)initWith:(int)n over:(int)d;
- (void) print;
- (double) convertToNum;
- (void) setNumerator:(int) n andDenominator:(int) d;
- (Fraction *) add: (Fraction *) f;
- (void) reduce;

@end

NS_ASSUME_NONNULL_END
