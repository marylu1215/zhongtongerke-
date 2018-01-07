//
//  SSFamousConsultCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
#import "PatientPraise.h"

@interface SSFamousConsultCell : XFBaseLineTableCell
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UILabel *phoneLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic ,strong) PatientPraise *patientPraise;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
