//
//  GZHHypnosisView.m
//  GZHHypnosister
//
//  Created by 关智豪 on 2020/6/12.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "GZHHypnosisView.h"

@implementation GZHHypnosisView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        //背景色设置为透明
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //充满整个view
    CGRect bounds = self.bounds;
    
    //计算圆心
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.y + bounds.size.height/2.0;
    
    //取最小值计算半径
    //float radius = (MIN(bounds.size.height, bounds.size.width) / 2.0);
    
    //最外层圆作为视图外接圆
    float maxRadius = hypotf(bounds.size.height, bounds.size.width) / 2.0;
    
    //创建绘图UIBezierPath类的对象绘制圆
    UIBezierPath *path = [[UIBezierPath alloc]init];
    //定义路径
    /*
    [path addArcWithCenter:center
                    radius:radius
                startAngle:0.0
                  endAngle:2 * M_PI
                 clockwise:YES];
     */
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -=20) {
        //抬起画笔先移到起点
        [path moveToPoint:CGPointMake(center.x+currentRadius, center.y)];
        [path addArcWithCenter:center
            radius:currentRadius
        startAngle:0.0
          endAngle:2 * M_PI
         clockwise:YES];
    }
    
    
    //设置线条宽度
    path.lineWidth = 10;
    //设置绘制线条的颜色
    [[UIColor lightGrayColor]setStroke];
    //开始绘制
    [path stroke];
    
    //添加图片
    UIImage *image = [UIImage imageNamed:@"0.jpeg"];
    CGRect imageRect = CGRectMake(100, 100, 200, 200);
    [image drawInRect:imageRect];
}

@end
