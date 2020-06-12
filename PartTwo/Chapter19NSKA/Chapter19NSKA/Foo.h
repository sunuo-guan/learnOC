//
//  Foo.h
//  Chapter19NSKA
//
//  Created by 关智豪 on 2020/6/11.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//协议NSCoding
@interface Foo : NSObject <NSCoding>

@property (copy, nonatomic) NSString *strVal;
@property int intVal;
@property float floatVal;

@end

NS_ASSUME_NONNULL_END
