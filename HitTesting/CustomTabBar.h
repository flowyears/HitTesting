//
//  CustomTabBar.h
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBar : UITabBar
@property(nonatomic,assign)CGFloat effectAreaY;//中心大按钮往上的响应区域高度（比如大按钮超出tabbar20个高度，那么此值就是20）
@end
