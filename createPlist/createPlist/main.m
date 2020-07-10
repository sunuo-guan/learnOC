//
//  main.m
//  createPlist
//
//  Created by 关智豪 on 2020/7/10.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray *arr = @[
            @{@"name":@"单肩包",@"icon":@"danjianbao"},
            @{@"name":@"钱包",@"icon":@"qianbao"},
            @{@"name":@"链条包",@"icon":@"liantiaobao"},
            @{@"name":@"手提包",@"icon":@"shoutibao"},
            @{@"name":@"双肩包",@"icon":@"shuangjianbao"},
            @{@"name":@"斜挎包",@"icon":@"xiekuabao"},
        ];
        BOOL flag = [arr writeToFile:@"/Users/guanzhihao/Desktop/ios/commodityResource.plist" atomically:YES];
        if (flag) {
            NSLog(@"Hello, World!");
        }
    }
    return 0;
}
