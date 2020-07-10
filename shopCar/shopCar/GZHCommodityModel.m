//
//  GZHCommodityModel.m
//  shopCar
//
//  Created by 关智豪 on 2020/7/10.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHCommodityModel.h"

@implementation GZHCommodityModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+ (instancetype)shopWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

@end
