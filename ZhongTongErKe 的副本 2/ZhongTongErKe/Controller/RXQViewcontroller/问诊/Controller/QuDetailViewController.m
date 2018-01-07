//
//  QuDetailViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/16.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "QuDetailViewController.h"
#import "QuDetailUIView.h"
#import "OnLineView.h"
#import "UIBarButtonItem+Common.h"
#import "SSDoctorJudgeController.h"

@interface QuDetailViewController ()

@property (nonatomic ,weak) QuDetailUIView *detailUIView;
@end

@implementation QuDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"问题详情";
   
    [self setHeaderView];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithBtnTitle:@"下一步" target:self action:@selector(nextAction)];
}

-(void)nextAction
{
    [self.navigationController pushViewController:[SSDoctorJudgeController new] animated:YES];
}
-(void)setHeaderView
{
    QuDetailUIView *detailUIView = [[QuDetailUIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, px(138))];
    self.detailUIView = detailUIView;
    __weak typeof (self)weakSelf = self;
    detailUIView.clickBlock = ^(UIButton *btn)
    {
        switch (btn.tag) {
            case 0:
                
                break;
                
            case 1:
            {
                weakSelf.detailUIView.hidden = YES;
                OnLineView *view = [[OnLineView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, px(60))];
                [weakSelf.view addSubview:view];
            }
                
                
                break;
            default:
                break;
        }
    };
    
    [self.view addSubview:detailUIView];
}
- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
