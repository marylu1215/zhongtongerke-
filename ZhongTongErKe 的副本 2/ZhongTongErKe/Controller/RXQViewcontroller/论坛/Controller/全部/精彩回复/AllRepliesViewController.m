//
//  AllRepliesViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "AllRepliesViewController.h"
#import "ReplyNote.h"
#import "WonderfulAnswerCell.h"
#import "PostDetailViewController.h"

@interface AllRepliesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *replyMuArr;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@end

@implementation AllRepliesViewController

-(NSMutableArray *)replyMuArr
{
    if (!_replyMuArr) {
        
        _replyMuArr = [NSMutableArray new];
    }
    return _replyMuArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =@"所有回复";
    [self.view addSubview:self.tableView];
    // 添加刷新控件
    [self setUpRefresh];
}

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadAllJchfForum)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreJchfForum)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadAllJchfForum
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getAllJchfForum params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.replyMuArr removeAllObjects];
            NSArray *tempArr = [ReplyNote mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.replyMuArr addObjectsFromArray:tempArr];
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



- (void)loadMoreJchfForum
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"p"] = @(page);
    self.params = params;
    
    [HttpTool postWithURL: getAllJchfForum params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
     
            // 转模型
            NSArray *tempArr = [ReplyNote mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.replyMuArr addObjectsFromArray:tempArr];
            
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
    
    if (self.replyMuArr.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.replyMuArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WonderfulAnswerCell *cell = [WonderfulAnswerCell cellWithTableView:tableView];
    cell.replyNote = self.replyMuArr[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WonderfulAnswerCell  *cell =  (WonderfulAnswerCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    PostDetailViewController *detailVC =        [PostDetailViewController new];
    detailVC.forum = [Forum new];
    ReplyNote *replyNote = self.replyMuArr[indexPath.row];
    detailVC.forum.cid = replyNote.cid;
    [self.navigationController pushViewController:[UserTool user].userid.length?detailVC:[LoginViewController new] animated:YES];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight -  NavBar_Height- TabBar_Height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


@end
