//
//  main.m
//  PartOneChapter7
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Fraction *myFraction = [[Fraction alloc] init];
        
        [myFraction setNumerator:1];
        [myFraction setDenominator:3];
        
        NSLog(@"The value of fraction is: %i/%i, equals to %g", [myFraction numerator], [myFraction denominator], [myFraction convertToNum]);
        
        
        //test add
        Fraction *firstFraction = [[Fraction alloc] init];
        Fraction *secondFraction = [[Fraction alloc] init];
        
        [firstFraction setNumerator:1 andDenominator:4];
        [secondFraction setNumerator:1 andDenominator:3];
        
        [firstFraction add:secondFraction];
        
        NSLog(@"The value of fraction is: %i/%i, equals to %g", [firstFraction numerator], [firstFraction denominator], [firstFraction convertToNum]);
    }
    return 0;
}
