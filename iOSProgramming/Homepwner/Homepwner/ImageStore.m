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

- (NSString *)imagePathForKey:(NSString *)key;

@end

@implementation ImageStore

+ (instancetype)shareStored
{
    static ImageStore *shareStored = nil;
    //线程安全
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareStored = [[self alloc]initPrivate];
    });
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
        //注册为通知中心的观察者
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(clearCache:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

- (void)clearCache:(NSNotificationCenter *)note
{
    NSLog(@"flushing %lu images out of the cache",(unsigned long)[self.dictionary count]);
    [self.dictionary removeAllObjects];
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
    // 获取保存图片的全路径
    NSString *imagePath = [self imagePathForKey:key];
    // 从图片提取JPEG格式的数据
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    // 将JPEG格式的数据写入文件
    [data writeToFile:imagePath atomically:YES];
}

- (UIImage *)imageForKey:(NSString *)key
{
    //先尝试通过字典对象获取图片
    UIImage *result = self.dictionary[key];
    if (!result) {
        NSString *imagePath = [self imagePathForKey:key];
        result = [UIImage imageWithContentsOfFile:imagePath];
    }
    if (result) {
        self.dictionary[key] = result;
    }else {
        NSLog(@"unable to find %@", [self imageForKey:key]);
    }
    return result;
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }else {
        [self.dictionary removeObjectForKey:key];
        NSString *imagePath = [self imagePathForKey:key];
        [[NSFileManager defaultManager]removeItemAtPath:imagePath error:nil];
    }
}

//根据传入的健创建相应的文件路径
- (NSString *)imagePathForKey:(NSString *)key
{
    NSArray *documentDiretories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDiretories firstObject];
    return [documentDirectory stringByAppendingPathComponent:key];
}

@end
