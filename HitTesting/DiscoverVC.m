//
//  DiscoverVC.m
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "DiscoverVC.h"
#import "ImageContainer.h"
@interface DiscoverVC ()
{
}
@property(nonatomic,strong)ImageContainer *imageContainer;
@end

@implementation DiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    //[self uisetting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)uisetting
{
    [self.view addSubview:self.imageContainer];
}

- (ImageContainer *)imageContainer
{

    if (!_imageContainer)
    {
        _imageContainer = [[ImageContainer alloc]initWithFrame:CGRectMake(60, 100, 200, 200)];
    }
    return _imageContainer;
}


@end
