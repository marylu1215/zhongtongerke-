//
//  RecoTopicListViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "RecoTopicListViewController.h"
#import "SSHotAticleTableCell.h"
#import "PostDetailViewController.h"
#import "UIBarButtonItem+Common.h"
#import "EditContentsViewController.h"

@interface RecoTopicListViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *forumArray;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;

@end

@implementation RecoTopicListViewController

-(NSMutableArray *)forumArray
{
    if (!_forumArray) {
        
        _forumArray = [NSMutableArray new];
    }
    return _forumArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.hotGroup) {
        
         self.title = self.hotGroup.group_name;
    }
   
    else
    {
        self.title = self.topTitle.title;
    }
    
    
    [self.view addSubview:self.tableView];
    
    
    // 添加刷新控件
    [self setUpRefresh];
    
    if (![self.topTitle.title isEqualToString:@"全部"]) {
       
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"发表" target:self action:@selector(clickAction) font:font(Font15) color:c255255255 highlightColor:c255255255];
    }
   
}

-(void)clickAction
{
    
    [self.navigationController pushViewController: [UserTool user].userid.length?[EditContentsViewController new]:[LoginViewController new] animated:YES];
    
}
- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadAllTopicForum)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreAllTopicForum)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadAllTopicForum
{
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    
    if (self.hotGroup) {
       
        params[@"qzid"] = self.hotGroup.cid;
        
    }
    params[@"p"] = @(self.pageNum);
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:self.hotGroup?getQz_tzForum:getAllTopicForum params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.forumArray removeAllObjects];
            NSArray *tempArr = [Forum mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.forumArray addObjectsFromArray:tempArr];
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



- (void)loadMoreAllTopicForum
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (self.hotGroup) {
        
        params[@"qzid"] = self.hotGroup.cid;
        
    }
    params[@"p"] = @(page);
    self.params = params;
    
    [HttpTool postWithURL:self.hotGroup?getQz_tzForum:getAllTopicForum  params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            // 转模型
            NSArray *tempArr = [Forum mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.forumArray addObjectsFromArray:tempArr];
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
    
    if (self.forumArray.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return self.forumArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SSHotAticleTableCell *cell = [SSHotAticleTableCell cellWithTableView:tableView];
    cell.forum = self.forumArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    PostDetailViewController *detailVC =        [PostDetailViewController new];
    detailVC.forum = self.forumArray[indexPath.row];
    [self.navigationController pushViewController:[UserTool user].userid.length?detailVC:[LoginViewController new] animated:YES];
    
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight -  NavBar_Height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
           }
    return _tableView;
}


@end
