//
//  SSPatientJudgeTableCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
#import "PatientPraise.h"

@interface SSPatientJudgeTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) PatientPraise *patientPraise;
+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
