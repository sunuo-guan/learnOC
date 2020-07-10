//
//  GZHCommodityModel.h
//  shopCar
//
//  Created by 关智豪 on 2020/7/10.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GZHCommodityModel : NSObject

/** 图标名字 */
@property (nonatomic, copy) NSString *icon;
/** 商品名字*/
@property (nonatomic, copy) NSString *name;

+ (instancetype)shopWithDictionary: (NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
