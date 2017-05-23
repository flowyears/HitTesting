//
//  ImageContainer.m
//  HitTesting
//
//  Created by mac on 2017/5/23.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "ImageContainer.h"

@interface ImageContainer ()
{
}
@property(nonatomic,strong)UIScrollView *photoScroll;
@end

@implementation ImageContainer
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self uisetting];
    }
    return self;
}

- (void)uisetting
{
    [self addSubview:self.photoScroll];
    self.photoScroll.contentSize = CGSizeMake(7 * self.bounds.size.width, self.bounds.size.height);
    NSArray *imageNames = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07"];
    
    __weak __typeof(self)weakSelf = self;
    //self.photoScroll.contentSize = CGSizeMake(imageNames.count * 200, 200);
    [imageNames enumerateObjectsUsingBlock:^(NSString *imgName, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(200*idx, 0, 200, 200)];
        imgV.image = [UIImage imageNamed:imgName];
        imgV.contentMode = UIViewContentModeScaleAspectFill;
        imgV.userInteractionEnabled = YES;
        [weakSelf.photoScroll addSubview:imgV];
    }];
    

}


//
//- (UIView *)mmHitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    for (UIView *subview in [self.subviews reverseObjectEnumerator])
//    {
//        CGPoint convertedPoint = [subview convertPoint:point fromView:self];
//        UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
//        if (hitTestView) {
//            return hitTestView;
//        }
//    }
//    return nil;
//}



- (UIScrollView *)photoScroll
{
    if (!_photoScroll)
    {
        _photoScroll =[[UIScrollView alloc]initWithFrame:self.bounds];
        _photoScroll.backgroundColor = [UIColor greenColor];
        _photoScroll.delegate = self;
        _photoScroll.layer.masksToBounds = NO;
        //_<#ScrollViewName#>.backgroundColor = [UIColor whiteColor];
        //_<#ScrollViewName#>.showsHorizontalScrollIndicator = NO;
        //_<#ScrollViewName#>.showsVerticalScrollIndicator = NO;
        _photoScroll.pagingEnabled = YES;
        //_<#ScrollViewName#>.scrollsToTop = YES;//点击statusbar滚动到顶部，默认yes
        //_<#ScrollViewName#>.bounces = NO;//内容越过边缘，是否反弹
        //_<#ScrollViewName#>.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _photoScroll;
}
@end
