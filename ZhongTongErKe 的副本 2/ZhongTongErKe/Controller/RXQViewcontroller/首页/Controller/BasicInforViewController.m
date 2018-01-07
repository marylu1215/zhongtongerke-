//
//  BasicInforViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "BasicInforViewController.h"
#import "SSHomeMemberTableCell.h"
#import "UserTool.h"
#import "FamilyGroup.h"
#import "UIBarButtonItem+Common.h"
#import "AddFamilyViewController.h"
#import "AllInforViewController.h"
#import "SSHealthHistoryDetailController.h"
#import "SSPersonFileListController.h"

@interface BasicInforViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *familyGroupArray;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic ,copy) NSString *tipStr;

@end

@implementation BasicInforViewController

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
    if ([self.type isEqualToString:@"健康档案"]) {
         self.title = @"成员列表";
    }
    else
    {
        self.title = @"基本资料";
    }
    
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:plusIconImageName hightImage:plusIconImageName selectImage:plusIconImageName target:self action:@selector(addAction)];
    
    // 添加刷新控件
    [self setUpRefresh];
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
   
    self.tabBarController.tabBar.hidden = NO;
}

-(void)addAction
{
    [self.navigationController pushViewController:[AddFamilyViewController new] animated:YES];
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
    
    [HttpTool postWithURL:getPartyFamily params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.familyGroupArray removeAllObjects];
          [self.familyGroupArray addObjectsFromArray: [FamilyGroup mj_objectArrayWithKeyValuesArray:json[@"data"]]];
            [self changeFamilyGroupArray:self.familyGroupArray];
            
            
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
- (void)loadMoreFamilyGroup
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userid"] = [UserTool user].userid;
    params[@"p"] = @(page);
    self.params = params;
    
    [HttpTool postWithURL:getPartyFamily params:params success:^(id json) {
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

-(void)changeFamilyGroupArray:(NSArray *)groupArray
{
    for (int index=0; index<groupArray.count; index++)
    {
        FamilyGroup *familyGroup = groupArray[index];
        familyGroup.sortNum = index+1;
    }
    
    // 刷新表格
    [self.tableView reloadData];
    
    // 结束刷新
    [self.tableView.mj_header endRefreshing];
    // 监测footer状态
    [self checkFooterStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if ([self.type isEqualToString:@"健康档案"]) {
        
        AllInforViewController  *allInforVC = [ AllInforViewController  new];
        allInforVC.familyGroup = self.familyGroupArray[indexPath.row];
        [self.navigationController pushViewController:allInforVC animated:YES];
    }
   else if ([self.type isEqualToString:@"健康史"])
   {
       [self.navigationController pushViewController:[SSHealthHistoryDetailController new] animated:YES];
       
   }
    
    else
    {
        SSPersonFileListController  *perFileVC = [SSPersonFileListController new];
        perFileVC.familyGroup = self.familyGroupArray[indexPath.row];
        [self.navigationController pushViewController:perFileVC animated:YES];
        
    }
   
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavBar_Height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[SSHomeMemberTableCell class] forCellReuseIdentifier:@"cell"];
    }
    
    return _tableView;
}


@end
