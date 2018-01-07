//
//  SSDocInformationController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSDocInformationController.h"
#import "SSGoodsForSaleController.h"
#import "SectionHeaderView.h"
#import "SSDocInformationHeader.h"
#import "Doctor.h"
#import "SSDocInformationCell.h"

@interface SSDocInformationController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *docotorMutableArray;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;

@end

@implementation SSDocInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"医生信息";
    [self.view addSubview:self.tableView];
   
     [self setUpRefresh];
    [self setHeaderView];
    [self setBottomView];
    
    
  
}

-(void)setHeaderView
{
    SSDocInformationHeader *headerView = [[SSDocInformationHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 130*kScreenHeightScale)];
    headerView.administrative = self.administrative;
    self.tableView.tableHeaderView = headerView;
}

-(void)setBottomView
{
    UIButton *bottomBtn = [UIButton addBtnWithTitle:@"预约服务" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(serviceAction)];
    bottomBtn.backgroundColor = cHBColor;
    [self.view addSubview:bottomBtn];
    bottomBtn.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view ,0);
}

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadDocoList)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDocoList)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadDocoList
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"id"] =  self.administrative.cid;
    params[@"p"] = @(self.pageNum);
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:searchPartyDepartment params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.docotorMutableArray removeAllObjects];
            NSArray *tempArr = [Doctor mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.docotorMutableArray addObjectsFromArray:tempArr];
            [self.tableView reloadData];
            
            
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


- (void)loadMoreDocoList
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = self.administrative.cid;
    params[@"p"] = @(page);
    self.params = params;
    
    [HttpTool postWithURL:searchPartyDepartment params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            // 转模型
            NSArray *tempArr = [Doctor mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.docotorMutableArray addObjectsFromArray:tempArr];
            // 刷新表格
            [self.tableView reloadData];
            self.pageNum = page;
            
            // 监测footer状态
            [self checkFooterStatus];
            // 结束刷新
            [self.tableView.mj_footer endRefreshing];
            
        }
        else
        {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
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
    
    
    if (self.docotorMutableArray.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}


- (void)viewWillAppear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = NO;
}



-(void)serviceAction
{
    [self.navigationController pushViewController:[SSGoodsForSaleController new] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --datasource delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.docotorMutableArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSDocInformationCell *cell = [SSDocInformationCell cellWithTableView:tableView];
    cell.checkButton.hidden = YES;
    cell.doctor = self.docotorMutableArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSDocInformationCell *cell =  (SSDocInformationCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return px(60);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  
     SectionHeaderView  *view = [[SectionHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 30) LeftImagrName:homeThemeImageName Info:@"专家团队" Margin:0];
    return view;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    }
    return _tableView;
}

-(NSMutableArray *)docotorMutableArray
{
    if (!_docotorMutableArray) {
        
        _docotorMutableArray = [NSMutableArray new];
    }
    return _docotorMutableArray;
}

@end
