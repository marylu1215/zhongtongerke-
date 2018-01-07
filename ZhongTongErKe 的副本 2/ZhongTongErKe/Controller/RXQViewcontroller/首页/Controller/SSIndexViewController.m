//
//  SSIndexViewController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/4/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSIndexViewController.h"
#import "UIBarButtonItem+Common.h"
#import "SSIndexHeadView.h"
#import "SSTableViewHeader.h"
#import "SSTableViewFooter.h"
#import "SSTableCellButton.h"
#import "SSConsultTableCell.h"
#import "SSHotAticleTableCell.h"
#import "SSHotKPTableCell.h"
#import "VideoListTableCell.h"
#import "SSHotProConsultController.h"
#import "searchView.h"
#import "SearchRecordViewController.h"
#import "EvaluatHealthViewController.h"
#import "JFCityViewController.h"
#import "JFLocation.h"
#import "CJVideoPlayer.h"
#import "Video.h"
#import "HealthCurriculumViewController.h"
#import "DyfViewController.h"
#import "PostDetailViewController.h"
#import "UserTool.h"
#import "SSHealthPlanController.h"
#import "PopScience.h"
#import "Forum.h"
#import "ExConsult.h"
#import "SSInterrogationViewController.h"
#import "SSSubjectListController.h"
#import "yichuantestViewController.h"
@interface SSIndexViewController ()<UITableViewDelegate,UITableViewDataSource,SSIndexHeadViewDelegate,JFLocationDelegate>
{
    NSIndexPath *_indexPath;
    CJVideoPlayer *_player;
    CGRect _currentPlayCellRect;
}

@property(nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong) searchView *searchView;
@property (nonatomic,strong)  UIButton *locationButton;
@property (nonatomic, strong) JFLocation *locationManager;
@property (nonatomic, strong)  Video *reVideo;

@property (nonatomic ,strong) NSArray *popScienceArray;
@property (nonatomic ,strong) NSArray *forumArray;
@property (nonatomic ,strong) NSArray *exConsultArray;
@property (nonatomic ,strong) NSArray *videoArray;
@end

@implementation SSIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self setNavi];
    [self.view addSubview:self.tableview];
    [self setTableHeaderView];
    self.locationManager = [[JFLocation alloc] init];
    _locationManager.delegate = self;
    
   
}

-(void)setNavi;
{
    
   self.locationButton = [UIButton addLeftImage:LocationImageName WithTitle:@"成都" AndTitleColor:c255255255 AndTitleFont:15];
   self.locationButton.titleEdgeInsets =UIEdgeInsetsMake(0, 5, 0, 0);
   self.locationButton.frame = CGRectMake(0, 0, self.locationButton.imageView.image.size.width+[NSString backSizeWithText:self.locationButton.titleLabel.text andFont:font(15)].width+10,self.locationButton.imageView.image.size.height);
    [self.locationButton addTarget:self action:@selector(locationAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.locationButton];
    
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"massage" hightImage:nil selectImage:nil target:self action:@selector(rightBarButtonTaped:)];
    
    
    _searchView = [[searchView alloc]initWithSearchBarEditDidChange:^(NSString *text) {

    } SearchBegin:^(NSString *kWords, BOOL isSeletedPopTable, NSUInteger index) {
    
    }];
    
    _searchView.sd_layout.heightIs(px(52)).widthIs(200);
    self.navigationItem.titleView = _searchView;
    _searchView.placeholder = @"搜索医生、药、资讯";
    _searchView.searchBar.userInteractionEnabled = NO;
    [_searchView addGestureRecognizer:   [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGer)]];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [_player destroyPlayer];
    _player = nil;
}

-(void)tapGer
{
    [self.navigationController pushViewController:[SearchRecordViewController new]  animated:YES];
    
}

- (void)addPlan
{
    
}
-(void)setTableHeaderView;
{
    
    SSIndexHeadView *headerview = [SSIndexHeadView loadHeaderView];
    headerview.delegate = self;
    headerview.frame = CGRectMake(0, 0, kScreenWidth, px(340)+px(166)+px(160)+px(260));
    __weak typeof (self) weakSelf = self;
    headerview.chooseBlock = ^()
    {
        [weakSelf.navigationController pushViewController:[HealthCurriculumViewController new] animated:YES];
   
        
    };
    
    headerview.healthView.moreBlock =^()
    {
         [weakSelf.navigationController pushViewController:[EvaluatHealthViewController new] animated:YES];
     
    };
    
    
    headerview.healthView.selectBlock = ^(Assessment *assessment) {
        SSSubjectListController *subjectVC =   [SSSubjectListController new];
        subjectVC.assessment = assessment;
        [weakSelf.navigationController pushViewController:subjectVC animated:YES];
    };
    
    self.tableview.tableHeaderView = headerview;
}
//** 定位 */
-(void)locationAction
{
    JFCityViewController *cityViewController = [[JFCityViewController alloc] init];
    cityViewController.title = @"城市";
    __weak typeof(self) weakSelf = self;
    //  你选择城市后的回调，cityName即你选择的城市
    [cityViewController choseCityBlock:^(NSString *cityName) {
        [weakSelf.locationButton setTitle:cityName forState:UIControlStateNormal];
       weakSelf.locationButton.frame = CGRectMake(0, 0, self.locationButton.imageView.image.size.width+[NSString backSizeWithText:self.locationButton.titleLabel.text andFont:font(15)].width+10,self.locationButton.imageView.image.size.height);
           }];
    [self.navigationController pushViewController:cityViewController animated:YES];
}



-(void)loadData
{
    [self loadVideoScience];
    [self loadHomeAllForum];
    
}

-(void)loadVideoScience
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"p"] = @1;
    params[@"biaoshi"] = @"1";
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

-(void)loadHomeAllForum
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getHomeAllForum params:params success:^(id json) {
        
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json))
        {
            self.forumArray = [Forum mj_objectArrayWithKeyValuesArray:json[@"jprt"]];
            
            self.popScienceArray = [PopScience mj_objectArrayWithKeyValuesArray:json[@"rmkp"]];
            
            self.exConsultArray = [ExConsult mj_objectArrayWithKeyValuesArray:json[@"zjzx"]];
            
            [self.tableview reloadData];
            
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

- (void)collectionItemTaped:(NSInteger)index{
    switch (index) {
        case 0:
        {
            [self.navigationController pushViewController:[EvaluatHealthViewController new] animated:YES];
        }
            break;
            
        case 1:
        {
           
            SSHealthPlanController *vc = [[SSHealthPlanController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
            
        case 2:
        {
//             [self.navigationController pushViewController:[HealthCurriculumViewController new] animated:YES];
            //[MBProgressHUD showError:@"程序猿正在努力开发中....."];
            yichuantestViewController *yichuan = [[yichuantestViewController alloc]init];
            
            [self.navigationController pushViewController:yichuan animated:YES];
        }
            break;
        case 3:
        {
            //签到
            [self signIn];
            
        }
        default:
            break;
    }
}

#pragma mark datasourse delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return px(320);
        }
        return px(150);
    }
    
    return 64;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return px(20);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        
        return self.exConsultArray.count;
    }
    
    else if (section==1)
    {
        return self.forumArray.count;
    }
    else
    {
        return self.popScienceArray.count+1;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SSTableViewHeader *headerView = [[SSTableViewHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 25)];
    headerView.imageView.image = [UIImage imageNamed:index_sectionIconImageName];
    [headerView.button setTitleColor:[UIColor colorWithRed:(float)63/255.0 green:(float)230/255.0 blue:(float)216/255.0 alpha:1.000] forState:UIControlStateNormal];
    if (section == 1) {
        headerView.label.text = @"精品热帖";
    }else if (section == 2){
        headerView.label.text = @"热门科普";
    }else{
       headerView.label.text = @"热门专家咨询";
    }
    
    [headerView.button setTitle:@"更多>>" forState:UIControlStateNormal];
    [headerView.button addTarget:self action:@selector(hotProConsultMoreButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    headerView.button.tag = section;
    headerView.backgroundColor = [UIColor whiteColor];
    return headerView;
}

#pragma mark --headview delegate
- (void)hotProConsultMoreButtonTaped:(UIButton *)button
{
    switch (button.tag) {
        case 0:
        {
            SSHotProConsultController *vc = [[SSHotProConsultController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
            
        default:
        {
            self.tabBarController.selectedIndex = button.tag+1;
        }
           
            break;
    }
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    if (indexPath.section == 0) {
        
        SSConsultTableCell *cell = [SSConsultTableCell cellWithTableView:tableView];
        cell.exConsult = self.exConsultArray[indexPath.row];
        cell.listenButton.tag = indexPath.row;
        __weak typeof (self) weakSelf = self;
        cell.listenBlock = ^(UIButton *button)
        {
            
            DyfViewController *dyfVC = [DyfViewController new];
            
            dyfVC.exConsult = self.exConsultArray[button.tag];
        
            [weakSelf.navigationController pushViewController:dyfVC animated:YES];
        };
        
        return cell;
    }
    
    else if (indexPath.section == 1){
        SSHotAticleTableCell *cell = [ SSHotAticleTableCell cellWithTableView:tableView];
        cell.forum = self.forumArray[indexPath.row];
        return cell;
    }
    
    else {
       
        if (indexPath.row == 0) {
            VideoListTableCell *videoListCell = [VideoListTableCell cellWithTableView:tableView];
            videoListCell.video = self.videoArray[indexPath.row];
            __weak typeof (self) weakSelf =self;
            videoListCell.playButton.tag = indexPath.row;
            
            videoListCell.playVideoBlock = ^(UIButton *button)
            {
                [weakSelf showVideoPlayer:button];
            };
            return videoListCell;

        }
        
        else
        {
            SSHotKPTableCell *hotKPcell = [SSHotKPTableCell cellWithTableView:tableView];
            hotKPcell.popScience = self.popScienceArray[indexPath.row-1];
            return hotKPcell;
        }
    
    }
    

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        
        PostDetailViewController *detailVC =        [PostDetailViewController new];
        detailVC.forum = self.forumArray[indexPath.row];
        [self.navigationController pushViewController:[UserTool user].userid.length?detailVC:[LoginViewController new] animated:YES];
    }
    
}
-(void)showVideoPlayer:(UIButton  *) button
{
    [_player destroyPlayer];
    _player = nil;
    
    Video  *video = self.videoArray[button.tag];
    
    _indexPath = [NSIndexPath indexPathForRow:0 inSection:2];
    VideoListTableCell *cell = [self.tableview  cellForRowAtIndexPath:_indexPath];
    _player = [[CJVideoPlayer alloc] init];
    _player.videoUrl = video.url;
    [_player palyerBindTableView:self.tableview atIndexPath:_indexPath];
    _player.frame = button.superview.bounds;
    [cell.contentView addSubview:_player];
    
    _player.completedPlayingBlock = ^(CJVideoPlayer *player) {
        [player destroyPlayer];
        _player = nil;
    };
}

#pragma mark-UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableview) {
        [_player isSupportSmallWindowPlaying:YES];
    }
}

-(void)signIn
{
    kshowMessage(@"签到中...");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = [UserTool user].userid;
    
    [HttpTool postWithURL:signJifen params:params success:^(id json) {
        
        if (jsonMsg(json)) {
            
            [MBProgressHUD showSuccess:@"签到成功"];
        }
        kHideHUDAll;
        
    } failure:^(NSError *error) {
         kHideHUDAll;
    }];
}


#pragma mark --action

- (void)leftBarButtonTaped:(UIButton *)sender{

}
- (void)rightBarButtonTaped:(UIButton *)sender{

}

/// 定位中
- (void)locating
{
    
}

/**
 当前位置
 
 @param locationDictionary 位置信息字典
 */
- (void)currentLocation:(NSDictionary *)locationDictionary
{
    NSString *city = [locationDictionary valueForKey:@"City"];
    
    [self.locationButton setTitle:city forState:UIControlStateNormal];
    self.locationButton.frame = CGRectMake(0, 0, self.locationButton.imageView.image.size.width+[NSString backSizeWithText:self.locationButton.titleLabel.text andFont:font(15)].width+10,self.locationButton.imageView.image.size.height);
}

/**
 拒绝定位后回调的代理
 
 @param message 提示信息
 */
- (void)refuseToUsePositioningSystem:(NSString *)message
{
    
}

/**
 定位失败回调的代理
 
 @param message 提示信息
 */
- (void)locateFailure:(NSString *)message{
    
}


- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavBar_Height-TabBar_Height) style:UITableViewStyleGrouped];
        _tableview.dataSource = self;
        _tableview.delegate = self;
    }
    return _tableview;
}

@end
