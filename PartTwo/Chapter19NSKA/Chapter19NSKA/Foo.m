//
//  Foo.m
//  Chapter19NSKA
//
//  Created by 关智豪 on 2020/6/11.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "Foo.h"

@implementation Foo

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_strVal forKey:@"FoostrVal"];
    [coder encodeInt:_intVal forKey:@"FoointVal"];
    [coder encodeFloat:_floatVal forKey:@"FoofloatVal"];
}

- (id)initWithCoder:(NSCoder *)coder
{
    _strVal = [coder decodeObjectForKey:@"FoostrVal"];
    _intVal = [coder decodeIntForKey:@"FoointVal"];
    _floatVal = [coder decodeFloatForKey:@"FoofloatVal"];
    
    return self;
}

@end
