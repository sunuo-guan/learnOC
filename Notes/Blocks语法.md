## Blocks概要

>Blocks：带有自动变量（即局部变量）的匿名函数。

匿名函数：即不带名称的函数；

带有自动变量：“带有自动变量”在Blocks中表现为截取自动变量。
Blocks中，Block常量表达式会截获所使用的自动变量的值（即保存该自动变量的瞬间值），从而在执行块时使用。
即使改写Block中使用的自动变量的值，也不会影响Block执行时自动变量的值。

```objective-c
{
  int val = 10;
  void (^blk)() = ^{
  		NSLog(@"%d",val);
  };
  val = 2;
  blk();
}//输出结果为10   		
```
## Block语法

完整形式的Block语法与一般C语言的函数定义相比，仅有两点不同：

>（1）没有函数名;
>
>（2）带有“^”;

完整的范式：
> **^** **返回值类型** **参数列表** **表达式**

省略返回类型：
> **^** **参数列表** **表达式**

如果不使用参数，参数列表也可以省略：
> **^** **表达式**

## Block类型变量
在Block语法下，可将Block语法赋值给声明为Block类型的变量中（即源代码中一旦使用Block语法就相当于生成了可赋值给Block类型变量的“值”）。

- 使用Block语法将Block赋值为Block类型变量。
- 由Block类型变量向Block类型变量赋值。
- Block类型变量作为函数参数传递。
- Block类型变量作为函数返回值返回。
- Block类型变量作为函数参数和返回值时，可以通过typedef为Block类型提供别名，从而起到简化块类型变量名的作用。

#### __block说明符
自动变量值截获只能保存执行block语法瞬间的值，保存后block内就不能改写该值。

如果给Block中截获的自动变量赋值，需要在声明时给截获的自动变量附加__block说明符。

截获Objective-C对象，调用变更该对象的方法并不会产生编译错误。

但是，向截获的自动变量（即所截获的Objective-C对象）赋值则会产生错误。

在使用C语言数组时，Block中的截获自动变量的方法并没有实现对C语言数组的截获，需要通过指针实现对C语言数组自动变量的截获。