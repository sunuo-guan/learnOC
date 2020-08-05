# UIEdgeInsets与UIButton

## 一、UIEdgeInsets

内偏移量应用于矩形的每条边，进而缩小或扩展该矩形表示的区域。 通常在视图的布局期间，使用内偏移量来修改视图的框架。对每条边向**内方向**的偏移量，可以为正值（向内偏移）也可以为负值（向外偏移）。

`UIEdgeInsets(top, left, bottom, right)`：上左下右，正值向内，负值向外。



## 二、UIButton里的UIEdgeInsets

应用方向：通过修改button的两个属性：titleEdgeInsets和imageEdgeInsets，从而达到控制UIButton内的图片和文字的位置。

UIButton内部默认有两个子控件：UILabel和UIImageView。通过改变titleEdgeInsets和imageEdgeInsets调整位置。

titleEdgeInsets： **上边线、右边线、下边线 内偏移** 是相对于contentView的，**左边线 内偏移** 相对于image的；

imageEdgeInsets：**上边线、左边线、下边线 内偏移** 是相对于contentView的，**右边线 内偏移** 相对于title的；



具体场景：

#### 1.左图右字

`button.titleEdgeInsets = UIEdgeInsetsMake(0, 10.0, 0, 0);`

设置了title的左边线的内偏移量为10.0，但实际上左偏移量被拆成了两个方向，即title和image的距离为5.0。

#### 2.左字右图

```objective-c
button.titleEdgeInsets = UIEdgeInsetsMake(.0, - button.imageView.bounds.size.width - 10.0, .0, button.imageView.bounds.size.width);

button.imageEdgeInsets = UIEdgeInsetsMake(.0, button.titleLabel.bounds.size.width, .0, - button.titleLabel.bounds.size.width);
```



#### 3.上图下字

```objective-c
button.titleEdgeInsets = UIEdgeInsetsMake(button.imageView.frame.size.height + 10.0, - button.imageView.bounds.size.width, .0, .0);
button.imageEdgeInsets = UIEdgeInsetsMake(.0, button.titleLabel.bounds.size.width / 2, button.titleLabel.frame.size.height + 10.0, - button.titleLabel.bounds.size.width / 2);
```

