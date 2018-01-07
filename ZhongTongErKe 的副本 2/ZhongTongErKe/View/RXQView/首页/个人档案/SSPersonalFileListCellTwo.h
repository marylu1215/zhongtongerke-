//
//  SSPersonalFileListCellTwo.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"

@interface SSPersonalFileListCellTwo :XFBaseLineTableCell<UITextFieldDelegate>

@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UITextField *contentTextField;
+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
