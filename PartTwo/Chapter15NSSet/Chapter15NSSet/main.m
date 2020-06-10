//
//  main.m
//  Chapter15NSSet
//
//  Created by 关智豪 on 2020/6/10.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

//使用分类，将print方法添加到NSSet

@interface NSSet (Printing)
- (void)print;
@end

@implementation NSSet (Printing)

- (void)print
{
    printf("{");
    for(NSNumber *element in self)
        printf(" %li ", (long) [element integerValue]);
    
    printf("} \n");
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //可变集合
        NSMutableSet *mutableSet = [NSMutableSet setWithObjects:@1,@3,@54,@12,@32, nil];
        NSSet *set1 =[NSSet setWithObjects:@2,@-4,@4,@122,@312, nil];
        NSSet *set2 = [NSSet setWithObjects:@-1,@32,@9,@93, nil];
        
        //输出
        [mutableSet print];
        [set1 print];
        
        //相等判断
        if([set1 isEqualToSet:set2]==true)
            NSLog(@"set1 = set2");
        else
            NSLog(@"set1 != set2");
        
        //成员测试
        if([set1 containsObject:@10]==true)
            NSLog(@"set1 contains 10");
        else
            NSLog(@"set1 does not contain 10");
        
        //可变集合的添加和删除
        [mutableSet addObject:@-3];
        [mutableSet removeObject:@32];
        [mutableSet removeObject:@1];
        [mutableSet print];
        
        //交集
        [set1 intersectsSet:set2];
        [set1 print];
        
        //并集(可变集可以，不可变集合不可)
        [mutableSet unionSet:set1];
        [mutableSet print];
        
    }
    return 0;
}
