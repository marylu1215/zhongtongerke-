//
//  SSHomeMemberController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHomeMemberController.h"
#import "SSHomeMemberTableCell.h"
#import "UserTool.h"
#import "FamilyGroup.h"
#import "UIBarButtonItem+Common.h"
#import "AddFamilyViewController.h"
#import "AllInforViewController.h"
#import "BasicInforViewController.h"

@interface SSHomeMemberController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *familyGroupArray;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic ,copy) NSString *tipStr;
@end

@implementation SSHomeMemberController

-(NSMutableArray *)familyGroupArray
{
    if (!_familyGroupArray) {
        
        _familyGroupArray = [NSMutableArray new];
    }
    
    return _familyGroupArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"家庭成员档案";
    // 添加刷新控件
    [self setUpRefresh];
    
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:plusIconImageName hightImage:plusIconImageName selectImage:plusIconImageName target:self action:@selector(addAction)];
}
- (void)viewWillAppear:(BOOL)animated{
   
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
     self.tabBarController.tabBar.hidden = NO;
}

-(void)addAction
{
    
    BasicInforViewController *infoVC = [BasicInforViewController new];
    infoVC.type=@"健康档案";
    
    [self.navigationController pushViewController:infoVC animated:YES];
}

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadFamilyGroup)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreFamilyGroup)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadFamilyGroup
{
  
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
     self.pageNum = 1;
    params[@"userid"] = [UserTool user].userid;
    params[@"p"] = @(self.pageNum);
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL: getPartyFamily_jk params:params success:^(id json) {
    ICLog(@"json menu:%@",json);
        if (self.params != params) return;

        if (jsonMsg(json)) {
            
            // 转模型
            [self.familyGroupArray removeAllObjects];
             NSArray *tempArr = [FamilyGroup mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self changeFamilyGroupArray:tempArr];
            
           
        }
        else
        {
            [MBProgressHUD showError:json[@"msg"]];
            
        }
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
        kHideHUDAll;
    } failure:^(NSError *error) {
        if (self.params != params) return;
        
        [self.tableView.mj_header endRefreshing];
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
    
    // 刷新表格
    [self.tableView reloadData];
    
    // 结束刷新
    [self.tableView.mj_header endRefreshing];
    // 监测footer状态
    [self checkFooterStatus];
}

- (void)loadMoreFamilyGroup
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userid"] = [UserTool user].userid;
    params[@"p"] = @(page);
    self.params = params;
    
    [HttpTool postWithURL: getPartyFamily_jk params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
             // 转模型
            NSArray *tempArr = [FamilyGroup mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.familyGroupArray addObjectsFromArray:tempArr];
            // 刷新表格
            [self.tableView reloadData];
            self.pageNum = page;
            

        }
        else
        {
            self.tipStr = json[@"msg"];
        }
        // 监测footer状态
        [self checkFooterStatus];
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        kHideHUDAll;
    } failure:^(NSError *error) {
        if (self.params != params) return;
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        netWorkError;
        kHideHUDAll;
    }];

    
}

- (void)checkFooterStatus
{
   
    
    if ([self.tipStr isEqualToString:@"请添加家庭成员"])
    {
         [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }
    else
    {
       [self.tableView.mj_footer endRefreshing];
    }
    
    if (self.familyGroupArray.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
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
    
    AllInforViewController  *allInforVC = [ AllInforViewController  new];
    allInforVC.familyGroup = self.familyGroupArray[indexPath.row];
    [self.navigationController pushViewController:allInforVC animated:YES];
    
   
    
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
