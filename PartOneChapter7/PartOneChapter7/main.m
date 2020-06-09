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
        
        [myFraction setNumberator: 1];
        [myFraction setDenominator: 3];
        
        NSLog(@"The value of fraction is: %i/%i, equals to %g", [myFraction getNumberator], [myFraction getDenominator], [myFraction convertToNum]);
    }
    return 0;
}
