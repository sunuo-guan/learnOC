//
//  main.m
//  Chapter18Copy
//
//  Created by 关智豪 on 2020/6/11.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@"one",@"two",@"three",@"four",nil];
        NSMutableArray *arr2;
        
        //简单赋值
        arr2 = arr1;
        [arr2 removeObjectAtIndex:0];
        
        NSLog(@"dataArr1:");
        for(NSString *elem in arr1)
            NSLog(@" %@", elem);
        
        NSLog(@"dataArr2:");
        for(NSString *elem in arr2)
            NSLog(@" %@", elem);
        
        //拷贝，然后再修改
        arr2 = [arr1 mutableCopy];
        [arr2 removeObjectAtIndex:0];
        
        NSLog(@"dataArr1:");
        for(NSString *elem in arr1)
            NSLog(@" %@", elem);
        
        NSLog(@"dataArr2:");
        for(NSString *elem in arr2)
            NSLog(@" %@", elem);
        
        //数组使用可变字符串进行测试
        NSMutableArray *arr3 = [NSMutableArray arrayWithObjects:
                                [NSMutableString stringWithString:@"one"],
                                [NSMutableString stringWithString:@"two"],
                                [NSMutableString stringWithString:@"three"],
                                [NSMutableString stringWithString:@"four"],
                                nil
                                ];
        NSMutableArray *arr4;
        NSMutableString *mStr;
        
        //复制，并修改第一个元素
        arr4 = [arr3 mutableCopy];
        
        mStr = arr3[0];
        [mStr appendString:@"ONE"];
        
        NSLog(@"dataArr3:");
        for(NSString *elem in arr3)
            NSLog(@" %@", elem);
        
        NSLog(@"dataArr4:");
        for(NSString *elem in arr4)
            NSLog(@" %@", elem);
        
        //尝试新建一个字符串再修改
        mStr = [NSMutableString stringWithString:arr4[0]];
        [mStr appendString:@"Two"];
        //改变了arr4的指针的指向对象，而mStr也指向此对象
        [arr4 replaceObjectAtIndex:0 withObject:mStr];
        
        NSLog(@"dataArr3:");
        for(NSString *elem in arr3)
            NSLog(@" %@", elem);
        
        NSLog(@"dataArr4:");
        for(NSString *elem in arr4)
            NSLog(@" %@", elem);
        
        
        //测试NSNumber，
        NSMutableArray *arr5 = [NSMutableArray arrayWithObjects:@1,@2,@3,@4,nil];
        NSMutableArray *arr6;
        
        arr6 = [arr5 mutableCopy];
        arr6[0] = @5;
        
        NSLog(@"dataArr5:");
        NSLog(@" %@", arr5[0]);
        
        NSLog(@"dataArr6:");
        NSLog(@" %@", arr6[0]);

    }
    return 0;
}
