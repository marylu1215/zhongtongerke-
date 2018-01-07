//
//  SerDoctorTableViewCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyServices.h"

@interface SerDoctorTableViewCell : XFBaseLineTableCell

@property (nonatomic ,strong) MyServices *myServices;
@property (nonatomic ,strong) UIButton *evButton;
@property (nonatomic ,copy) void(^evaluateBlock)(UIButton *button);

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
