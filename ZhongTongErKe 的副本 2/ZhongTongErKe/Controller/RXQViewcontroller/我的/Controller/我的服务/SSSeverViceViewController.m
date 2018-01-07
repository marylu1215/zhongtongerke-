//
//  SSSeverViceViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSSeverViceViewController.h"
#import "LMMessageBtn.h"
#import "ChooseToolView.h"
#import "CurrentServiceViewController.h"
#import "SerDoctorViewController.h"
#import "ToSerViewController.h"

@interface SSSeverViceViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *controllerArray;
@property (nonatomic, weak) UIScrollView *contentView;
@property (nonatomic,strong) ChooseToolView *chooseView;

@end

@implementation SSSeverViceViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    //设置导航栏
    [self setNaviBar];
    // 添加头部视图
    [self addHeaderTaskView];
    // 初始化子控制器
    [self initializeChildController];
    // 添加滚动视图
    [self addScrollView];
}

#pragma mark 导航栏设置
-(void)setNaviBar
{
    self.title = @"我的服务";
    LMMessageBtn *button = [[LMMessageBtn alloc] init];
    [button showRedPoint];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}

- (void)initializeChildController
{
    // 当前服务
   CurrentServiceViewController  *currentServiceVC = [[ CurrentServiceViewController  alloc] init];
    [self addChildViewController:currentServiceVC];
    
    // 服务医生
    SerDoctorViewController  *serDoctorVC = [[SerDoctorViewController alloc] init];
    [self addChildViewController:serDoctorVC];
    
    // 全部服务
   ToSerViewController *toSerVC = [[ToSerViewController alloc] init];
    [self addChildViewController:toSerVC];
    
    
    self.controllerArray = @[currentServiceVC,serDoctorVC,toSerVC];
    
}

- (void)addHeaderTaskView
{
   
    ChooseToolView *chooseView = [[ChooseToolView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44) titles:@[@"当前服务",@"服务医生",@"全部服务"] borderColor:c255255255 chooseToolViewType:ChooseToolViewIndicator More: YES];
    _chooseView = chooseView;
    chooseView.backgroundColor = c255255255;
    chooseView.indicatorLineHeight = 3;
    chooseView.indicatorLineColor = MAIN_COLOR;
    chooseView.titleColor = TITLE_COLOR;
    chooseView.selectedTitleColor = TITLE_COLOR;
    __weak typeof(self)weakSelf = self;
    [_chooseView didChooseAtIndex:^(NSInteger index) {
        //
        CGPoint offSet = weakSelf.contentView.contentOffset;
        offSet.x = index * weakSelf.contentView.width;
        [weakSelf.contentView setContentOffset:offSet animated:YES];
    }];
    
    [self.view addSubview:chooseView];
}

#pragma mark - 滚动视图
- (void)addScrollView
{
    // 不自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    contentView.bounces = NO;
    contentView.scrollsToTop = NO;
    contentView.scrollEnabled = NO;
    contentView.frame = CGRectMake(0, CGRectGetMaxY(self.chooseView.frame), kScreenWidth, kScreenHeight - CGRectGetMaxY(self.chooseView.frame));
    contentView.scrollEnabled = NO;
    
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
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



- (void)dealloc{
    
}

@end
