//
//  ForumModuleViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "ForumModuleViewController.h"
#import "LMMessageBtn.h"
#import "UIBarButtonItem+Common.h"
#import "ChooseToolView.h"
#import "TouchScrollView.h"
#import "SSForumViewController.h"
#import "NCenterTableViewController.h"
#import "Title.h"
#import "ActivityTableViewController.h"
#import "searchView.h"
#import "SearchRecordViewController.h"
#import "EditContentsViewController.h"

@interface ForumModuleViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) ChooseToolView *chooseView;
@property (nonatomic, strong) NSArray *controllerArray;
@property (nonatomic, weak)  TouchScrollView  *contentView;
@property (nonatomic ,strong) UIImageView *bannerImageView;
@property (nonatomic ,strong)NSArray *titleArray;

@property (nonatomic ,assign) CGPoint offSet;

@property (nonatomic,strong) searchView *searchView;

@end

@implementation ForumModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //设置导航栏
    [self setNaviBar];
    
}

-(void)viewWillAppear:(BOOL)animated
{
  
    [self.contentView setContentOffset:self.offSet animated:YES];
}

-(void)setNaviBar
{
  
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"发表" target:self action:@selector(clickAction) font:font(Font15) color:c255255255 highlightColor:c255255255];
    
    _searchView = [[searchView alloc]initWithSearchBarEditDidChange:^(NSString *text) {
        
        
    } SearchBegin:^(NSString *kWords, BOOL isSeletedPopTable, NSUInteger index) {
        
        
    }];
    
    _searchView.sd_layout.heightIs(px(52)).widthIs(200).centerXEqualToView(self.navigationItem.titleView);
    _searchView.layer.cornerRadius = 10;
    self.navigationItem.titleView = _searchView;
    _searchView.placeholder = @"大家都在搜: 育儿";
     _searchView.searchBar.userInteractionEnabled = NO;
    
    [_searchView addGestureRecognizer:   [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGer)]];

}

-(void)tapGer
{
    [self.navigationController pushViewController:[SearchRecordViewController new]  animated:YES];
    
}

-(void)clickAction
{
    if (!self.navigationItem.rightBarButtonItem.customView.hidden) {
        
    [self.navigationController pushViewController: [UserTool user].userid.length?[EditContentsViewController new]:[LoginViewController new]animated:YES];
    }
   
}

-(void)loadData
{
    [super loadData];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getForumTitle params:params success:^(id json) {
        
        ICLog(@"%@",json);
        
        if (jsonMsg(json)) {
            
            self.titleArray = [Title mj_objectArrayWithKeyValuesArray:json[@"data"]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self addTopChooseView];
                // 初始化子控制器
                [self initializeChildController];
                // 添加滚动视图
                [self addScrollView];
            });
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

-(void)addTopChooseView
{
   
    NSMutableArray   *titleArr = [NSMutableArray new];

    CGFloat wide = px(30);
    for (int index=0; index<self.titleArray.count; index++)
    {
        Title *title = self.titleArray[index];
         [titleArr addObject:title.title];
        wide += [NSString backSizeWithText:title.title andFont:font(Font13)].width+px(30);
    }
    
    self.chooseView = [[ChooseToolView alloc]initWithFrame:CGRectMake(0, 0, wide, px(66)) titles:titleArr borderColor:c255255255 chooseToolViewType:ChooseToolViewBorder More:NO];
    _chooseView.titleColor = TITLE_COLOR;
    _chooseView.selectedTitleColor = MAIN_COLOR;
    _chooseView.titleFont = font(12);
    __weak typeof(self)weakSelf = self;
    [_chooseView didChooseAtIndex:^(NSInteger index) {
        
        CGPoint offSet = weakSelf.contentView.contentOffset;
        offSet.x = index * weakSelf.contentView.width;
        [weakSelf.contentView setContentOffset:offSet animated:YES];
        self.offSet = offSet;
    }];
    
    [self.view addSubview:_chooseView];
    _chooseView.centerX = self.view. centerX;
    [self.view layoutIfNeeded];
    [self.view layoutSubviews];
    
}
- (void)initializeChildController
{
    // 全部
    if (self.titleArray.count) {
        
        SSForumViewController *forumVC = [[SSForumViewController alloc] init];
        [self addChildViewController:forumVC];
        forumVC.actiTitle = self.titleArray[0];
        
    NSMutableArray *vcArray = [NSMutableArray new];
    
    if (self.titleArray.count>1) {
        
        for (int index=1; index<self.titleArray.count; index++) {
            
           ActivityTableViewController *activityVC = [ActivityTableViewController new];
            activityVC.activitytitle = self.titleArray[index];
            
            [self addChildViewController:activityVC];
            [vcArray addObject:activityVC];
        }
        
        self.controllerArray = @[forumVC,vcArray];
    }
    
    else
    {
         self.controllerArray = @[forumVC];
    }
}
    
}
#pragma mark - 滚动视图
- (void)addScrollView
{
    // 不自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    TouchScrollView *contentView = [[TouchScrollView  alloc] init];
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    contentView.bounces = NO;
    contentView.scrollsToTop = NO;
    contentView.scrollEnabled = YES;
    contentView.frame = CGRectMake(0, CGRectGetMaxY(self.chooseView.frame), kScreenWidth, kScreenHeight - CGRectGetMaxY(self.chooseView.frame));
    contentView.scrollEnabled = NO;
    
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 200);
    self.contentView = contentView;
    
    [self.view insertSubview:contentView atIndex:0];
    
    [self scrollViewDidEndScrollingAnimation:contentView];
}

#pragma mark - scrollView的代理
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    UIViewController *vc = self.childViewControllers[index];
    
    if (vc.view.superview) return;
    
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = CGRectGetMaxY(self.bannerImageView.frame);
    vc.view.height = scrollView.height;
    
    [scrollView addSubview:vc.view];
    scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(vc.view.frame)+64);
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
