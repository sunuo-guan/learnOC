//
//  GZHListLoader.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/17.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHListLoader.h"
#import <AFNetworking/AFNetworking.h>
#import "GZHListItem.h"

@implementation GZHListLoader

- (void)loadListDataWithFinishBlock:(GZHListLoaderFinishBlock)finishBlock  {
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
//    [[AFHTTPSessionManager manager] GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];

    NSURL *listURL = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];

    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof(self) wself = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
#warning 类型的检查
        NSArray *dataArray = [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            GZHListItem *listItem = [[GZHListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        __strong typeof(self) strongSelf = wself;
        [strongSelf _archiveListDataWithArray:listItemArray.copy];
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (finishBlock) {
                               finishBlock(error == nil, listItemArray.copy);
                           }
                       });
    }];
    [dataTask resume];
}

- (void)_archiveListDataWithArray:(NSArray<GZHListItem *> *)array {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];

    NSFileManager *fileManager = [NSFileManager defaultManager];

    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GZHData"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];

    //创建文件
    //NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"List"];

    //序列化对象
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];

    //再保存到文件中
    //[fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    //从文件读
    //NSData *readListData = [fileManager contentsAtPath:listDataPath];
    
    //nsuserdefault
    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
    NSData *readListData = [[NSUserDefaults standardUserDefaults] objectForKey:@"listData"];
    
    //反序列化
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [GZHListItem class], nil] fromData:readListData error:nil];
    
    //查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];

//    if (fileExist) {
//        //删除
//        //[fileManager removeItemAtPath:listDataPath error:nil];
//        NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//
//        //文件尾部追加数据
//        [fileHandler seekToEndOfFile];
//        [fileHandler writeData:[@"abc" dataUsingEncoding:NSUTF8StringEncoding]];
//        //文件同步
//        [fileHandler synchronizeFile];
//        //关闭文件
//        [fileHandler closeFile];
//    }
}

@end
