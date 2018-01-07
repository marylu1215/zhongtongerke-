//
//  ActivityTableViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

static NSString *headerIdentifier = @"header";

#import "ActivityTableViewController.h"
#import "SSHotGroupCell.h"
#import "HotGroup.h"
#import "PostDetailViewController.h"
#import "Forum.h"
#import "RecoTopicListViewController.h"
#import "AllRepliesViewController.h"
#import "AllHotGroupsViewController.h"
#import "SSHotAticleTableCell.h"
#import "SSForumIndexTableHeader.h"
#import "UserTool.h"
#import "LoginViewController.h"

@interface ActivityTableViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic ,strong) UIImageView *bannerImageView;
@property (nonatomic ,strong) NSArray *hotGroupArray;

@property (nonatomic ,strong) NSArray *titleArr;

@property (nonatomic ,strong) NSArray *forumArray;

@property (nonatomic ,strong) NSArray *replyMuArr;

@end

@implementation ActivityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    [self setHeaderView];
    self.titleArr = @[@"精彩话题",@"热门群组"];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}
-(void)setHeaderView
{
  
    self.bannerImageView = [[UIImageView alloc]init];
    [self.view addSubview:self.bannerImageView];
    UIImage *bannerImage = [UIImage imageNamed:bannerImageName];
    self.bannerImageView.sd_layout.widthIs(kScreenWidth).heightIs(bannerImage.size.height);
   
    [self.bannerImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImageBaseURL,self.activitytitle.img]] placeholderImage:bannerImage];
    self.tableView.tableHeaderView =  self.bannerImageView;
    
}
-(void)loadData
{
    //活动标题到教育标题页面话题列表和群组列表的显示
    [self loadActivityForum];
  
    
    
}
-(void)loadActivityForum
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"tid"] = self.activitytitle.cid;
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getActivityForum params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            NSArray *tempArr =
            [Forum mj_objectArrayWithKeyValuesArray:json[@"data" ]];
            
            self.forumArray = [NSArray getIntendWithIntendNum:5 IntendArr:tempArr];
            
            self.hotGroupArray = [HotGroup mj_objectArrayWithKeyValuesArray:json[@"hot_qz"]];
            
            [self.tableView reloadData];
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
#pragma mark --datasource delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==1) {
        return 1;
    }
   
    else
    {
        return self.forumArray.count;
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==0) {
        
        SSHotAticleTableCell *cell = [SSHotAticleTableCell     cellWithTableView:tableView];
        cell.forum = self.forumArray[indexPath.row];
        return cell;
    }
    
    else
    {
        SSHotGroupCell *cell = [SSHotGroupCell cellWithTableView:tableView];
        cell.hotGroupArray = self.hotGroupArray;
        __weak typeof (self) weakSelf = self;
        
        cell.selectGroupBlock = ^(KJVerticalButton *button)
        {
            
            RecoTopicListViewController *topicVC =    [RecoTopicListViewController new];
            topicVC.hotGroup = self.hotGroupArray[button.tag];
            
            [weakSelf.navigationController pushViewController:topicVC animated:YES];
            
        };

        return cell;
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section ==0) {
        
        return 64;

    }

    else
    {
        
        SSHotGroupCell *cell =  (SSHotGroupCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.bounds.size.height;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 32*kScreenHeightScale;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SSForumIndexTableHeader *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
    headerView.imageView.image = [UIImage imageNamed:@"home-themeicon"];
    headerView.btnTitleLabel.text = @"更多>>";
    headerView.contentView.backgroundColor = [UIColor whiteColor];
    [headerView.button addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
    headerView.button.tag = section;
    headerView.label.text = self.titleArr[section];
    return headerView;
    
}
-(void)moreAction:(UIButton *)button
{
    switch (button.tag) {
        case 0:
        {
            
            RecoTopicListViewController *topicVC =    [RecoTopicListViewController new];
            topicVC.topTitle = self.activitytitle;
            
            [self.navigationController pushViewController:topicVC animated:YES];
            
            
        }
            break;
        case 1:
        {
           [self.navigationController pushViewController:[ AllHotGroupsViewController new]  animated:YES];
        }
            break;
      
            
        default:
            break;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0)
    {
        PostDetailViewController *detailVC =        [PostDetailViewController new];
        detailVC.forum = self.forumArray[indexPath.row];
        
     
        [self.navigationController pushViewController:[UserTool user].userid.length?detailVC:[LoginViewController new] animated:YES];
    }
    
    
    
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight -  NavBar_Height - 60 - TabBar_Height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[SSForumIndexTableHeader class] forHeaderFooterViewReuseIdentifier:headerIdentifier];
    }
    return _tableView;
}


@end
