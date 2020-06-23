//
//  BNRItem.h
//  Homepwner
//
//  Created by 关智豪 on 2020/6/22.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@import CoreData;

@interface BNRItem : NSManagedObject

@property (nonatomic, strong) NSDate * dateCreated;
@property (nonatomic, strong) NSString * itemKey;
@property (nonatomic, strong) NSString * itemName;
@property (nonatomic) double orderingValue;
@property (nonatomic, strong) NSString * serialNumber;
@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, strong) NSData * thumbnailData;
@property (nonatomic) int valueInDollars;
@property (nonatomic, strong) NSManagedObject *assetType;

- (void)setThumbnailFromImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
