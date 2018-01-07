//
//  ColArticleViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "ColArticleViewController.h"
#import "SSMyColletionAticleCell.h"
#import "Article.h"
#import "UserTool.h"
#import "User.h"

@interface ColArticleViewController ()

@property (nonatomic ,strong) NSMutableArray *articleArray;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;

@end

@implementation ColArticleViewController

-(NSMutableArray *)articleArray
{
    if (!_articleArray) {
        
        _articleArray  = [NSMutableArray new];
    }
    return _articleArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    // 添加刷新控件
    [self setUpRefresh];
}

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadCollectionParty)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreCollectionParty)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}

-(void)loadCollectionParty
{
    
    kshowMessage(@"数据加载中...");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"userid"] = [UserTool user].userid;
    params[@"p"] = @(self.pageNum);
    self.params = params;
    [HttpTool postWithURL:collectionParty params:params success:^(id json) {
        
      
        
        if (jsonMsg(json)) {
            [self.articleArray removeAllObjects];
            // 转模型
            NSArray *tempArr = [Article mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.articleArray addObjectsFromArray:tempArr];
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



- (void)loadMoreCollectionParty
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userid"] = [UserTool user].userid;
    params[@"p"] = @(page);
    self.params = params;
    
    [HttpTool postWithURL:collectionParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            // 转模型
            NSArray *tempArr = [Article mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.articleArray addObjectsFromArray:tempArr];
            
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
  
    if (self.articleArray.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articleArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSMyColletionAticleCell  *cell =  (SSMyColletionAticleCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   SSMyColletionAticleCell  *cell = [SSMyColletionAticleCell cellWithTableView:tableView];
   Article *article = self.articleArray[indexPath.row];
    cell.article = article;
    return cell;
}
@end
