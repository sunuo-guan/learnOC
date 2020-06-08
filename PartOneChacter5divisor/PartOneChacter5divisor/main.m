//
//  main.m
//  PartOneChacter5divisor
//
//  Created by 关智豪 on 2020/6/8.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

//最大公约数gcd算法
/*
 1.若v=0，结束，最大公约数是u
 2.计算temp=u%v，u=v，v=temp
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        unsigned int temp, u ,v;
        
        NSLog(@"input two unsigned integer");
        scanf("%u%u", &u, &v);
        
        while(v != 0){
            temp = u%v;
            u=v;
            v=temp;
        }
        
        NSLog(@"greatest commmon divisor is %u", u);
    }
    return 0;
}
