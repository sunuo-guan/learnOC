//
//  ImageStore.m
//  Homepwner
//
//  Created by 关智豪 on 2020/6/17.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "ImageStore.h"

@interface ImageStore()

@property (nonatomic, strong)NSMutableDictionary *dictionary;

@end

@implementation ImageStore

+ (instancetype)shareStored
{
    static ImageStore *shareStored = nil;
    if (!shareStored) {
        shareStored = [[self alloc]initPrivate];
    }
    return shareStored;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[ImageStore shareStored" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }else {
        [self.dictionary removeObjectForKey:key];
    }
}

@end
