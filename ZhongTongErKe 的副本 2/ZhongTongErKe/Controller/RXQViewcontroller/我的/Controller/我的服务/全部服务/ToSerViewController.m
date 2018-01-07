//
//  ToSerViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "ToSerViewController.h"
#import "CurrentServiceTableViewCell.h"
#import "UserTool.h"

@interface ToSerViewController ()

@property (nonatomic ,strong) NSMutableArray *myServicesMuArr;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;

@end

@implementation ToSerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpRefresh];
    
}


- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadMyServiceParty)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreMyServiceParty)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadMyServiceParty
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
    params[@"userid"] = [UserTool user].userid;
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getMy_serviceParty params:params success:^(id json) {
        
        ICLog(@"%@",json);
        
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.myServicesMuArr removeAllObjects];
            NSArray *tempArr = [MyServices mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.myServicesMuArr addObjectsFromArray:tempArr];
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
        
        [self.tableView.mj_header endRefreshing];
        netWorkError;
        kHideHUDAll;
    }];
    
}

- (void)loadMoreMyServiceParty
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"p"] = @(page);
    params[@"userid"] = [UserTool user].userid;
    self.params = params;
    
    [HttpTool postWithURL:getMy_serviceParty  params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            NSArray *tempArr = [MyServices  mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.myServicesMuArr addObjectsFromArray:tempArr];
            
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
    
    if (self.myServicesMuArr.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myServicesMuArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CurrentServiceTableViewCell  *cell =  (CurrentServiceTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CurrentServiceTableViewCell  *cell = [CurrentServiceTableViewCell cellWithTableView:tableView];
   MyServices *severVice = self.myServicesMuArr[indexPath.row];
    cell.myServices = severVice;
    return cell;
}

-(NSMutableArray *)myServicesMuArr
{
    if (!_myServicesMuArr) {
        
        _myServicesMuArr = [NSMutableArray new];
    }
    return _myServicesMuArr;
}


@end
