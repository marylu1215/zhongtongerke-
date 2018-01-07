//
//  SSHospitalDetailController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/19.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHospitalDetailController.h"
#import "SSWZJudgeSuccessController.h"
#import "TouchScrollView.h"
#import "SSDocDetailTopView.h"
#import "SSDocDetailBottonView.h"
#import "Hospital.h"

@interface SSHospitalDetailController ()

// ** 主视图 */
@property (nonatomic,strong) TouchScrollView *mainScrollView;


@property (nonatomic,weak) SSDocDetailBottonView *bottomView;

@end

@implementation SSHospitalDetailController

-(void)viewWillLayoutSubviews{
    
    self.mainScrollView.contentSize = CGSizeMake(kScreenWidth, CGRectGetMaxY(self.bottomView.frame));
}

-(void)configUI{
    [super configUI];
    
    [self PrepareUI];
    
}

-(void)PrepareUI
{
   self.mainScrollView = [[TouchScrollView  alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.mainScrollView];
    
  
    SSDocDetailTopView *topView = [[SSDocDetailTopView alloc]init];
    
    topView.hospital = self.hospital;
    topView.frame = CGRectMake(0, 0, kScreenWidth, topView.bounds.size.height);
    
    
    __weak typeof  (self) weakSelf = self;
   
    topView.backBlock = ^()
    {
        [weakSelf.navigationController popViewControllerAnimated:YES];
        
    };
    topView.telBlock = ^()
    {
        [weakSelf onlineConsult];
    };
    [self.mainScrollView  addSubview:topView];
 
    
    
    
    SSDocDetailBottonView *bottomView = [[SSDocDetailBottonView alloc]initWithHospital:self.hospital];
    bottomView.frame = CGRectMake(0, CGRectGetMaxY(topView .frame), kScreenWidth, bottomView.bounds.size.height);
    [self.mainScrollView addSubview:bottomView];
    self.bottomView = bottomView;
   
    [self.mainScrollView setupAutoContentSizeWithBottomView:self.bottomView bottomMargin:px(10)];
    
}

#pragma  mark --action
- (void)onlineConsult{
   
}
@end
