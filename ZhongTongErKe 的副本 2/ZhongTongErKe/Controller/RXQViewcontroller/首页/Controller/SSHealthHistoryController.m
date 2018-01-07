//
//  SSHealthHistoryController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/6.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHealthHistoryController.h"
#import "SSHealthHistoryTableCell.h"
#import "BasicInforViewController.h"
#import "SSHomeMemberTableCell.h"
#import "UserTool.h"
#import "FamilyGroup.h"
#import "UIBarButtonItem+Common.h"
#import "SSHealthHistoryDetailController.h"
#import "BasicInforViewController.h"


@interface SSHealthHistoryController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *familyGroupArray;

@end

@implementation SSHealthHistoryController

-(NSMutableArray *)familyGroupArray
{
    if (!_familyGroupArray) {
        
        _familyGroupArray = [NSMutableArray new];
    }
    
    return _familyGroupArray;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"健康史";
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:plusIconImageName hightImage:plusIconImageName selectImage:plusIconImageName target:self action:@selector(addAction)];
}

-(void)addAction
{
    
  BasicInforViewController *inforVC = [BasicInforViewController new];
    inforVC.type = @"健康史";
    
    [self.navigationController pushViewController:inforVC animated:YES];
}
-(void)loadData
{
    [super loadData];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userid"] = [UserTool user].userid;
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    
    [HttpTool postWithURL: getPartyFamily params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            NSArray *tempArr = [FamilyGroup mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self changeFamilyGroupArray:tempArr];
            
            
        }
        else
        {
            [MBProgressHUD showError:json[@"msg"]];
            
        }
        
        kHideHUDAll;
    } failure:^(NSError *error) {
        
        netWorkError;
        kHideHUDAll;
    }];
    
    
}
-(void)changeFamilyGroupArray:(NSArray *)groupArray
{
    for (int index=0; index<groupArray.count; index++)
    {
        FamilyGroup *familyGroup = groupArray[index];
        familyGroup.sortNum = index+1;
        [self.familyGroupArray addObject:familyGroup];
    }
    
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --datasource delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80*kScreenHeightScale;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.familyGroupArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSHomeMemberTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = BACKGROUND_COLOR;
    cell.group = self.familyGroupArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   SSHealthHistoryDetailController  *healthHistoryVC = [SSHealthHistoryDetailController new];
//    perFileVC.familyGroup = self.familyGroupArray[indexPath.row];
    [self.navigationController pushViewController:healthHistoryVC  animated:YES];
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[SSHomeMemberTableCell class] forCellReuseIdentifier:@"cell"];
    }
    
    return _tableView;
}


@end
