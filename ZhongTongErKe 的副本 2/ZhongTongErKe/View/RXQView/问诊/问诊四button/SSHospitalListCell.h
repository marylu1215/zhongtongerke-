//
//  SSHospitalListCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/19.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
#import "Hospital.h"

@interface SSHospitalListCell : XFBaseLineTableCell

@property (nonatomic ,strong) Hospital *hospital;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
