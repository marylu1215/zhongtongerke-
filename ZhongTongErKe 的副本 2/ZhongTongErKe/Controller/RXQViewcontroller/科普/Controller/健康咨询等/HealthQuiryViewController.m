//
//  HealthQuiryViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "HealthQuiryViewController.h"
#import "SSMyColletionAticleCell.h"
#import "ArDetailViewController.h"
#import "SortiView.h"

@interface HealthQuiryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) NSMutableArray *articleArray;
@property (nonatomic ,weak)  UIImageView *healthImageView;
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic ,copy) NSString *tipStr;
@end

@implementation HealthQuiryViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *healthImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:bannerImageName]];
    self.healthImageView = healthImageView;
    healthImageView.sd_layout.widthIs(kScreenWidth).heightIs(healthImageView.image.size.height);
    self.tableView.tableHeaderView = healthImageView;
    
    // 添加刷新控件
    [self setUpRefresh];
}

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadBabyScience)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreBabyScience)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadBabyScience
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
     self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:self.urlStr params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.articleArray removeAllObjects];
            NSArray *tempArr = [Article mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.articleArray addObjectsFromArray:tempArr];
          
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *bannerStr = json[@"banner"];
                
                [ self.healthImageView  sd_setImageWithURL: [NSURL URLWithString: [bannerStr containsString:@"http"]?bannerStr:[NSString stringWithFormat:@"%@%@",ImageBaseURL,bannerStr]]];
            });
            
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



- (void)loadMoreBabyScience
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
  
    params[@"p"] = @(page);
    self.params = params;
    
    [HttpTool postWithURL:self.urlStr  params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            // 转模型
            NSArray *tempArr = [Article mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.articleArray addObjectsFromArray:tempArr];
            // 刷新表格
            [self.tableView reloadData];
            self.pageNum = page;
            
            
        }
        else
        {
            [self.tableView.mj_footer endRefreshing];
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return px(60);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
      SortiView  *view = [[SortiView alloc]initWithFrame:CGRectMake(0, 0, px(118), px(60))];
    
    view.sortBlock = ^(BOOL isUp)
    {
        
    };
    
    return view;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SSMyColletionAticleCell  *cell = [SSMyColletionAticleCell cellWithTableView:tableView];
    Article *article = self.articleArray[indexPath.row];
    cell.article = article;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArDetailViewController *detailVC = [ArDetailViewController new];
    detailVC.article = self.articleArray[indexPath.row];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}
-(NSMutableArray *)articleArray
{
    if (!_articleArray) {
        
        _articleArray = [NSMutableArray new];
    }
    
    return _articleArray;
}
- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight -  NavBar_Height - 33 - TabBar_Height ) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = c255255255;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    return _tableView;
}

@end
