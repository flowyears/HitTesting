//
//  BigAreaButton.m
//  HitTesting
//
//  Created by mac on 2017/5/23.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "BigAreaButton.h"

@implementation BigAreaButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!self.userInteractionEnabled ||
        self.alpha <= 0.01 ||
        self.hidden == YES)
    {
        return nil;
    }
    
    CGRect touchRect = CGRectInset(self.bounds, -self.addAreadDx, -self.addAreadDy);
    if (CGRectContainsPoint(touchRect, point))
    {
        for (UIView *subview in [self.subviews reverseObjectEnumerator])
        {
            CGPoint convertedPoint = [subview convertPoint:point toView:self];
            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
            if (hitTestView)
            {
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}
@end
