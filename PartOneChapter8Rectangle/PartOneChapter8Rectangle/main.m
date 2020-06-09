//
//  main.m
//  PartOneChapter8Rectangle
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "XYPoint.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Rectangle *testRect = [[Rectangle alloc] init];
        XYPoint *testPoint = [[XYPoint alloc] init];
        
        [testPoint setX:100 andY:200];
        
        [testRect setWidth:5 andHeight:8];
        testRect.origin = testPoint;
        
        NSLog(@"Rectangle w = %i, h = %i", testRect.width, testRect.height);
        NSLog(@"Origin at (%i, %i)", testRect.origin.x, testRect.origin.y);
        NSLog(@"Area = %i, Perimeter = %i", [testRect area], [testRect perimeter]);
    }
    return 0;
}
