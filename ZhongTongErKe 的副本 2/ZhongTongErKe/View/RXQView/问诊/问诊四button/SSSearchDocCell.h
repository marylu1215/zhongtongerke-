//
//  SSSearchDocCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
#import "Doctor.h"
@interface SSSearchDocCell : XFBaseLineTableCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic ,strong) Doctor *doctor;

@end
