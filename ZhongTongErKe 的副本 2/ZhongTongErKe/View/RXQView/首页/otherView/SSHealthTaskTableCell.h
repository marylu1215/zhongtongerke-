//
//  SSHealthTaskTableCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
#import "HealthTask.h"

@interface SSHealthTaskTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) HealthTask *healthTask;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
