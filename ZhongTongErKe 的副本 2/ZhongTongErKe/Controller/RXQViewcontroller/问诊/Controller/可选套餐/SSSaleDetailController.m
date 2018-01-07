//
//  SSSaleDetailController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/23.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSSaleDetailController.h"
#import "SSWZJudgeSuccessController.h"
#import "SSSaleDetailHeader.h"
#import "TouchScrollView.h"
#import "PackContentView.h"


@interface SSSaleDetailController ()

// ** 主视图 */
@property (nonatomic,strong) TouchScrollView *mainSV;

// ** 主视图 */
@property (nonatomic,strong) PackContentView *contentView;

@end

@implementation SSSaleDetailController

-(void)viewWillLayoutSubviews{
    
    self.mainSV.contentSize = CGSizeMake(kScreenWidth, CGRectGetMaxY(self.contentView.frame));
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    self.title = @"套餐详情";
    
    self.mainSV = [[TouchScrollView  alloc]initWithFrame:self.view.frame];
    self.mainSV.backgroundColor = c255255255;
    [self.view addSubview:self.mainSV];
    
    SSSaleDetailHeader *detailView = [[SSSaleDetailHeader alloc]init];
    detailView.package = self.package;
    detailView.frame = CGRectMake(0, 0, kScreenWidth, px(396));
    [self.mainSV addSubview:detailView];
    
   self.contentView = [[PackContentView alloc]init];
   self.contentView.package = self.package;
   self.contentView.frame = CGRectMake(0, CGRectGetMaxY(detailView.frame), kScreenWidth, self.contentView.bounds.size.height);
    [self.mainSV addSubview:self.contentView];
    
    [self.mainSV setupAutoContentSizeWithBottomView:self.contentView bottomMargin:64];
    
    
    [self setBottomView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = NO;
}

-(void)setBottomView
{
    
    UIButton *bottomButton = [UIButton addBtnWithTitle:@"立即购买" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(payAction)];
    bottomButton.backgroundColor = cHBColor;
    [self.view addSubview:bottomButton];
    bottomButton.sd_layout.widthIs(kScreenWidth).heightIs(50).bottomSpaceToView(self.view,0);
}
-(void)payAction
{
    SSWZJudgeSuccessController *judgeVC = [SSWZJudgeSuccessController new];
    judgeVC.purchase = [[Purchase alloc]init];
    judgeVC.purchase.type = @"activity";
    judgeVC.purchase.price = self.package.price;
    judgeVC.purchase.activityid = self.package.cid;
    [self.navigationController pushViewController:judgeVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
