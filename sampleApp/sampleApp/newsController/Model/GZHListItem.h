//
//  GZHListItem.h
//  sampleApp
//
//  Created by 关智豪 on 2020/7/20.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GZHListItem : NSObject

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *uniqueKey;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *authorName;
@property (nonatomic, strong) NSString *articleUrl;

- (void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
