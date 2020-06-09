//
//  main.m
//  PartOneChapter10init
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Fraction *f1 = [[Fraction alloc] initWith:3 over:5];
        Fraction *f2 = [[Fraction alloc] initWith:7 over:15];
        
        [f1 print];
        [f2 print];
        
    }
    return 0;
}
