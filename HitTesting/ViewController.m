//
//  ViewController.m
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import "ViewController.h"
#import "CustomTabBarController.h"
#import "HomeVC.h"
#import "PostVC.h"
#import "DiscoverVC.h"

static NSString * const kCellIdentifier = @"cellIdentifier";

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource>
{
}
@property(nonatomic,strong)UITableView *hitTable;
@property(nonatomic,strong)NSMutableArray *data;
@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Hit-Testing";
    [self.data addObjectsFromArray:@[@"UITabBar 自定义中间大按钮",@"扩大点击区域",@"传递触摸事件给父视图"]];
    [self uiSetting];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UI
- (void)uiSetting
{
    [self.view addSubview:self.hitTable];
}
#pragma mark - Data
#pragma mark - Action
#pragma mark - Notification
#pragma mark - Method

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    NSString *title = self.data[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            CustomTabBarController *tbController = [[CustomTabBarController alloc] init];
            [self.navigationController pushViewController:tbController animated:YES];
        }
            break;
        case 1:
        {
            HomeVC *homeVC = [[HomeVC alloc] init];
            [self.navigationController pushViewController:homeVC animated:YES];
        }
            break;
        case 2:
        {
            PostVC *postVC = [[PostVC alloc] init];
            [self.navigationController pushViewController:postVC animated:YES];
        }
            break;
        case 3:
        {
            DiscoverVC *discoverVC = [[DiscoverVC alloc] init];
            [self.navigationController pushViewController:discoverVC animated:YES];
        }
            break;
        default:
            break;
    }
}


#pragma mark - Getter And Setter

- (UITableView *)hitTable
{
    if (!_hitTable)
    {
        _hitTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _hitTable.dataSource = self;
        _hitTable.delegate = self;
        //        _<#tableName#>.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        //        _<#tableName#>.backgroundColor = [UIColor clearColor];
        //        _<#tableName#>.separatorStyle = UITableViewCellSeparatorStyleNone;
        //        _<#tableName#>.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [_hitTable registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    return _hitTable;
}

- (NSMutableArray *)data
{
    if (!_data)
    {
        _data = [[NSMutableArray alloc] init];
    }
    return _data;
}
@end
