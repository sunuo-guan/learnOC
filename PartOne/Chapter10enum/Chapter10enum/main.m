//
//  main.m
//  Chapter10enum
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

//枚举类型的使用
//打印每月天数

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        enum month {jan=1, feb, march, april, may, june, july, aug, sept, oct, nov, dec};
        enum month inputMonth;
        int days;
        
        NSLog(@"input the month");
        scanf("%i",&inputMonth);
        
        switch(inputMonth){
            case jan:
            case march:
            case may:
            case july:
            case aug:
            case oct:
            case dec:
                days=31;
                break;
            case april:
            case june:
            case sept:
            case nov:
                days=30;
                break;
            case feb:
                days=28;
                break;
            default:
                NSLog(@"wrong month input");
                days=0;
                break;
        }
        
        if(days!=0)
            NSLog(@"number of days is %i", days);
        
        if(inputMonth ==feb)
            NSLog(@" or 29");
    }
    return 0;
}
