//
//  SSDocDetailCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/17.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
#import "Comment.h"

@interface SSDocDetailCell : XFBaseLineTableCell


@property (nonatomic ,strong) Comment *comment;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
