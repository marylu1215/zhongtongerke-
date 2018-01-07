//
//  SSIntegrationTableViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/27.
//  Copyright © 2017年 Claf. All rights reserved.
//
#import "SSIntegrationTableViewController.h"
#import "SSInteScoreTableViewController.h"
#import "SSAccountHeader.h"
#import "SSInTableViewCell.h"
#import "SSHealthPlanController.h"
#import "UserTool.h"


@interface SSIntegrationTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic ,strong) NSArray *imageArray;
@property (nonatomic ,strong) NSArray *titleArray;

@end

@implementation SSIntegrationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    SSAccountHeader *headerView = [[SSAccountHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(426)*kScreenHeightScale)];
   headerView.headLabel.text = @"积分总额";
   headerView.contentLabel.text = [UserTool user].integral;
    __weak typeof (self) weakSelf = self;
    headerView.backAction = ^()
    {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
   self.tableView.tableHeaderView = headerView;
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSInTableViewCell *cell = [SSInTableViewCell cellWithTableView:tableView];
    
    cell.headImageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    
    cell.infoLabel.text = self.titleArray[indexPath.row];
   
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
    //积分记录*/
        [self.navigationController pushViewController:[SSInteScoreTableViewController new] animated:YES];
    }
    else
    {
       [self.navigationController pushViewController:[ SSHealthPlanController new] animated:YES];
    }
   
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = @[getIntegralImageName,userRecordImageName];
        
    }
    return _imageArray;
}

-(NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"做任务领取积分",@"积分记录"];
    }
    return _titleArray;
}

@end
