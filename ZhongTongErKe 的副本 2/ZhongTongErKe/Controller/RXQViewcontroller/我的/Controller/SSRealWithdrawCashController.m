//
//  SSRealWithdrawCashController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSRealWithdrawCashController.h"
#import "SSRealWithdrawCashView.h"

@interface SSRealWithdrawCashController ()

@property (nonatomic,strong) SSRealWithdrawCashView *mainView;

@end

@implementation SSRealWithdrawCashController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"提现";
    self.view.backgroundColor = BACKGROUND_COLOR;
    [self.view addSubview:self.mainView];
}


- (SSRealWithdrawCashView *)mainView{
    if (!_mainView) {
        _mainView = [[SSRealWithdrawCashView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 195*kScreenHeightScale)];
        _mainView.headButton.headImageView.image = [UIImage imageNamed:@"1"];
        _mainView.headButton.bankLabel.text = @"招商银行";
        _mainView.headButton.lastNumberLabel.text = @"尾号7814储蓄卡";
        _mainView.headButton.arrowImageView.image = [UIImage imageNamed:@"go"];
        _mainView.moneyLabel.text = @"金额";
        _mainView.moneyImageViewLabel.text = @"¥";
        _mainView.extraMoneyLabel.text = @"可用余额248元";
        _mainView.moneyTextField.text = @"20000";
        _mainView.backgroundColor = [UIColor whiteColor];
    }
    return _mainView;
}


@end
