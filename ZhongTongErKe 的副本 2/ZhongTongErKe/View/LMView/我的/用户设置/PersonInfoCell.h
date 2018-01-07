//
//  PersonInfoCell.h
//  MagicFinger
//
//  Created by xufeng on 16/5/18.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
@interface PersonInfoCell : XFBaseLineTableCell<UITextFieldDelegate>
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *detailBtn;
@property (nonatomic,strong) UITextField *detailTF;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
