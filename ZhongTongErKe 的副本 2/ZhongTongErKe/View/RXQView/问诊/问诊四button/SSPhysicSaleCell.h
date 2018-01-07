//
//  SSPhysicSaleCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/23.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
#import "ActivitieTheme.h"

@interface SSPhysicSaleCell : XFBaseLineTableCell

@property (nonatomic , strong) ActivitieTheme *activitieTheme;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
