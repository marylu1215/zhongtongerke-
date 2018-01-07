//
//  SSHospitalListController.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/19.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFWorkBaseController.h"
#import "Administrative.h"

@interface SSHospitalListController : XFWorkBaseController

@property (nonatomic ,strong) Administrative *administrative;
@property (nonatomic ,strong)  NSArray *adminiArray;

@end
