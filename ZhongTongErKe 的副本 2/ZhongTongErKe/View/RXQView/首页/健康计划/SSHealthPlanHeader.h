//
//  SSHealthPlanHeader.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSHealthPlanButton.h"
#import "LMImageView.h"

@interface SSHealthPlanHeader : UIView

@property (nonatomic,strong) LMImageView *headImageView;
@property (nonatomic,strong) SSHealthPlanButton *plancalenderButton;
@property (nonatomic,strong) UIImageView *line1;
@property (nonatomic,strong) SSHealthPlanButton *addPlanButton;
@property (nonatomic,strong) UIImageView *line2;
@property (nonatomic,strong) SSHealthPlanButton *completePlanButton;

@end
