//
//  SSWithdrawCashView.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSWithdrawCashBankButton.h"

@interface SSWithdrawCashView : UIView

@property(nonatomic,strong) SSWithdrawCashBankButton *bankButton;
@property (nonatomic,strong) UILabel *moneyLabel;
@property (nonatomic,strong) UITextField *moneyTextField;

@end
