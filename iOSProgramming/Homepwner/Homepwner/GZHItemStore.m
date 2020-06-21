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
    static dispatch_once_t onceItem;
    dispatch_once(&onceItem, ^{
        shareStore = [[self alloc]initPrivate];
    });
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
        NSString *path = [self itemArchive];
        _privateItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (!_privateItems) {
            _privateItems = [[NSMutableArray alloc]init];
        }
    }
    return self;
}

//获取路径名，iOS下数组只有唯一一个路径
- (NSString *)itemArchive
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // 从documentDirectories数组获取第一个，也是唯一文档目录路径
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

- (BOOL)saveChanges
{
    NSString *path = [self itemArchive];
    return [NSKeyedArchiver archiveRootObject:self.privateItems toFile:path];
}

- (NSArray *)allItems
{
    //用copy返回一个不可变数组
    return [self.privateItems copy];
}

- (BNRItem *)createItem
{
    BNRItem *item = [[BNRItem alloc]init];
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
