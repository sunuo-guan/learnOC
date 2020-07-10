//
//  commodityView.h
//  shopCar
//
//  Created by 关智豪 on 2020/7/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZHCommodityModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface commodityView : UIView

@property (nonatomic, strong) GZHCommodityModel *commodity;

//传数据模型
- (void)setCommodity:(GZHCommodityModel *)commodity;

@end

NS_ASSUME_NONNULL_END
