//
//  main.m
//  PartOneChacter5Scanf
//
//  Created by 关智豪 on 2020/6/8.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int number, trianglarNumber;
        
        NSLog(@"input the integer");
        scanf("%i", &number);
        
        trianglarNumber = 0;
        
        for(int i = 1; i <= number; i++)
            trianglarNumber +=i;
        
        NSLog(@"Trianglar number of %i is %i", number, trianglarNumber);
        
    }
    return 0;
}
