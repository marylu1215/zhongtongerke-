//
//  SSJudgeSuccessController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/11.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSJudgeSuccessController.h"
#import "UIBarButtonItem+Common.h"
#import "SSJudgeSuccessButton.h"
#import "SSWZJudgeSuccessController.h"

@interface SSJudgeSuccessController ()

@property(nonatomic,strong)UILabel *headLabel;
@property (nonatomic,strong)UIView *line;
@property (nonatomic,strong)UILabel *courageLabel;
@property (nonatomic,strong)SSJudgeSuccessButton *judgeSuccessButton;

@end

@implementation SSJudgeSuccessController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.title = @"评价成功";
   
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithBtnTitle:@"完成" target:self action:@selector(comAction)];
    [self addSubviews];
    [self initializeSubviews];
    [self makeConstaits];

}
-(void)comAction
{
  
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
- (void)addSubviews{
    
    [self.view addSubview:self.headLabel];
    [self.view addSubview:self.line];
    [self.view addSubview:self.courageLabel];
    [self.view addSubview:self.judgeSuccessButton];
}

- (void)initializeSubviews
{
    self.headLabel.text = @"感谢您的评价";
    self.courageLabel.text = @"您的好评是对医生最大的鼓励";
    self.judgeSuccessButton.bgImageView.image = [UIImage imageNamed:judgeSuccess_redBag];
    self.judgeSuccessButton.contentLabel.text = @"略表心意";
}
- (void)makeConstaits{
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 34*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(34*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.courageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(59*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 12*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.judgeSuccessButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(96*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(80*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(152*kScreenWidthScale);
    }];
}


-(void)judgeAction
{
    
    SSWZJudgeSuccessController *judgeVC =  [SSWZJudgeSuccessController new];
    judgeVC.section = YES;
    judgeVC.purchase = [[Purchase alloc]init];
    judgeVC.purchase.type = @"gift";
    judgeVC.purchase.orderid = self.myServices.orderid;
    judgeVC.purchase.cid = self.cid;
    judgeVC.doctor = [Doctor new];
    judgeVC.doctor.name = self.myServices.doctor_name;
    judgeVC.doctor.head = self.myServices.doctor_head;
    judgeVC.doctor.cid = self.myServices.doctorid;
    [self.navigationController pushViewController:judgeVC animated:YES];
}

- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
        _headLabel.textAlignment  = NSTextAlignmentCenter;
    }
    return _headLabel;
}
- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = BACKGROUND_COLOR;
    }
    return _line;
}
- (UILabel *)courageLabel{
    if (!_courageLabel) {
        _courageLabel   =  [[UILabel alloc]init];
        _courageLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _courageLabel.textColor = REMARK_COLOR;
        _courageLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _courageLabel;
}
- (SSJudgeSuccessButton *)judgeSuccessButton{
    if (!_judgeSuccessButton) {
        _judgeSuccessButton = [[SSJudgeSuccessButton alloc]init];
        [_judgeSuccessButton addTarget:self action:@selector(judgeAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _judgeSuccessButton;
}





@end
