//
//  CustomTabBar.m
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "CustomTabBar.h"

@implementation CustomTabBar
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01)
    {
        return nil;
    }

    if ([self pointInside:point withEvent:event])
    {
        return [self mmHitTest:point withEvent:event];
    }
    else
    {
        CGFloat tabBarItemWidth = self.bounds.size.width/self.items.count;
        CGFloat left = self.center.x - tabBarItemWidth/2;
        CGFloat right = self.center.x + tabBarItemWidth/2;
        
        if (point.x < right &&
            point.x > left)
        {//当点击的point的x坐标是中间item范围内，才去修正落点
            CGPoint otherPoint = CGPointMake(point.x, point.y + self.effectAreaY);
            return [self mmHitTest:otherPoint withEvent:event];
        }
    }
    return nil;
}

- (UIView *)mmHitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    for (UIView *subview in [self.subviews reverseObjectEnumerator])
    {
        CGPoint convertedPoint = [subview convertPoint:point fromView:self];
        UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
        if (hitTestView) {
            return hitTestView;
        }
    }
    return nil;
}

@end
