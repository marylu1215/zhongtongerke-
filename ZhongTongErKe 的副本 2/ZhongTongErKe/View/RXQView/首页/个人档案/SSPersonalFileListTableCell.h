//
//  SSPersonalFileListTableCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"

@interface SSPersonalFileListTableCell : XFBaseLineTableCell<UITextFieldDelegate>
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *detailBtn;
@property (nonatomic,strong) UITextField *detailTF;
@property (nonatomic,strong) UIImageView *arrowImageView;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
