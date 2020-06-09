//
//  Fraction.m
//  PartOneChapter7
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

- (void) print
{
    NSLog(@"%i/%i", numerator, denominator);
}

- (double) convertToNum
{
    if(denominator != 0)
        return (double) numerator / denominator;
    else
        return NAN;
}

- (void) setNumerator:(int)n andDenominator:(int)d
{
    numerator = n;
    denominator = d;
}

- (Fraction *) add: (Fraction *) f
{
    Fraction *result = [[Fraction alloc]init];
    result.numerator=numerator * f.denominator + denominator * f.numerator;
    result.denominator=denominator * f.denominator;
    //在内部约减；
    [result reduce];
    return result;
}

- (void) reduce
{
    int u = numerator;
    int v = denominator;
    int temp;
    
    while(v!=0){
        temp = u % v;
        u = v;
        v = temp;
    }
    
    numerator /= u;
    denominator /= u;
}

@end
