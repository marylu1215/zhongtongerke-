//
//  ResultTableViewCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewCell : XFBaseLineTableCell

@property (nonatomic ,copy ) NSString *titleStr;

@property (nonatomic ,copy) void (^deleteBlock) ();


+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
