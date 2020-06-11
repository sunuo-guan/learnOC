//
//  main.m
//  Chapter19NSKA
//
//  Created by 关智豪 on 2020/6/11.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Foo *foo1 = [[Foo alloc]init];
        Foo *foo2;
        
        foo1.strVal = @"test foo1";
        foo1.intVal = 100;
        foo1.floatVal = 20.00;
        
        [NSKeyedArchiver archiveRootObject:foo1 toFile:@"foo.arch"];
        
        foo2 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"foo.arch"];
        NSLog(@"%@,%i,%g",foo2.strVal,foo2.intVal,foo2.floatVal);
        
    }
    return 0;
}
