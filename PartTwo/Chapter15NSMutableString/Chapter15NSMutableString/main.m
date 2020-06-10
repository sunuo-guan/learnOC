//
//  main.m
//  Chapter15NSMutableString
//
//  Created by 关智豪 on 2020/6/10.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //可变字符串类
        NSString *str1 = @"This is str1";
        NSString *search, *replace;
        NSMutableString *mstr;
        NSRange subRange;
        
        //创造，复制过来
        mstr = [NSMutableString stringWithString:str1];
        
        //插入字符
        [mstr insertString: @" mutable" atIndex:[mstr length]];
        NSLog(@"%@", mstr);
        
        //直接末尾拼接
        [mstr appendString:@" and str2"];
        NSLog(@"%@", mstr);
        
        //删除范围的字符串
        [mstr deleteCharactersInRange:NSMakeRange(15, 5)];
        NSLog(@"%@", mstr);
        
        //查找
        subRange = [mstr rangeOfString:@" str1"];
        if(subRange.location ==NSNotFound)
            NSLog(@"not found");
        else
            NSLog(@"begin in %lu, length is %lu", subRange.location, subRange.length);
        
        //可以直接设置可变字符串内容
        [mstr setString:@"This is mutable str"];
        
        //替换字符
        [mstr replaceCharactersInRange:NSMakeRange(8, 7) withString:@"new mutable"];
        NSLog(@"%@", mstr);
        
        //查找和替换
        search = @"This is";
        replace = @"An example of";
        
        subRange = [mstr rangeOfString:search];
        if(subRange.location != NSNotFound){
            [mstr replaceCharactersInRange:subRange withString:replace];
            NSLog(@"%@", mstr);
        }
        
        //查找和替换所有
        search = @"a";
        replace = @"X";
        subRange = [mstr rangeOfString:search];
        [mstr replaceOccurrencesOfString:search
                              withString:replace
                                 options:nil
                                   range:NSMakeRange(0, [mstr length])];
        NSLog(@"%@", mstr);
    }
    return 0;
}
