//
//  main.m
//  Chapter15NSString
//
//  Created by 关智豪 on 2020/6/10.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

//字符串操作

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str1 = @"This is string a";
        NSString *str2 = @"This is string b";
        NSString *res;
        NSComparisonResult compareResult;
        
        //长度
        NSLog(@"Length of str1 is %lu", [str1 length]);
        
        //复制，类方法
        res = [NSString stringWithString:str1];
        NSLog(@"%@", res);
        
        //字符串拼接
        str2 = [str1 stringByAppendingString:str2];
        NSLog(@"%@", str2);
        
        //判断两字符串是否相等
        if([str1 isEqualToString:res] == true)
            NSLog(@"str1 == res");
        else
            NSLog(@"str2 != res");
        
        //验证字符串是否小于等于大于另外的字符串
        compareResult = [str1 compare:str2];
        
        if(compareResult == NSOrderedSame)
            NSLog(@"str1 == str2");
        else if(compareResult == NSOrderedAscending)
            NSLog(@"str1 < str2");
        else
            NSLog(@"str1 > str2");
        
        //将字符串转换为大写
        NSLog(@"%@", [str1 uppercaseString]);
        
        //转化为小写
        NSLog(@"%@", [str2 lowercaseString]);
        
        //提取前n个字符
        NSLog(@"%@", [str1 substringToIndex:3]);
        
        //提取从第n个到最后的字符
        NSLog(@"%@", [str1 substringFromIndex:8]);
        
        //提取范围：从n个开始提取长度为l
        NSLog(@"%@", [str2 substringWithRange:NSMakeRange(4, 8)]);
        
        //NSRange:一个结构变量，上面提取范围也用到，.location是起始位置，.length是长度，若不存在，则.location=NSNotFound
        NSRange subRange;
        
        //一个字符串中查找字符串
        subRange = [str1 rangeOfString:@"this"];
        if(subRange.location == NSNotFound)
            NSLog(@"not found");
        else
            NSLog(@"start in %lu, length is %lu", (unsigned long)subRange.location, (unsigned long)subRange.length);
        
    }
    return 0;
}
