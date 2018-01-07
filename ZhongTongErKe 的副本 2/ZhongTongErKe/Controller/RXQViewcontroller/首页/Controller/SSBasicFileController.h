//
//  SSBasicFileController.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FamilyGroup.h"
#import "EatHabit.h"
#import "Smoke.h"
#import "Drink.h"
#import "Physical.h"

@interface SSBasicFileController : XFWorkBaseController

@property (nonatomic ,strong) FamilyGroup *familyGroup;

@property (nonatomic ,assign) BOOL addOrRevise;

@property (nonatomic ,strong) EatHabit *eatHabit;
@property (nonatomic ,strong) Smoke *smoke;
@property (nonatomic ,strong) Drink *drink;
@property (nonatomic ,strong) Physical *physical;

@end
