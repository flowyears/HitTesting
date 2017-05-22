# hit-test UITabBar 自定义中间大按钮
 使用时，只需要将CustomTabBar.h和CustomTabBar.m文件拽入工程，然后在自定义的UITabBarController中加入如下代码：
 
 
```
CustomTabBar *myTabBar = [[CustomTabBar alloc] init];
myTabBar.effectAreaY = 25;
[self setValue:myTabBar forKey:@"tabBar"];
```