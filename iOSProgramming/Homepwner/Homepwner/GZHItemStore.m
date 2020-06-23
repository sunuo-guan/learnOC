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

@import CoreData;

@interface GZHItemStore()

@property (nonatomic)NSMutableArray *privateItems;
@property (nonatomic, strong) NSMutableArray *allAssetTypes;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;
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
        //读取Homepwner.xcdatamodeld
        _model = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]       initWithManagedObjectModel:_model];
        // 设置SQLite文件路径
        NSString *path = self.itemArchive;
        NSURL *storeURL = [NSURL fileURLWithPath:path];
        NSError *error = nil;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:nil
                                       error:&error]) {
            @throw [NSException exceptionWithName:@"OpenFailure"
                                           reason:[error localizedDescription]
                                         userInfo:nil];
        }
        //创建NSManagedObjectContext对象
        _context = [[NSManagedObjectContext alloc]init];
        _context.persistentStoreCoordinator = psc;
        [self loadAllItems];
    }
    return self;
}

//获取路径名，iOS下数组只有唯一一个路径
- (NSString *)itemArchive
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // 从documentDirectories数组获取第一个，也是唯一文档目录路径
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"store.data"];
}

- (BOOL)saveChanges
{
    NSError *error;
    BOOL successful = [self.context save:&error];
    if (!successful) {
        NSLog(@"Error saving: %@", [error localizedDescription]);
    }
    return successful;
}

- (NSArray *)allItems
{
    //用copy返回一个不可变数组
    return [self.privateItems copy];
}

- (BNRItem *)createItem
{
    double order;
    if ([self.allItems count] == 0) {
        order = 1.0;
    } else {
        order = [[self.privateItems lastObject] orderingValue] + 1.0;
    }
    NSLog(@"Adding after %d items, order = %.2f",[self.privateItems count],order);
    BNRItem *item = [NSEntityDescription insertNewObjectForEntityForName:@"BNRItem" inManagedObjectContext:self.context];
    item.orderingValue = order;
    [self.privateItems addObject:item];
    return item;
}

- (void)removeItem:(BNRItem *)item
{
    //删除item也要删除对应的image对象
    NSString *key = item.itemKey;
    [[ImageStore shareStored]deleteImageForKey:key];
    [self.context deleteObject:item];
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

- (void)loadAllItems
{
    if (!self.privateItems) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [NSEntityDescription entityForName:@"BNRItem" inManagedObjectContext:self.context];
        request.entity = e;
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"orderingValue" ascending:YES];
        request.sortDescriptors = @[sd];
        NSError *error;
        NSArray *result = [self.context executeFetchRequest:request error:&error];
        if (!result) {
            [NSException raise:@"Fetch failed" format:@"Reason: %@", [error localizedDescription]];
        }
        self.privateItems = [[NSMutableArray alloc] initWithArray:result];
    }
}

@end
