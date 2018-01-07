//
//  SSInTableViewCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
@interface SSInTableViewCell : XFBaseLineTableCell

@property (nonatomic ,strong) UIImageView *headImageView;

@property (nonatomic ,strong) UILabel *infoLabel;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
