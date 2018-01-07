//
//  SSHealthPlanController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHealthPlanController.h"
#import "SSHealthPlanHeader.h"
#import "HealthTask.h"
#import "SSTaskDetailController.h"
#import "SSHealthTaskTableCell.h"
#import "SSPersonFileListController.h"

@interface SSHealthPlanController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy)  NSArray *healthTaskArray;

@end

@implementation SSHealthPlanController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"健康任务";
    [self.view addSubview:self.tableView];

    [self loadHealthTask];
    
}

- (void)viewWillAppear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
 
    self.tabBarController.tabBar.hidden = NO;
}

-(void)loadHealthTask
{
     self.healthTaskArray = [HealthTask mj_objectArrayWithKeyValuesArray:[XFModelTest sharedModelTest].healthTaskListDict[@"healthTasks"]];
    [self.tableView reloadData];
    
}

-(void)clockAction
{
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
          return px(30);
    }
    else
    {
        return CGFLOAT_MIN;
    }
  
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return px(10);
}


#pragma mark --datasource delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.healthTaskArray.count;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return px(204);
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
//    SSTaskDetailController *detailVC = [[SSTaskDetailController alloc]init];
//    
//    detailVC.healthTask = self.healthTaskArray[indexPath.row];
//    
//    [self.navigationController pushViewController:detailVC animated:YES];
  

    if (indexPath.section==0) {
        
        SSPersonFileListController *fileVC =   [SSPersonFileListController new];
       fileVC.type =@"jifen";
        
    [self.navigationController pushViewController:fileVC animated:YES];
        
    }
    else
    {
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSHealthTaskTableCell *taskTablecell = [ SSHealthTaskTableCell cellWithTableView:tableView];
    taskTablecell.healthTask = self.healthTaskArray[indexPath.section];
    return taskTablecell;
}

#pragma mark --lazyload

- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight-NavBar_Height) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
