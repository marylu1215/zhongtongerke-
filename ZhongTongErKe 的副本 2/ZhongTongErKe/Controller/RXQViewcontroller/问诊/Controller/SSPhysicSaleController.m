//
//  SSPhysicSaleController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/23.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPhysicSaleController.h"
#import "SSPhsicSaleDetailController.h"
#import "AcThemeView.h"
#import "ThemeSectionView.h"
#import "SSPhysicSaleCell.h"
#import "CJVideoPlayer.h"
#import "ReVideo.h"
#import "VideoTableViewCell.h"
#import "ActivitieTheme.h"

@interface SSPhysicSaleController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    NSIndexPath *_indexPath;
    CJVideoPlayer *_player;
    CGRect _currentPlayCellRect;
}


@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)   NSArray *sectionTitleArr;

@property (nonatomic ,strong) NSArray *activityArray;

@property (nonatomic ,strong) NSArray *videoArray;


@end

@implementation SSPhysicSaleController
- (CJVideoPlayer *)player {
    if (!_player) {
        _player = [[CJVideoPlayer alloc] init];
        _player.frame = CGRectMake(0, 0, kScreenWidth, px(454));
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

    self.title = @"主题活动";
   
    AcThemeView *acThemeView = [[AcThemeView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(732))];
    self.tableView.tableHeaderView = acThemeView;
    
    UIButton *button = [UIButton addBtnWithTitle:@"在线咨询" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(consultAction)];
    button.backgroundColor = cHBColor;
    [self.view addSubview:button];
    button.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view,0);
}

//在线咨询
-(void)consultAction
{
    
}
-(void)loadData
{
    [super loadData];

    [self loadActivity];
    [self loadVideoScience];
    
}

-(void)loadActivity
{
    kshowMessage(@"数据加载中");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    
    [HttpTool postWithURL:getPackageParty params:params success:^(id json) {
        
        
        
        if (jsonMsg(json)) {
            
            self.activityArray = [ActivitieTheme mj_objectArrayWithKeyValuesArray:json[@"data"]];
            
            [self.tableView reloadData];
        }
        kHideHUDAll;
        
    } failure:^(NSError *error) {
        netWorkError;
        kHideHUDAll;
    }];
}
-(void)loadVideoScience
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"p"] = @1;
    params[@"biaoshi"] = @"2";
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getVideoScience params:params success:^(id json) {
        
        ICLog(@"%@",json);
        
        if (jsonMsg(json)) {
            
            self.videoArray =   [NSArray getIntendWithIntendNum:1 IntendArr:[Video mj_objectArrayWithKeyValuesArray:json[@"data"]]];
            
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --delegate  datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return px(66);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    ThemeSectionView *headerView = [[ThemeSectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(66)) WithSectionTitle:self.sectionTitleArr[section]];
    
    return headerView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return CGFLOAT_MIN;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return self.videoArray.count;
    }
    else
    {
        return self.activityArray.count;
    }
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
       VideoTableViewCell *cell = [VideoTableViewCell cellWithTableView:tableView];
    
        Video *reVideo = self.videoArray[indexPath.row];
        cell.video = reVideo;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showVideoPlayer:)];
        [cell.videoPlayView addGestureRecognizer:tap];
        cell.videoPlayView.tag = indexPath.row + 100;
        return cell;
    }
    else
    {
        SSPhysicSaleCell *cell = [SSPhysicSaleCell cellWithTableView:tableView];
        cell.activitieTheme = self.activityArray[indexPath.row];
        return cell;
    }
  
}

-(void) showVideoPlayer:(UIGestureRecognizer *) ges
{
    [_player destroyPlayer];
    _player = nil;
    
    UIView *tapView = ges.view;
    Video *reVideo = self.videoArray[tapView.tag - 100];
    _indexPath = [NSIndexPath indexPathForRow:tapView.tag - 100 inSection:0];
   VideoTableViewCell *cell = [self.tableView cellForRowAtIndexPath:_indexPath];
    _player = [[CJVideoPlayer alloc] init];
    _player.videoUrl = reVideo.url;
    [_player palyerBindTableView:self.tableView atIndexPath:_indexPath];
    _player.frame = tapView.bounds;
    [cell.contentView addSubview:_player];
    
    _player.completedPlayingBlock = ^(CJVideoPlayer *player) {
        [player destroyPlayer];
        _player = nil;
    };
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return px(414);
    }
    else
    {
        return px(362);
    }
}
#pragma mark-UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        [_player isSupportSmallWindowPlaying:YES];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==1) {
        
        SSPhsicSaleDetailController *detailVC = [[SSPhsicSaleDetailController alloc]init];
        
        detailVC.activitieTheme = self.activityArray[indexPath.row];
        
        
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    }
  


-(NSArray *)videoArray
{
    if (!_videoArray) {
        
       Video *reVideo = [[Video alloc]init];
        reVideo.url =  @"http://flv6.bn.netease.com/videolib3/1706/07/pxGEP9707/SD/pxGEP9707-mobile.mp4";
        reVideo.title = @"四川公共频道";
        reVideo.see =@"100";
        _videoArray  = @[reVideo];
    }
    
    return _videoArray;
}
-(NSArray *)sectionTitleArr
{
    if (!_sectionTitleArr) {
        
        _sectionTitleArr = @[@"媒体聚焦",@"近期活动"];
    }
    
    return _sectionTitleArr;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavBar_Height-TabBar_Height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
         [self.view addSubview:self.tableView];
    }
    return _tableView;
}

@end
