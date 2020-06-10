//
//  main.m
//  Chapter16NSURL
//
//  Created by 关智豪 on 2020/6/10.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSURL *myURL = [NSURL URLWithString:@"https://www.google.com"];
        NSString *homePage = [NSString stringWithContentsOfURL:myURL encoding:NSASCIIStringEncoding error:NULL];
        NSLog(@"%@",homePage);
    }
    return 0;
}
