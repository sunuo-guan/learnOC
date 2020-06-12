//
//  main.m
//  RandomItems
//
//  Created by 关智豪 on 2020/6/11.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc]init];
        
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        [items insertObject:@"Zero" atIndex:0];
        
        //快速枚举
        for(NSString *item in items)
            NSLog(@"%@",item);
        
    }
    return 0;
}
