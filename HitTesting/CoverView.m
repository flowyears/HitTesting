//
//  CoverView.m
//  HitTesting
//
//  Created by mac on 2017/5/23.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "CoverView.h"

@implementation CoverView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitTestView = [super hitTest:point withEvent:event];
    if (hitTestView == self) {
        hitTestView = nil;
    }
    return hitTestView;
}
@end
