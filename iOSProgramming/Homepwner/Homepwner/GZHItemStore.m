//
//  GZHItemStore.m
//  Homepwner
//
//  Created by 关智豪 on 2020/6/16.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHItemStore.h"
#import "ImageStore.h"
#import "BNRItem.h"

@interface GZHItemStore()

@property (nonatomic)NSMutableArray *privateItems;

@end

@implementation GZHItemStore : NSObject

+ (instancetype)sharedStore
{
    static GZHItemStore *shareStore = nil;
    if(!shareStore) {
        shareStore = [[self alloc]initPrivate];
    }
    return shareStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[GZH shareStore]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super self];
    if(self) {
        _privateItems = [[NSMutableArray alloc]init];
    }
    return self;
}

- (NSArray *)allItems
{
    //用copy返回一个不可变数组
    return [self.privateItems copy];
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

- (void)removeItem:(BNRItem *)item
{
    //删除item也要删除对应的image对象
    NSString *key = item.itemKey;
    [[ImageStore shareStored]deleteImageForKey:key];
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    BNRItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectIdenticalTo:item];
    [self.privateItems insertObject:item atIndex:toIndex];
    
}
@end
