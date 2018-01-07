//
//  RedPointTableViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "RedPointTableViewController.h"
#import "SSMyColletionAticleCell.h"
#import "Article.h"
#import "HotPointSectionView.h"
#import "ReTopicView.h"
#import "ArDetailViewController.h"

@interface RedPointTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSIndexPath *_indexPath;
    CJVideoPlayer *_player;
    CGRect _currentPlayCellRect;
}
@property (nonatomic ,strong) NSMutableArray *articleMutableArray;

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic ,strong) NSArray *videoArray;

@end

@implementation RedPointTableViewController


- (CJVideoPlayer *)player {
    if (!_player) {
        _player = [[CJVideoPlayer alloc] init];
        _player.frame = CGRectMake(0, 0, kScreenWidth, px(300));
    }
    return _player;
}

- (void)viewWillDisappear:(BOOL)animated {
  
    [super viewWillDisappear:animated];
    
    [_player destroyPlayer];
    _player = nil;
}


-(NSMutableArray *)articleMutableArray
{
    if (!_articleMutableArray) {
        
        _articleMutableArray = [NSMutableArray new];
    }
    return _articleMutableArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 添加刷新控件
    [self setUpRefresh];
    
    [self loadVideoScience];
    
    
}
-(void)loadVideoScience
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"p"] = @1;
    params[@"biaoshi"] = @"3";
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getVideoScience params:params success:^(id json) {
       
        ICLog(@"%@",json);
        
        if (jsonMsg(json)) {
            
        self.videoArray =   [NSArray getIntendWithIntendNum:2 IntendArr:[Video mj_objectArrayWithKeyValuesArray:json[@"data"]]];
            
        }
        else
        {
            [MBProgressHUD showError:json[@"msg"]];
            
        }
        kHideHUDAll;
    } failure:^(NSError *error) {
        
        netWorkError;
        kHideHUDAll;
    }];
    
}


- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadHotScience)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreHotScience)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadHotScience
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getHotScience params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.articleMutableArray removeAllObjects];
            NSArray *remenArray = [Article mj_objectArrayWithKeyValuesArray:json[@"remen"]];
             NSArray *tuijianArray = [Article mj_objectArrayWithKeyValuesArray:json[@"tuijian"]];
            [self.articleMutableArray addObject:remenArray];
            [self.articleMutableArray addObject:tuijianArray];
            
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



- (void)loadMoreHotScience
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"p"] = @(page);
    self.params = params;
    
    [HttpTool postWithURL:getHotScience params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
         
            // 转模型
            [self.articleMutableArray removeAllObjects];
            NSArray *remenArray = [Article mj_objectArrayWithKeyValuesArray:json[@"remen"]];
            NSArray *tuijianArray = [Article mj_objectArrayWithKeyValuesArray:json[@"tuijian"]];
            [self.articleMutableArray addObject:tuijianArray];
            [self.articleMutableArray addObject:remenArray];
            
            
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
    
    if (self.articleMutableArray.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        
        ReTopicView *topicView = [[ReTopicView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(430))];
        topicView.video = self.videoArray[section];
        topicView.videoPlayView.playBtn.tag = section;
        [topicView.videoPlayView.playBtn addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
        
        return topicView;
    }
    else
    {
        HotPointSectionView  *pointView = [[HotPointSectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(430))];
        pointView.video = self.videoArray[section];
       pointView.videoPlayView.playBtn.tag = section;
        [pointView.videoPlayView.playBtn addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
        return pointView;
    }
  
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return px(430);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(20))];
    view.backgroundColor = sepBgColor;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return px(20);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.articleMutableArray.count) {
        NSArray *articleArray = self.articleMutableArray[section];
        return articleArray.count;
    }
    else return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSMyColletionAticleCell  *cell =  (SSMyColletionAticleCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SSMyColletionAticleCell  *cell = [SSMyColletionAticleCell cellWithTableView:tableView];
    NSArray *articArray = self.articleMutableArray[indexPath.section];
    cell.article = articArray[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ArDetailViewController *detailVC = [ArDetailViewController new];
     NSArray *articArray = self.articleMutableArray[indexPath.section];
    detailVC.article = articArray[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}
-(void)playAction:(UIButton *) btn
{
    [_player destroyPlayer];
    _player = nil;
    
    UIView *tapView = btn.superview;
    _indexPath = [NSIndexPath indexPathForRow:0 inSection:btn.tag];
    _player = [[CJVideoPlayer alloc] init];
    
    Video *video = self.videoArray[btn.tag];
    
    _player.videoUrl = video.url;
    
    [_player palyerBindTableView:self.tableView atIndexPath:_indexPath];
    _player.frame = btn.superview.superview.bounds;
    [tapView addSubview:_player];
    
    _player.completedPlayingBlock = ^(CJVideoPlayer *player) {
        [player destroyPlayer];
        _player = nil;
    };
}
#pragma mark-UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        [_player isSupportSmallWindowPlaying:YES];
    }
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
