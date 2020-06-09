//
//  Rectangle.h
//  PartOneChapter8Rectangle
//
//  Created by 关智豪 on 2020/6/9.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYPoint.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : NSObject

@property int width, height;

- (XYPoint *) origin;
- (void) setOrigin: (XYPoint *)pt;
- (void) setWidth: (int)width andHeight: (int)height;
- (int) area;
- (int) perimeter;

@end

NS_ASSUME_NONNULL_END
