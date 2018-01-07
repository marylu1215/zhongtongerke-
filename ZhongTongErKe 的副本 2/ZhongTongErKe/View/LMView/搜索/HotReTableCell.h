//
//  HotReTableCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "XFBaseLineTableCell.h"

@interface HotReTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) NSArray *hotReNSArray;

@property (nonatomic ,copy) void(^btnClickBlock)(UIButton *btn);

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
