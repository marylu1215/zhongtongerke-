//
//  SSForumViewController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/4/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSForumViewController.h"
#import "SSHotGroupCell.h"
#import "HotGroup.h"
#import "PostDetailViewController.h"
#import "Forum.h"
#import "RecoTopicListViewController.h"
#import "AllRepliesViewController.h"
#import "WonderfulAnswerCell.h"
#import "AllHotGroupsViewController.h"
#import "SSHotAticleTableCell.h"
#import "SSForumIndexTableHeader.h"

static NSString *headerIdentifier = @"header";

@interface SSForumViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic ,strong) UIImageView *bannerImageView;
@property (nonatomic ,strong) NSArray *hotGroupArray;

@property (nonatomic ,strong) NSArray *titleArr;

@property (nonatomic ,strong) NSArray *forumArray;

@property (nonatomic ,strong) NSArray *replyMuArr;
@end

@implementation SSForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    [self setHeaderView];
    self.titleArr = @[@"推荐话题",@"精彩回复",@"热门群组"];
    
}
-(void)setHeaderView
{
    UIImage *bannerImage = [UIImage imageNamed:bannerImageName];
    self.bannerImageView = [[UIImageView alloc]initWithImage:bannerImage];
    
    [self.view addSubview:self.bannerImageView];
    self.bannerImageView.sd_layout.widthIs(kScreenWidth).heightIs(bannerImage.size.height);
    [self.bannerImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImageBaseURL,self.actiTitle.img]] placeholderImage:bannerImage];
    self.tableView.tableHeaderView =  self.bannerImageView;

}
-(void)loadData
{
     //全部页面列表
     [self loadAllForum];
  
    
    
}
-(void)loadAllForum
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
  
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getAllForum params:params success:^(id json) {
       
        ICLog(@"json menu:%@",json);
       
        if (jsonMsg(json)) {
            
        self.forumArray = [Forum mj_objectArrayWithKeyValuesArray:json[@"data"]];
            
        self.replyMuArr = [ReplyNote mj_objectArrayWithKeyValuesArray:json[@"jchf"]];
        
        self.hotGroupArray = [HotGroup mj_objectArrayWithKeyValuesArray:json[@"qunzu"]];
            
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
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    if (section==2) {
        return 1;
    }
    else if (section==0)
    {
        return self.forumArray.count;
    }
    
   else
   {
       return  self.replyMuArr.count;
   }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==0) {
        
        SSHotAticleTableCell *cell = [SSHotAticleTableCell     cellWithTableView:tableView];
        cell.forum = self.forumArray[indexPath.row];
        return cell;
    }
   else if (indexPath.section == 1) {
        
        WonderfulAnswerCell *cell = [WonderfulAnswerCell cellWithTableView:tableView];
        cell.replyNote = self.replyMuArr[indexPath.row];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        WonderfulAnswerCell  *cell =  (WonderfulAnswerCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.bounds.size.height;
    }
    else if (indexPath.section==0)
    {
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
            topicVC.topTitle = self.actiTitle;
            
            [self.navigationController pushViewController:topicVC animated:YES];
            
        }
            break;
        case 1:
        {
              [self.navigationController pushViewController:[AllRepliesViewController new]  animated:YES];
        }
            break;
        case 2:
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
    else if (indexPath.section==1)
    {
        PostDetailViewController *detailVC =        [PostDetailViewController new];
        detailVC.forum = [Forum new];
        ReplyNote *replyNote = self.replyMuArr[indexPath.row];
        detailVC.forum.cid = replyNote.cid;
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
