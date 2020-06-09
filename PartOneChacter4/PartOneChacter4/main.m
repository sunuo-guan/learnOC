//
//  main.m
//  PartOneChacter4
//
//  Created by 关智豪 on 2020/6/8.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

//实现Calculator类

@interface Calculator : NSObject

//累加方法
- (void) setAccumulator: (double) value;
- (void) clear;
- (double) getAccumulator;

//算术方法
- (void) add: (double) value;
- (void) subtract: (double) value;
- (void) multiply: (double) value;
- (void) divide: (double) value;

@end

@implementation Calculator
{
    double accumulator;
}

- (void) setAccumulator:(double)value
{
    accumulator = value;
}

- (void) clear
{
    accumulator = 0;
}

- (double) getAccumulator
{
    return accumulator;
}

- (void) add:(double)value
{
    accumulator += value;
}

- (void) subtract:(double)value
{
    accumulator -= value;
}

- (void) multiply:(double)value
{
    accumulator *= value;
}

- (void) divide:(double)value
{
    accumulator /= value;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Calculator *myCalculator = [[Calculator alloc] init];
        
        [myCalculator setAccumulator: 100.00];
        [myCalculator add:200.0];
        [myCalculator divide:15.0];
        [myCalculator subtract:10.0];
        [myCalculator multiply:5];
        NSLog(@"result: %g",[myCalculator getAccumulator]);
        
        
        //switch测试
        double val1,val2;
        char operator;
        Calculator *myTest = [[Calculator alloc] init];
        
        NSLog(@"input the expression");
        scanf("%lf %c %lf", &val1, &operator, &val2);
        
        [myTest setAccumulator: val1];
        
        switch (operator) {
            case '+':
                [myTest add: val2];
                break;
            case '-':
                [myTest subtract: val2];
                break;
            case '*':
                [myTest multiply: val2];
                break;
            case '/':
                if(val2==0)
                    NSLog(@"cannnot divide");
                else
                    [myTest divide: val2];
                break;
            default:
                break;
        }
        
        NSLog(@"%.2f", [myTest getAccumulator]);
    }
    return 0;
}
