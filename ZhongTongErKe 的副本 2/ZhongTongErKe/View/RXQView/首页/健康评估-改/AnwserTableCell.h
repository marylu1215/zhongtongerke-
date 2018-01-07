//
//  AnwserTableCell.h
//  ZhongTongErKe
//
//  Created by l m on 2017/7/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "XFBaseLineTableCell.h"
#import "Subject.h"

@interface AnwserTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) Subject *subject;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
