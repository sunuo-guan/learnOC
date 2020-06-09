//
//  Rectangle.m
//  PartOneChapter8Rectangle
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle
{
    XYPoint *origin;
}

@synthesize width, height;

- (void)setWidth: (int)width andHeight: (int)height
{
    self.width = width;
    self.height = height;
}

- (void)setOrigin:(XYPoint *)pt
{
    if(!origin)
        origin =[[XYPoint alloc]init];
    
    origin.x = pt.x;
    origin.y = pt.y;
}

- (int)area
{
    return width * height;
}

- (int)perimeter
{
    return (width + height) * 2;
}

- (XYPoint *)origin
{
    return origin;
}

@end
