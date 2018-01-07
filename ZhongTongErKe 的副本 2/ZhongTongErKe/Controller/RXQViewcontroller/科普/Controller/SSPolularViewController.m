//
//  SSPolularViewController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/4/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPolularViewController.h"
#import "LMMessageBtn.h"
#import "UIBarButtonItem+Common.h"
#import "ChooseToolView.h"
#import "HealthQuiryViewController.h"
#import "SVideoTableViewController.h"
#import "TouchScrollView.h"
#import "RedPointTableViewController.h"
#import "LMMessageTableViewController.h"
#import "searchView.h"
#import "SearchRecordViewController.h"

@interface SSPolularViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) ChooseToolView *chooseView;
@property (nonatomic, strong) NSArray *controllerArray;
@property (nonatomic, weak)  TouchScrollView  *contentView;
@property (nonatomic,strong) searchView *searchView;
@end

@implementation SSPolularViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setNaviBar];
    
    [self addTopChooseView ];
    
    // 初始化子控制器
    [self initializeChildController];
    // 添加滚动视图
    [self addScrollView];
    
}

-(void)setNaviBar
{
    LMMessageBtn *button = [[LMMessageBtn alloc] init];
    [button showRedPoint];
    [button addTarget:self action:@selector(mesgAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    _searchView = [[searchView alloc]initWithSearchBarEditDidChange:nil SearchBegin:nil];
    _searchView.sd_layout.heightIs(px(52)).widthIs(200);
    _searchView.layer.cornerRadius = 10;
    self.navigationItem.titleView = _searchView;
    _searchView.placeholder = @"搜索医生、药、咨询";
    _searchView.searchBar.userInteractionEnabled = NO;
    [_searchView addGestureRecognizer:   [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(searchBtnClick)]];
}

-(void)searchBtnClick
{
    [self.navigationController pushViewController:[SearchRecordViewController new]  animated:YES];
    
}


-(void)mesgAction
{
    [self.navigationController pushViewController:[LMMessageTableViewController new] animated:YES];
}
#pragma mark - view
- (void)addTopChooseView{
    
    
    self.chooseView = [[ChooseToolView alloc]initWithFrame:CGRectMake(0, 0, px(170) * 5, px(66)) titles:@[@"热点",@"视频",@"健康资讯",@"儿童安全指南",@"儿童用药指导"] borderColor:c255255255 chooseToolViewType:ChooseToolViewBorder More:NO];
    _chooseView.titleColor = TITLE_COLOR;
    _chooseView.selectedTitleColor = MAIN_COLOR;
    _chooseView.titleFont = font(12);
    __weak typeof(self)weakSelf = self;
    [_chooseView didChooseAtIndex:^(NSInteger index) {
        
        CGPoint offSet = weakSelf.contentView.contentOffset;
        offSet.x = index * weakSelf.contentView.width;
        [weakSelf.contentView setContentOffset:offSet animated:YES];
    }];
    
    [self.view addSubview:_chooseView];
    _chooseView.centerX = self.view. centerX;
    [self.view layoutIfNeeded];
    [self.view layoutSubviews];
}

- (void)initializeChildController
{
    // 热点
   RedPointTableViewController *redPointVC = [[RedPointTableViewController alloc] init];
    [self addChildViewController:redPointVC];
    
    // 视频
    SVideoTableViewController *videoVC = [[ SVideoTableViewController alloc] init];
    [self addChildViewController:videoVC];
    
    NSArray *urlArray = @[gethealthScience,getBabySecurityScience,getbabyMedicationScience];
    
    NSMutableArray *vcMutableArray = [NSMutableArray new];
    
    for (int index=0; index<3; index++) {
        
        HealthQuiryViewController  *healthVC =
        [HealthQuiryViewController new];
        healthVC.urlStr = urlArray[index];
        [self addChildViewController:healthVC];
        [vcMutableArray addObject:healthVC];
    }
    
    self.controllerArray = @[redPointVC,videoVC,vcMutableArray];
    
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
    contentView.scrollEnabled = NO;
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
    vc.view.y = 0;
    vc.view.height = scrollView.height; 
    [scrollView addSubview:vc.view];
    
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
