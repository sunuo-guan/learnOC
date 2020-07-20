//
//  GZHListItem.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/20.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHListItem.h"

@implementation GZHListItem

- (void)configWithDictionary:(NSDictionary *)dictionary {
#warning 类型是否匹配
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}

@end
