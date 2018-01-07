//
//  RealNameTableViewCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/1.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RealNameTableViewCell : XFBaseLineTableCell

@property (nonatomic ,strong) UITextField *nameTextField;
@property (nonatomic ,strong) UIButton *sexBtn;
@property (nonatomic ,strong) UITextField *telTextField;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
