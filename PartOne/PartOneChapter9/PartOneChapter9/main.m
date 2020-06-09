//
//  main.m
//  PartOneChapter9
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Complex.h"
#import "Fraction.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Complex *c1 = [[Complex alloc]init];
        Complex *c2 = [[Complex alloc]init];
        Complex *resultCom;
        
        Fraction *f1 = [[Fraction alloc]init];
        Fraction *f2 = [[Fraction alloc]init];
        Fraction *resultFra;
        
        [c1 setReal:3.2 andImaginary:4.3];
        [c2 setReal:4.5 andImaginary:2.5];
        resultCom = [c1 add:c2];
        [resultCom print];
        
        [f1 setNumerator:3 andDenominator:4];
        [f2 setNumerator:5 andDenominator:8];
        resultFra = [f1 add:f2];
        [resultFra print];
        
        //test id类型
        id dataValue;
        dataValue = resultFra;
        [dataValue print];
        
        dataValue = resultCom;
        [dataValue print];
        
    }
    return 0;
}
