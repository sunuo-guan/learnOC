# UITableView的复用机制

## 一、复用机制

复用机制大体如下：

1、首先加载能铺满整个`UITableView`所需要的`UITableViewCell`，具体个数要根据每个`cell`的高度而定，即当前加载的`UITableViewCell`的总高度要大于当前的`UITableView`的高度；

2、当上下滑动时，彻底消失的`UITableViewCell`被放入`UITableView`的缓存池，需要生成新的`UITableViewCell`时，在缓存池获取一个已经生成且能使用的`UITableViewCell`并使用，当缓存池没有相关的`UITableViewCell`时才需要重新生成。



## 二、复用机制存在的问题

复用机制的不正确使用会出现一些问题，如：

```objective-c
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier =  @"UITableViewCell"; 
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) { 
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]; 
// 偶数行 Cell 的 textLabel 的文字颜色为红色。
        if (indexPath.row % 2 == 0) { 
               [cell.textLabel setTextColor:[UIColor redColor]]; 
        }  
   }

   cell.textLabel.text = @"Title";
 // 偶数行 Cell 的 detailTextLabel 显示 Detail 文字。
      if (indexPath.row % 2 == 0) { 
       cell.detailTextLabel.text = @"Detail"; 
     }

    return cell;
}
```

希望的设置：只有偶数行的 `textLabel` 的文字颜色为红色，并且显示 `Detail` 文字；

实际的情况：滑动 `TableView` 时，有些奇数行的 `textLabel` 的文字颜色为红色，且显示了 `Detail` 文字。

原因：复用。当一个 `UITableViewCell` 被拿来复用时，它所有被设置的属性（包括样式和内容）都会被拿来复用，如果刚好某一个的 `UITableViewCell` 没有显式地设置它的属性，那么它这些属性就直接复用缓存池的 `UITableViewCell` 的对应属性。

示例解决代码：

```objective-c
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { 
    static NSString *CellIdentifier = @"UITableViewCell"; 
   UITableViewCell *cell = nil; 
   cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
   if (!cell) { 
       cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
   } 

   cell.textLabel.text = @"Title";

   if (indexPath.row % 2 == 0) {
       [cell.textLabel setTextColor:[UIColor redColor]]; 
       cell.detailTextLabel.text = @"Detail";
   } else { 
       [cell.textLabel setTextColor:[UIColor blackColor]];
       cell.detailTextLabel.text = nil; 
   }

   return cell;
}
```



## 三、复用时需要注意的事项

1、设置 `UITableViewCell` 的存在差异性的那些属性（包括样式和内容）时，`有了 if 最好就要有 else`，要显式的覆盖所有可能性；

2、设置 `UITableViewCell` 的存在差异性的那些属性时，代码要放在初始化代码块的外部。



## 四、`UITableView`的相关回调方法的调用次序

`UITableView` 在复用时最主要的两个回调方法：`- [UITableView tableView:cellForRowAtIndexPath:]`和`- [UITableView tableView:heightForRowAtIndexPath:]`。`UITableView` 是继承自 `UIScrollView`，所以在渲染的过程中它会先确定它的 `contentSize` 及每个 `UITableViewCell` 的位置，然后才会把复用的 `Cell` 放置到对应的位置。比如现在一共有 50 个 `UITableViewCell`，当前屏幕上显示 5 个。那么在第一次创建或 `reloadData` 的时候， `UITableView` 会先调用 50 次`- [UITableView tableView:heightForRowAtIndexPath:]`确定 `contentSize` 及每个 `Cell` 的位置，然后再调用 5 次 `- [UITableView tableView:cellForRowAtIndexPath:]`来渲染当前屏幕的 Cell。在滑动屏幕的时候，每当一个 `UITableViewCell` 进入屏幕时，都需要调用一次 `- [UITableView tableView:cellForRowAtIndexPath:]`和`- [UITableView tableView:heightForRowAtIndexPath:]`方法。



## 五、`UITableView` 性能优化总结

* 通过正确的设置 `reuseIdentifier` 来重用 `UITableViewCell`；

- 减少不必要的透明 `View`；
- 尽量避免渐变效果、图片拉伸和离屏渲染；
- 当不同的行的高度不一样时，尽量缓存它们的高度值；
- 如果`UITableViewCell` 展示的内容来自网络，确保用异步加载的方式来获取数据，并且缓存服务器的 `response`；
- 使用 `shadowPath` 来设置阴影效果；
- 尽量减少 `subview` 的数量，对于 `subview` 较多并且样式多变的 `UITableViewCell`，可以考虑用异步绘制或重写`drawRect`；
- 尽量优化 `- [UITableView tableView:cellForRowAtIndexPath:]`方法中的处理逻辑，如果确实要做一些处理，可以考虑做一次，缓存结果；
- 选择合适的数据结构来承载数据，不同的数据结构对不同操作的开销是存在差异的；
- 对于 `rowHeight`、`sectionFooterHeight`、`sectionHeaderHeight` 尽量使用常量。



