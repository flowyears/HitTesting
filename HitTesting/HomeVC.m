//
//  HomeVC.m
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "HomeVC.h"
#import "BigAreaButton.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.8 green:0.6 blue:0.5 alpha:1];
    [self uiSetting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)uiSetting
{
    BigAreaButton *btn = [BigAreaButton buttonWithType:UIButtonTypeCustom];
    btn.addAreadDx = 20;
    btn.addAreadDy = 20;
    [btn setTitle:@"hit-test" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 120, 100, 100);
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"normal" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor greenColor]];
    [btn1 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn1.frame = CGRectMake(100, 300, 100, 100);
    [self.view addSubview:btn1];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0,  self.view.bounds.size.height-80,  self.view.bounds.size.width, 50)];
    lb.text = @"灰色按钮扩大了点击区域，上下左右区域均扩大了20";
    lb.lineBreakMode = NSLineBreakByWordWrapping;
    lb.numberOfLines = 0;
    lb.font = [UIFont systemFontOfSize:12];
    lb.textColor = [UIColor blackColor];
    [self.view addSubview:lb];
}

- (void)btnClicked:(UIButton *)btn
{
    NSLog(@"===btnClicked");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"戳到我了"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"确定"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         
                                                     }];

    [alertController addAction:actionOK];
    [self presentViewController:alertController animated:YES completion:nil];

}

@end
