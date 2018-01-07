//
//  SSRealWithdrawCashView.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSWithdrawCashBankButton.h"

@interface SSRealWithdrawCashView : UIView

@property (nonatomic,strong)SSWithdrawCashBankButton *headButton;
@property (nonatomic,strong)UILabel *moneyLabel;
@property (nonatomic,strong)UILabel *moneyImageViewLabel;
@property (nonatomic,strong)UITextField *moneyTextField;
@property (nonatomic,strong)UILabel *extraMoneyLabel;

@end
