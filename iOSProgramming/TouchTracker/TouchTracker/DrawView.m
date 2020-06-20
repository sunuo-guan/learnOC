//
//  DrawView.m
//  TouchTracker
//
//  Created by 关智豪 on 2020/6/17.
//  Copyright © 2020 guanzhihao. All rights reserved.
//

#import "DrawView.h"
#import "Line.h"

@interface DrawView()

@property (nonatomic, strong)NSMutableDictionary *linesInProgress;
@property (nonatomic, strong)NSMutableArray *finishedLines;
@property (nonatomic, weak)Line *selectLine;

@end

@implementation DrawView

#pragma mark - View life cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.linesInProgress = [[NSMutableDictionary alloc]init];
        self.finishedLines = [[NSMutableArray alloc]init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
        //UITapGestureRecognizer对象
        UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
        doubleTapRecognizer.numberOfTapsRequired = 2;
        doubleTapRecognizer.delaysTouchesBegan = YES;
        [self addGestureRecognizer:doubleTapRecognizer];
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        //延迟响应单击事件
        [tapRecognizer requireGestureRecognizerToFail:doubleTapRecognizer];
        tapRecognizer.delaysTouchesBegan = YES;
        [self addGestureRecognizer:tapRecognizer];
    }
    return self;
}

#pragma mark - Action

//在view重写下述方法而不是在controller重写
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for(UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        Line *line = [[Line alloc]init];
        line.begin = location;
        line.end = location;
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key] = line;
    }
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        Line *line = self.linesInProgress[key];
        line.end = [t locationInView:self];
    }
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        Line *line = self.linesInProgress[key];
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

- (void)doubleTap:(UIGestureRecognizer *)gr
{
    NSLog(@"Reconized double tap");
    [self.linesInProgress removeAllObjects];
    [self.finishedLines removeAllObjects];
    [self setNeedsDisplay];
}

- (void)tap:(UITapGestureRecognizer *)gr
{
    NSLog(@"Reconized tap");
    CGPoint point = [gr locationInView:self];
    self.selectLine = [self lineAtPoint:point];
    if (self.selectLine) {
        // 使视图成为UIMenuItem动作消息的目标
        [self becomeFirstResponder];
        //获取UIMenuController对象
        UIMenuController *menu = [UIMenuController sharedMenuController];
        //创建一个新的标题为“Delete”的UIMenuItem对象
        UIMenuItem *deleteItem = [[UIMenuItem alloc]initWithTitle:@"delete" action:@selector(deleteLine:)];
        menu.menuItems = @[deleteItem];
        //先为UIMenuController对象设置显示区域，然后将其设置为可见
        [menu setTargetRect:CGRectMake(point.x, point.y, 2, 2) inView:self];
        [menu setMenuVisible:YES];
    }else {
        //如果没有选中的线条，就隐藏UIMenuController对象
        [[UIMenuController sharedMenuController]setMenuVisible:NO animated:YES];
    }
    [self setNeedsDisplay];
}

- (void)deleteLine:(id)sender
{
    [self.finishedLines removeObject:self.selectLine];
    [self setNeedsDisplay];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (Line *)lineAtPoint:(CGPoint)p
{
    for(Line *l in self.finishedLines) {
        CGPoint start = l.begin;
        CGPoint end = l.end;
        // 检查线条的若干点
        for (float t = 0.0; t <= 1.0; t += 0.05) {
            float x = start.x + t * (end.x - start.x);
            float y = start.y + t * (end.y - start.y);
        // 如果线条的某个点和p的距离在20点以内，就返回相应的BNRLine对象
            if (hypot(x - p.x, y - p.y) < 20.0) {
                return l;
            }
        }
    }
    return nil;
}

- (void)strokeLine:(Line *)line
{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    [bp moveToPoint:line.begin];
    [bp moveToPoint:line.end];
    [bp stroke];
}

- (void)drawRect:(CGRect)rect
{
    //已绘制的曲线展示
    [[UIColor blackColor]set];
    for (Line *line in self.finishedLines) {
        [self strokeLine:line];
    }
    //正在绘制的曲线
    for (NSValue *key in self.linesInProgress) {
        [self strokeLine:self.linesInProgress[key]];
    }
    //选中的曲线
    if (self.selectLine) {
        [[UIColor greenColor]set];
        [self strokeLine:self.selectLine];
    }
}

@end
