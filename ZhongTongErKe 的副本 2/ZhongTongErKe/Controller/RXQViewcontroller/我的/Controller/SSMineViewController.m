//
//  SSMineViewController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/4/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSMineViewController.h"
#import "SSIntegrationTableViewController.h"
#import "SSAnswerTableViewController.h"
#import "SSSeverViceViewController.h"
#import "SettingTableViewController.h"
#import "SSMyColleationAticleController.h"//我的收藏
#import "SSHelpAndFeedbackController.h"//帮助与反馈
#import "SVideoTableViewController.h"
#import "LoginViewController.h"
#import "InviteFriendViewController.h"
#import "UserTool.h"
#import "User.h"
#import "SSAccountController.h"
#import "SSHealthTaskController.h"
#import "SSMineHeaderView.h"
#import "SSMineCell.h"
#import "SSPersonalFileController.h"
#import "SSPersonalFileController.h"

static NSString *cellIdentifier = @"cell";
@interface SSMineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,copy)NSMutableArray *dataArray;
@property (nonatomic,strong) SSMineHeaderView *headerViewview;
@property (nonatomic ,strong) User *user;

@end

@implementation SSMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
      self.headerViewview.user = self.user?self.user:[UserTool user];
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
   
}
-(void)configUI{
    [super configUI];
   
    UIView *zeroView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:zeroView];

    [self.view addSubview:self.tableView];
    self.headerViewview = [[SSMineHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 353*kScreenHeightScale)];
    
  
    __weak typeof (self) weakSelf = self;
    
    self.headerViewview.headClickBlock = ^()
    {
        
        if ([UserTool user].userid.length==0) {
            
            [weakSelf loginAction];  
        }
    };
    self.headerViewview.clickBlock = ^(SSMineHeaderButtonOne *button)
    {
        switch (button.tag) {
            case 0:
                
            [weakSelf deterLogorViewController:[ SSAccountController new]];
                break;
            case 1:
                  [weakSelf deterLogorViewController:[ SSIntegrationTableViewController new]];
               
                break;
                
            default:
                break;
        }
    };
    
    self.headerViewview.actionclickBlock = ^(SSMineHerderButtonTwo *button)
    {
        switch (button.tag) {
            case 2:
                    [weakSelf deterLogorViewController:[SSAnswerTableViewController new]];
                break;
            case 3:
              
                  [weakSelf deterLogorViewController:[ SSSeverViceViewController new]];
                break;
            case 4:
                  [weakSelf deterLogorViewController:[ SSHealthTaskController new]];
              
                break;
                
            default:
                break;
        }
    };
    self.tableView.tableHeaderView = self.headerViewview;
}


-(void)loginAction
{
    LoginViewController *loginVC = [LoginViewController new];
    loginVC.backUserBlock = ^(User *user)
    {
        self.headerViewview.user = user;
    };
    
    [self.navigationController pushViewController:loginVC animated:YES];
}
#pragma mark --delegate datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 3;
    }else{
        return 0;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSMineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.headImageView.image = [UIImage imageNamed:self.dataArray[indexPath.section][indexPath.row][0]];
    cell.headLabel.text = self.dataArray[indexPath.section][indexPath.row][1];
    cell.arrowImageView.image = [UIImage imageNamed:@"go-zyy"];
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 41*kScreenHeightScale;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 6*kScreenHeightScale;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 6*kScreenHeightScale)];
    view.backgroundColor = BACKGROUND_COLOR;
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
      
        SSPersonalFileController *perVC = [SSPersonalFileController new];
        perVC.user = self.user?self.user:[UserTool user];
         [self deterLogorViewController:[ SSPersonalFileController new]];
     
    }else if (indexPath.section == 0 && indexPath.row == 1) {
      
         [self deterLogorViewController:[SSMyColleationAticleController new]];
 
    }else if (indexPath.section == 1 && indexPath.row == 0) {
      
        [self.navigationController pushViewController:[ SSHelpAndFeedbackController new] animated:YES ];
      
    }
    else if (indexPath.section==1&&indexPath.row==1)
    {
        [self.navigationController pushViewController:[SettingTableViewController new] animated:YES ];
       
    }
    
    else
    {
        [self.navigationController pushViewController:[InviteFriendViewController new] animated:YES ];
    
    }
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[SSMineCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        NSArray *array = @[@[@[@"wd-healthrecord",@"健康档案"],@[@"wd-my-favorite",@"我的收藏"]],@[@[@"wd-help",@"帮助与反馈"],@[@"wd-install",@"设置"],@[@"wd-invite",@"邀请好友"]]];
        _dataArray = [NSMutableArray arrayWithArray:array];
    }
    return _dataArray;
}

-(void)deterLogorViewController:(UIViewController *)viewController
{
   
    if ( [UserTool user].userid.length) {
        
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else
    {
        [self.navigationController pushViewController:[LoginViewController new] animated:YES];
    }
}
@end
