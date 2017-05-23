//
//  PostVC.m
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "PostVC.h"
#import "CoverView.h"
@interface PostVC ()

@end

@implementation PostVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self uiSetting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)uiSetting
{
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"戳我" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor greenColor]];
    [btn1 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn1.frame = CGRectMake(100, 300, 100, 100);
    [self.view addSubview:btn1];
    
    CoverView *v = [[CoverView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    v.backgroundColor = [UIColor colorWithRed:0.1 green:0.3 blue:0.5 alpha:0.1];
    //v.alpha = 0.1;
    [self.view addSubview:v];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"戳我" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor blackColor]];
    [btn2 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(10, 70, 100, 100);
    [v addSubview:btn2];
    
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0,  self.view.bounds.size.height-80,  self.view.bounds.size.width, 50)];
    lb.text = @"绿色按钮在半透明背景之下，黑色按钮在半透明背景之上，半透明背景覆盖了hit-test方法，所以绿色按钮才能被点击，否则是无法被点击的。";
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
