//
//  SSHotKPTableCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/3.
//  Copyright © 2017年 Claf. All rights reserved.
//
#import "XFBaseLineTableCell.h"
#import "PopScience.h"

@interface SSHotKPTableCell : XFBaseLineTableCell

+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic ,strong) PopScience *popScience;

@end
