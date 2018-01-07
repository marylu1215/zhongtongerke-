//
//  SSWZJudgeSuccessController.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/17.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFWorkBaseController.h"
#import "Purchase.h"
#import "LMBaseViewController.h"
#import "Doctor.h"

@interface SSWZJudgeSuccessController : XFWorkBaseController

@property (nonatomic ,strong)  Purchase *purchase;

@property (nonatomic ,strong) Doctor *doctor;

@property (nonatomic ,assign) BOOL section;

@end
