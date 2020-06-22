//
//  WebViewController.m
//  Webfeed
//
//  Created by 关智豪 on 2020/6/22.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;
}

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

@end
