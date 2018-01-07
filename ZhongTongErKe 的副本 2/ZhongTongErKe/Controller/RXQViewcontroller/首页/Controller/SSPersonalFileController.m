//
//  SSPersonalFileController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPersonalFileController.h"
#import "SSPersonalFileHeaderView.h"
#import "SSPersonalFileTableCell.h"
#import "BasicInforViewController.h"
#import "SSHealthHistoryDetailController.h"
#import "SSPersonFileListController.h"
#import "SSHomeMemberController.h"
#import "UserTool.h"


@interface SSPersonalFileController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSMutableArray *dataArray;
@property (nonatomic,weak) SSPersonalFileHeaderView *headerView;


@end

@implementation SSPersonalFileController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    SSPersonalFileHeaderView *headerView = [[SSPersonalFileHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 251)];
    headerView.user = [UserTool user];
   
    __weak typeof (self) weakSelf = self;
    headerView.bgImageView.backBlock = ^()
    {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    self.tableView.tableHeaderView = headerView;
    
    self.headerView = headerView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.headerView.user =  [UserTool user];
    
}



#pragma mark --datasource delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  

    if(indexPath.row == 0) {
        
        SSHomeMemberController *vc = [[SSHomeMemberController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if(indexPath.row == 1) {
        
        [self.navigationController pushViewController:  [BasicInforViewController new] animated:YES];
        
    }
    else
    {
        
      
        [self.navigationController pushViewController:[SSHealthHistoryDetailController new] animated:YES];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40*kScreenHeightScale;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSPersonalFileTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.headImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row][@"headName"]];
    cell.headLabel.text = self.dataArray[indexPath.row][@"text"];
    cell.detailImageView.image = [UIImage imageNamed: @"go"];
    return cell;
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[SSPersonalFileTableCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        NSArray *array = @[@{@"headName":@"family",@"text":@"家庭成员档案"},@{@"headName":@"basics",@"text":@"基本资料"},@{@"headName":@"health-history",@"text":@"健康史"}];
        _dataArray = [NSMutableArray arrayWithArray:array];
    }
    return _dataArray;
}



@end
