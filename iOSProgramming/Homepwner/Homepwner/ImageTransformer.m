//
//  ImageTransformer.m
//  Homepwner
//
//  Created by 关智豪 on 2020/6/22.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "ImageTransformer.h"

@implementation ImageTransformer

+ (Class)transformedValueClass
{
    return [NSData class];
}

- (id)transformedValue:(id)value
{
    if(!value) {
        return nil;
    }
    if([value isKindOfClass:[NSData class]]) {
        return value;
    }
    return UIImagePNGRepresentation(value);
}

- (id)reverseTransformedValue:(id)value
{
    return [UIImage imageWithData:value];
}

@end
