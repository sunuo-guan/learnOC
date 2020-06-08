//
//  main.m
//  PartOneChapter3
//
//  Created by 关智豪 on 2020/6/8.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

- (void) print;
- (void) setNumberator: (int) n;
- (void) setDenominator: (int) d;
- (int) getNumberator;
- (int) getDenominator;

@end

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

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Fraction *myFraction;
        
        //myFraction = [Fraction alloc];
        //myFraction = [myFraction init];
        Fraction *myFraction = [[Fraction alloc] init];
        
        [myFraction setNumberator: 1];
        [myFraction setDenominator: 3];
        
        NSLog(@"The value of fraction is: %i/%i", [myFraction getNumberator], [myFraction getDenominator]);
        //[myFraction print];
    }
    return 0;
}
