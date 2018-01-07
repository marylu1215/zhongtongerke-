
//
//  ColVideoViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "ColVideoViewController.h"
#import "Video.h"
#import "UserTool.h"
#import "VideoListTableCell.h"
#import "CJVideoPlayer.h"
@interface ColVideoViewController ()<UIScrollViewDelegate>
{
    NSIndexPath *_indexPath;
    CJVideoPlayer *_player;
    CGRect _currentPlayCellRect;
}

@property (nonatomic ,strong) NSMutableArray *videoArray;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;

@end

@implementation ColVideoViewController

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
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadAllVideoParty)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreVideoParty)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadAllVideoParty
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
    params[@"userid"] = [UserTool user].userid;
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:scVideo_listParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.videoArray removeAllObjects];
            NSArray *tempArr = [Video  mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.videoArray addObjectsFromArray:tempArr];
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



- (void)loadMoreVideoParty
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"p"] = @(page);
    params[@"userid"] = [UserTool user].userid;
    self.params = params;
    
    [HttpTool postWithURL:scVideo_listParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            NSArray *tempArr = [Video mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.videoArray addObjectsFromArray:tempArr];
            
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.videoArray.count;
}

-(void)showVideoPlayer:(UIButton  *) button
{
    [_player destroyPlayer];
    _player = nil;
    
    Video  *video = self.videoArray[button.tag];
    
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


- (void)checkFooterStatus
{
    
    if (self.videoArray.count <= 0) {
        
    }
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.videoArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return px(348);}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   VideoListTableCell  *videoListCell = [VideoListTableCell cellWithTableView:tableView];
    Video *video = self.videoArray[indexPath.row];
   videoListCell.video = video;
    
    __weak typeof (self) weakSelf =self;
    videoListCell.playButton.tag = indexPath.section;
    
    videoListCell.playVideoBlock = ^(UIButton *button)
    {
        [weakSelf showVideoPlayer:button];
    };
    return videoListCell;

  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)videoArray
{
    if (!_videoArray) {
        
        _videoArray = [NSMutableArray new];
    }
    return _videoArray;
}


@end
