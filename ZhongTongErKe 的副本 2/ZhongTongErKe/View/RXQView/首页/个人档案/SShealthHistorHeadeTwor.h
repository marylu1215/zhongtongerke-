//
//  SShealthHistorHeadeTwor.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/9.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HealthHistory.h"

@interface SShealthHistorHeadeTwor : UIView

@property (nonatomic ,copy) void (^backSelectBlock)(UIButton *button);
@property (nonatomic,strong) UIButton *yesButton;
@property (nonatomic,strong) UIButton *noButton;
@property (nonatomic ,strong) HealthHistory *healthHistory;

@end
