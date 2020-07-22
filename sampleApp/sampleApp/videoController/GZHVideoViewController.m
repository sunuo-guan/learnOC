//
//  GZHVideoViewController.m
//  sampleApp
//
//  Created by 关智豪 on 2020/7/14.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHVideoViewController.h"
#import "GZHVideoCoverView.h"

@interface GZHVideoViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation GZHVideoViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = nil;
        self.tabBarItem.selectedImage = nil;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.width / 16 * 9);
    
    UICollectionView *collectinView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [collectinView registerClass:[GZHVideoCoverView class] forCellWithReuseIdentifier:@"GZHVideoCoverViewCell"];
    collectinView.backgroundColor = [UIColor clearColor];
    
    collectinView.delegate = self;
    collectinView.dataSource = self;
    
    [self.view addSubview:collectinView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    if ([cell isKindOfClass:[GZHVideoCoverView class]]) {
        
    }
    
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.item % 3 ==0) {
//        return CGSizeMake((self.view.frame.size.width - 10), 100);
//    } else {
//        return CGSizeMake((self.view.frame.size.width - 10) / 2, 300);
//    }
//}


@end
