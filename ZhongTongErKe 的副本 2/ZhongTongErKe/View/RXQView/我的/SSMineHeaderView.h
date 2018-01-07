//
//  SSMineHeaderView.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "SSMineHeaderButtonOne.h"
#import "SSMineHerderButtonTwo.h"

@interface SSMineHeaderView : UIView
@property (nonatomic ,strong) User *user;

@property (nonatomic ,copy) void (^headClickBlock)();

@property (nonatomic ,copy) void (^clickBlock)(SSMineHeaderButtonOne *btn);
@property (nonatomic ,copy) void (^actionclickBlock)(SSMineHerderButtonTwo *btn);

@end
