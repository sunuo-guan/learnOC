//
//  main.m
//  Chapter15Dictionary
//
//  Created by 关智豪 on 2020/6/10.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //可变词典
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"zhao"] = @"赵";
        dict[@"qian"] = @"钱";
        dict[@"sun"] = @"孙";
        dict[@"li"] = @"李";
        NSLog(@"li = %@", dict[@"li"]);
        
        //不可变词典
        NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"赵",@"zhao",@"钱",@"qian",@"孙",@"sun",@"李",@"li",nil];
        
        for (NSString *key in dict2) 
            NSLog(@"%@: %@", key, dict2[key]);
        
    }
    return 0;
}
