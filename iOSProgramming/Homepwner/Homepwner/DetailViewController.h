//
//  DetailViewController.h
//  Homepwner
//
//  Created by 关智豪 on 2020/6/16.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (nonatomic, strong)BNRItem *item;

@end

NS_ASSUME_NONNULL_END
