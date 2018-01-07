//
//  SSDoctorJudgeController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/11.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSDoctorJudgeController.h"
#import "SSBottomButton.h"
#import "SSWZJudgeSuccessController.h"
#import "DoctorInfoView.h"
#import "DoctorEvaluateView.h"
#import "UserTool.h"
#import "TggStarEvaluationView.h"
#import "EvBottomView.h"
#import "SSJudgeSuccessController.h"

@interface SSDoctorJudgeController ()


@property (nonatomic,strong) DoctorInfoView *doctorInfoView;
@property (nonatomic,strong) DoctorEvaluateView *evaluateView;
@property (nonatomic,weak) EvBottomView *bottomView;
@property (nonatomic ,copy) NSString *state;
@property (nonatomic ,strong) UILabel *tipLabel;

@end

@implementation SSDoctorJudgeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"评价医生";
 
}

- (void)setUP
{
  
    self.view.backgroundColor = c240240240;
    
    
    self.doctorInfoView = [[DoctorInfoView alloc]init];
    self.doctorInfoView.myServices = self.myServices;
    [self.view addSubview:self.doctorInfoView];
    self.doctorInfoView.sd_layout.widthIs(kScreenWidth).heightIs(self.doctorInfoView.bounds.size.height).topSpaceToView(self.view,0);
    
    UIView *midView = [[UIView alloc]init];
    [self.view addSubview:midView];
    midView.backgroundColor = c255255255;
    midView.sd_layout.widthIs(kScreenWidth).heightIs(px(60)).topSpaceToView( self.doctorInfoView,px(20));
    
    UILabel *titleLabel = [UILabel addLabelWithText:@"您对医生的评价满意吗?" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [midView addSubview:titleLabel];
    titleLabel.sd_layout.leftSpaceToView(midView,px(20)).heightIs(Font13).rightSpaceToView(midView,px(30)).centerYEqualToView(midView);
    
    UIImageView *sepView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [midView addSubview:sepView];
    sepView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(midView,0);
    


    TggStarEvaluationView *tggStarEvaView = [TggStarEvaluationView evaluationViewWithChooseStarBlock:^(NSUInteger count) {
        
        self.state = [NSString stringWithFormat:@"%ld",count];
        
    }];
    
    [self.view addSubview:tggStarEvaView];
    tggStarEvaView.sd_layout.leftSpaceToView(self.view,self.view.frame.size.width / 2 - 23 * 5).topSpaceToView(midView,px(20)).widthIs(23 * 10).heightIs(45);
    
    self.tipLabel = [UILabel addLabelWithText:@"说明: 1颗星为不满意,2-3颗星为满意,4-5颗星为非常满意" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.view addSubview:self.tipLabel];
    
    self.tipLabel.sd_layout.leftSpaceToView(self.view,px(16)).topSpaceToView(tggStarEvaView,px(20)).rightSpaceToView(self.view,0).heightIs(Font13);
    
//    self.evaluateView = [[DoctorEvaluateView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY( tggStarEvaView.frame), kScreenWidth,CGRectGetMaxY(self.evaluateView.subviews.lastObject.frame)+px(20)) EvaluArray:@[@"非常敬业",@"意见很有帮助",@"态度很好",@"态度非常好",@"回复很及时",@"非常认真专业"]];
//    [self.view addSubview: self.evaluateView];
    
    EvBottomView *bottomView =[[EvBottomView alloc]init];
    bottomView.descView.topLine.hidden = YES;
    [self.view addSubview:bottomView];
    bottomView.sd_layout.widthIs(kScreenWidth).heightIs(px(310)).topSpaceToView(self.tipLabel,px(20));
    self.bottomView = bottomView;
    
   UIButton *btn = [UIButton addBtnWithTitle:@"确认提交" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(bottomButtonTaped:)];
    btn.backgroundColor =cHBColor;
    [self.view addSubview:btn];
    btn.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view,0);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark --action private

- (void)bottomButtonTaped:(SSBottomButton *)sender{
    
    
    if (self.bottomView.descView.descriptionTV.text.length==0) {
        
        [MBProgressHUD showError:@"请输入评价内容!"];
        return;
    }
    
    if (self.state.length==0) {
        
        [MBProgressHUD showError:@"请评价!"];
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userid"] = [UserTool user].userid;
    params[@"orderid"] = self.myServices.orderid;
    params[@"doctorid"] = self.myServices.doctorid;
    params[@"content"] = self.bottomView.descView.descriptionTV.text;
    params[@"service"] = self.myServices.service;
    params[@"state"] = self.state;
    params[@"type"] = @"1";
    
    [MBProgressHUD showMessage:@"评价中..."];
    
    [HttpTool postWithURL:getdoctor_commentParty params:params success:^(id json) {
        
        ICLog(@"%@",json);
        
        if (jsonMsg(json)) {
            
            SSJudgeSuccessController *judgeVC = [[SSJudgeSuccessController alloc]init];
            
            judgeVC.myServices = self.myServices;
            judgeVC.cid = json[@"data"];
            [self.navigationController pushViewController:judgeVC animated:YES];
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




@end
