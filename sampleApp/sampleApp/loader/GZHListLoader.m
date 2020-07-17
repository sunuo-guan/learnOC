//
//  GZHListLoader.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/17.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHListLoader.h"

@implementation GZHListLoader

- (void)loadListData {
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"");
    }];
    [dataTask resume];
    NSLog(@"");
}

@end
