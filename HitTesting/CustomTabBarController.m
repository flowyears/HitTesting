//
//  CustomTabBarController.m
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "CustomTabBarController.h"
#import "CustomTabBar.h"

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiSetting];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)uiSetting
{
    // 更换tabBar
    CustomTabBar *myTabBar = [[CustomTabBar alloc] init];
    myTabBar.effectAreaY = 25;
    [self setValue:myTabBar forKey:@"tabBar"];
    
    NSArray *classeNames = @[@"HomeVC",@"PostVC",@"DiscoverVC"];
    NSArray *titleArray = @[@"首页",@"",@"发现"];
    NSArray *images = @[@"home",@"post",@"discover"];
    
    NSMutableArray *mArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0;i < classeNames.count; i++)
    {
        NSString *imageNormal = [NSString stringWithFormat:@"%@_normal",images[i]];
        NSString *imageSelected = [NSString stringWithFormat:@"%@_selected",images[i]];
        Class class = NSClassFromString(classeNames[i]);
        UIViewController *vc = [[class alloc]init];
        [vc setTitle:titleArray[i]];
        vc.tabBarItem.image = [[UIImage imageNamed:imageNormal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:imageSelected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //[vc.tabBarItem setImageInsets:UIEdgeInsetsMake(-30, 0, 30, 0)];//修改图片偏移量，上下，左右必须为相反数，否则图片会被压缩
        //[vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -30)];//修改文字偏移量
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        nav.title = titleArray[i];
        [mArr addObject:nav];
        
    }
    self.viewControllers = mArr;
    self.selectedIndex = 0;

    
}
@end
