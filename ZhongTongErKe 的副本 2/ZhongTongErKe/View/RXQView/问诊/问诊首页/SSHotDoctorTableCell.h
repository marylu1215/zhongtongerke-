//
//  SSHotDoctorTableCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSHotDoctorButton.h"
#import "XFBaseLineTableCell.h"

@interface SSHotDoctorTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) NSArray *doctorArray;

@property (nonatomic ,copy) void (^backDoctorBlock)(SSHotDoctorButton *button);

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
