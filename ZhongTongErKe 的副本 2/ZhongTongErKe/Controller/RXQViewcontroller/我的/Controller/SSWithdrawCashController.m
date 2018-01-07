//
//  SSWithdrawCashController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSWithdrawCashController.h"
#import "UIBarButtonItem+Common.h"
#import "SSWithdrawCashView.h"
#import "SSAddBankCardController.h"
#import "SSWithdrawCashView.h"

@interface SSWithdrawCashController ()

@property (nonatomic,strong) SSWithdrawCashView *mainView;

@end

@implementation SSWithdrawCashController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"充值";
   
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"add-card" hightImage:nil selectImage:nil target:self action:@selector(addAction)];
    [self.view addSubview:self.mainView];
    self.view.backgroundColor = BACKGROUND_COLOR;
}

-(void)addAction
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark --action private
- (void)addBankCardButtonTaped:(UIButton *)sender{
    SSAddBankCardController *vc = [[SSAddBankCardController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (SSWithdrawCashView *)mainView{
    if (!_mainView) {
        _mainView = [[SSWithdrawCashView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 124*kScreenHeightScale)];
        _mainView.bankButton.headImageView.image = [UIImage imageNamed:@"1"];
        _mainView.bankButton.bankLabel.text = @"招商银行";
        _mainView.bankButton.lastNumberLabel.text = @"尾号7814储蓄卡";
        _mainView.bankButton.arrowImageView.image = [UIImage imageNamed:@"go"];
        _mainView.moneyLabel.text = @"金额";
        _mainView.moneyTextField.placeholder = @"请输入充值金额";
        _mainView.backgroundColor = [UIColor whiteColor];
    }
    return _mainView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
