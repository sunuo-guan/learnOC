//
//  Fraction.m
//  PartOneChapter7
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

{
    int numberator;
    int denominator;
}

- (void) print
{
    NSLog(@"%i/%i", numberator, denominator);
}

- (void) setNumberator: (int) n
{
    numberator = n;
}

- (void) setDenominator: (int) d
{
    denominator = d;
}

- (int) getNumberator
{
    return numberator;
}

- (int) getDenominator
{
    return denominator;
}

- (double) convertToNum
{
    if(denominator != 0)
        return (double) numberator / denominator;
    else
        return NAN;
}

@end
