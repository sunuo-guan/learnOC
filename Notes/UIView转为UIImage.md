# UIView转为UIImage方法记录

代码：

```objective-c
- (UIImage *)getImageFromView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
```



其中：

```objective-c
void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale);
```

该函数表示创建一个位图（bitmap）的上下文（context），并把它设置为当前正在使用的上下文。参数size表示位图的大小，参数opaque表示是否非透明，YES表示非透明，NO表示透明，参数scale表示比例因子，设置为0.0表示使用主屏幕的比例因子。



```objective-c
- (void)renderInContext:(CGContextRef)ctx;
```

将调用该函数的图层及其子图层渲染到指定的上下文中。在此处指定的上下文是UIGraphicsGetCurrentContext()返回的当前的上下文。



```objective-c
UIImage * UIGraphicsGetImageFromCurrentImageContext(void);
```

该函数根据当前基于位图的图形上下文的内容返回图像。



```objective-c
void UIGraphicsEndImageContext(void);
```

该函数使栈顶部弹出当前的图形上下文。



整体方法：先创建一个与待转换的view大小一致的位图（bitmap）的上下文（context），并将待转换的view的layer渲染到当前的上下文的layer中，再将当前的图形上下文内容返回到一个图像中。



注意：传入的view必须要先设置frame属性，否则创建的位图（bitmap）的size会为0，从而转换失败。



