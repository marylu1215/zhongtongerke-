//
//  SSAnswerTableViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSAnswerTableViewController.h"
#import "SSAnwserTableViewCell.h"
#import "Answer.h"
#import "LMMessageBtn.h"
#import "UserTool.h"

@interface SSAnswerTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *answerMuArr;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;

@end

@implementation SSAnswerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的问诊";
    
    LMMessageBtn *button = [[LMMessageBtn alloc] init];
    [button showRedPoint];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    [self.view addSubview:self.tableView];
    
    // 添加刷新控件
    [self setUpRefresh];
}

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadAllMyAskingParty)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreMyAskingParty)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadAllMyAskingParty
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
    params[@"userid"]= [UserTool user].userid;
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getMyAskingData params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.answerMuArr removeAllObjects];
            NSArray *tempArr = [Answer mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.answerMuArr addObjectsFromArray:tempArr];
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



- (void)loadMoreMyAskingParty
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"p"] = @(page);
    params[@"userid"]= [UserTool user].userid;
    self.params = params;
    
    [HttpTool postWithURL:getMyAskingData params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            NSArray *tempArr = [Answer mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.answerMuArr addObjectsFromArray:tempArr];
            
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
    
    if (self.answerMuArr.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}


-(void)verticalBtnClick
{
    
}


#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return px(20);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.answerMuArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSAnwserTableViewCell *cell =  (SSAnwserTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SSAnwserTableViewCell *cell = [SSAnwserTableViewCell cellWithTableView:tableView];
    Answer *answer = self.answerMuArr[indexPath.section];
    cell.answer = answer;
    return cell;
}

-(NSMutableArray *)answerMuArr
{
    if (!_answerMuArr) {
        
        _answerMuArr = [NSMutableArray new];
    }
    return _answerMuArr;
}
- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight-NavBar_Height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor=[UIColor colorWithHexString:@"e9e9e9"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return _tableView;
}

@end
