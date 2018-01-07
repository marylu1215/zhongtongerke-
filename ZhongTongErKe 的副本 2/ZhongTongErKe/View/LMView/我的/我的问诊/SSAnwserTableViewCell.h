//
//  SSAnwserTableViewCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Answer.h"
#import "XFBaseLineTableCell.h"

@interface SSAnwserTableViewCell : XFBaseLineTableCell

@property (nonatomic ,strong) Answer *answer;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
