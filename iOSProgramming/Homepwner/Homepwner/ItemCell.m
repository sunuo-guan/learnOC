//
//  ItemCell.m
//  Homepwner
//
//  Created by 关智豪 on 2020/6/22.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (IBAction)showImage:(id)sender
{
    if(self.actionBlock) {
        self.actionBlock();
    }
}

@end
