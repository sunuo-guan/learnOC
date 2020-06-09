//
//  main.m
//  Chapter11fenlei
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Fraction (MathOps)

- (Fraction *)add:(Fraction *) f;
- (Fraction *)sub:(Fraction *) f;
- (Fraction *)mul:(Fraction *) f;
- (Fraction *)div:(Fraction *) f;

@end

@implementation Fraction (MathOps)

- (Fraction *)add:(Fraction *) f
{
    Fraction *result = [[Fraction alloc]init];
    
    result.numerator=self.numerator*f.denominator+self.denominator*f.numerator;
    result.denominator=self.denominator*f.denominator;
    [result reduce];
    return result;
}

- (Fraction *)sub:(Fraction *)f
{
    Fraction *result = [[Fraction alloc]init];
    
    result.numerator=self.numerator*f.denominator-self.denominator*f.numerator;
    result.denominator=self.denominator*f.denominator;
    [result reduce];
    return result;
}

- (Fraction *)mul:(Fraction *) f
{
    Fraction *result = [[Fraction alloc]init];
    
    result.numerator=self.numerator*f.numerator;
    result.denominator=self.denominator*f.denominator;
    [result reduce];
    return result;
}

- (Fraction *)div:(Fraction *) f
{
    Fraction *result = [[Fraction alloc]init];
    
    result.numerator=self.numerator*f.denominator;
    result.denominator=self.denominator*f.numerator;
    [result reduce];
    return result;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Fraction *f1 = [[Fraction alloc]init];
        Fraction *f2 = [[Fraction alloc]init];
        Fraction *result;
        
        [f1 setNumerator:3 andDenominator:8];
        [f2 setNumerator:7 andDenominator:12];
        
        result = [f1 add:f2];
        [result print];
        
        result = [f1 sub:f2];
        [result print];
        
        result = [f1 mul:f2];
        [result print];
        
        result = [f1 div:f2];
        [result print];
    }
    return 0;
}
