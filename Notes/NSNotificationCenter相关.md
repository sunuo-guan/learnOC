##### 1、发通知

带字典参数：`- (void)postNotificationName:([NSNotificationName]aName object:(id)anObject userInfo:([NSDictionary]aUserInfo;`

其中，`aName`为通知的名称，`aUserInfo`为字典类型的参数

示例：

`NSDictionary *myDictionary = [NSDictionary dictionaryWithObject:@"sendValue" forKey:@"sendKey"];`

`[[NSNotificationCenter defaultCenter] postNotificationName:@"myNotice" object:nil userInfo:myDictionary];`

##### 2、注册及接收通知

在通知中心注册，接收某通知：

`- (void)addObserver:(id)observer selector:(SEL)aSelector name：(NSNotificationName)aName  object:(id)anObject;`

其中，observer为接收某一通知名字为aName的类，aSelector为接收通知执行的方法。

示例：

`[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noticeMethod:) name:@"myNotice" object:nil];`

```objective-c
- (void)noticeMethod:(NSNotification *)notification {
    NSString *getsendValue = [[notification userInfo] valueForKey:@"sendKey"];
}
```

将当前类注册为响应myNotice通知的类，在通知发出时，执行noticeMethod方法。在方法内取出通知的字典的传参。