//
//  main.m
//  Chapter15NSNumber
//
//  Created by 关智豪 on 2020/6/10.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber *myNumber, *floatNumber, *intNumber, *testNumber;
        NSInteger myInt;
        
        //创建并初始化：numberWithxxx
        //初始化：initWithxxx
        //检索实例值方法：xxxValue
        /*
         numberWithInteger与numberWithInt：
         numberWithInteger使用%i作为格式化字符串显示
         numberWithInt使用%li作为格式化字符串显示
         */
        testNumber = [[NSNumber alloc] initWithInt:20];
        NSLog(@"%i",[testNumber intValue]);
        
        intNumber = [NSNumber numberWithInteger:100];
        myInt = [intNumber integerValue];
        NSLog(@"%li", myInt);
        
        myNumber = [NSNumber numberWithLong:0xabcdef];
        NSLog(@"%lx", [myNumber longValue]);
        
        myNumber = [NSNumber numberWithChar:'X'];
        NSLog(@"%c", [myNumber charValue]);
        
        floatNumber = [NSNumber numberWithFloat:100.00];
        NSLog(@"%g", [floatNumber floatValue]);
        
        myNumber = [NSNumber numberWithDouble:12345e+15];
        NSLog(@"%lg", [myNumber doubleValue]);
        
        NSLog(@"%li", (long)[myNumber integerValue]);
        
        if([intNumber isEqualToNumber:floatNumber]==YES)
            NSLog(@"equal");
        else
            NSLog(@"not equal");
        
        if([intNumber compare:myNumber]==NSOrderedAscending)
            NSLog(@"first less than second");
        
        //@用法尝试
        NSNumber *testNum;
        testNum = @230;
        NSLog(@"%i", [testNum intValue]);
    }
    return 0;
}
