//
//  SVideoTableViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SVideoTableViewController.h"
#import "SSMyColletionAticleCell.h"
#import "VideoPlayView.h"
#import "SVideoHeaderView.h"
#import "CJVideoPlayer.h"
#import "VideoListTableCell.h"
#import "LMImageView.h"

@interface SVideoTableViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    NSIndexPath *_indexPath;
    CJVideoPlayer *_player;
    CGRect _currentPlayCellRect;
}
@property (nonatomic ,strong) NSArray *myModelArray;

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic ,copy) NSString *tipStr;

@property (nonatomic ,strong) NSMutableArray *videoMutableArray;
@property (nonatomic, assign) NSInteger rollCount;

@end

@implementation SVideoTableViewController
-(NSMutableArray *)videoMutableArray
{
    if (!_videoMutableArray) {
        
        _videoMutableArray = [NSMutableArray new];
    }
    return _videoMutableArray;
}
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
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加刷新控件
    [self setUpRefresh];
    
}

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadVideoScience)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreVideoScience)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadVideoScience
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
     params[@"biaoshi"] = @"0";
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getVideoScience params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.videoMutableArray removeAllObjects];
            NSArray *tempArr = [Video mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.videoMutableArray addObjectsFromArray:tempArr];
            [self.tableView reloadData];
        }
        else
        {
            [MBProgressHUD showError:json[@"msg"]];
            
        }
        // 监测footer状态
        [self checkFooterStatus];
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



- (void)loadMoreVideoScience
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"p"] = @(page);
    params[@"biaoshi"] = @"0";
    self.params = params;
    
    [HttpTool postWithURL:getVideoScience params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            // 转模型
            NSArray *tempArr = [Video mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.videoMutableArray addObjectsFromArray:tempArr];
            // 刷新表格
            [self.tableView reloadData];
            self.pageNum = page;
            self.rollCount = page;
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
    
    if (self.videoMutableArray.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)showVideoPlayer:(UIButton *) btn
//{
//    [_player destroyPlayer];
//    _player = nil;
//    
//    UIView *tapView = btn.superview;
//    _indexPath = [NSIndexPath indexPathForRow:0 inSection:btn.tag];
//    _player = [[CJVideoPlayer alloc] init];
//    
//    _player.videoUrl = @"http://flv6.bn.netease.com/videolib3/1706/07/pxGEP9707/SD/pxGEP9707-mobile.mp4";
//    
//    [_player palyerBindTableView:self.tableView atIndexPath:_indexPath];
//    _player.frame = CGRectMake(0, 0, kScreenWidth, px(300));
//    [tapView addSubview:_player];
//    
//    _player.completedPlayingBlock = ^(CJVideoPlayer *player) {
//        [player destroyPlayer];
//        _player = nil;
//    };
//}


#pragma mark-UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        [_player isSupportSmallWindowPlaying:YES];
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.videoMutableArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    SSMyColletionAticleCell  *cell = [SSMyColletionAticleCell cellWithTableView:tableView];
//    cell.video =  self.videoMutableArray[indexPath.section];
    
    VideoListTableCell *videoListCell = [VideoListTableCell cellWithTableView:tableView];
    videoListCell.video = self.videoMutableArray[indexPath.section];
    __weak typeof (self) weakSelf =self;
    videoListCell.playButton.tag = indexPath.section;
    
    videoListCell.playVideoBlock = ^(UIButton *button)
    {
        [weakSelf showVideoPlayer:button];
    };
    videoListCell.collectButton.tag = indexPath.section;
    
    
   videoListCell.collectBlock = ^(UIButton *btn) {
       
       [weakSelf collectAction:btn];
       
   };
    
    return videoListCell;
}

-(void)collectAction:(UIButton *)button
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    Video *video = self.videoMutableArray[button.tag];
    
    params[@"scid"] = video.cid;
    params[@"userid"] = [UserTool user].userid;
    [MBProgressHUD showMessage:@"收藏中..."];
    [HttpTool postWithURL:scspParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
           
            [MBProgressHUD showSuccess:@"收藏成功!"];
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
-(void)showVideoPlayer:(UIButton  *) button
{
    [_player destroyPlayer];
    _player = nil;
    
    Video  *video = self.videoMutableArray[button.tag];
    
    _indexPath = [NSIndexPath indexPathForRow:0 inSection:button.tag];
    VideoListTableCell *cell = [self.tableView  cellForRowAtIndexPath:_indexPath];
    _player = [[CJVideoPlayer alloc] init];
    _player.videoUrl = video.url;
    [_player palyerBindTableView:self.tableView atIndexPath:_indexPath];
    _player.frame = button.superview.bounds;
    [cell.contentView addSubview:_player];
    
    _player.completedPlayingBlock = ^(CJVideoPlayer *player) {
        [player destroyPlayer];
        _player = nil;
    };
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    SSMyColletionAticleCell  *cell =  (SSMyColletionAticleCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
//    return cell.bounds.size.height;
    
    return px(348);
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return CGFLOAT_MIN;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//  
//    SVideoHeaderView *headerView = [[SVideoHeaderView  alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,  px(300)) VideoArray: @[self.videoMutableArray[section]]];
//    __weak typeof (self) weakSelf = self;
//    headerView.clickViewBlock = ^(UIButton *btn)
//    {
//        [weakSelf showVideoPlayer:btn];
//    };
//    
//    return headerView;
//    
//}

- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight-NavBar_Height-TabBar_Height-33) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = c255255255;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    return _tableView;
}

@end
