//
//  CombOptionTableCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "XFBaseLineTableCell.h"


@interface CombOptionTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) NSArray  *severViceArray;
@property (nonatomic, weak) UIButton *selectButton;
@property (nonatomic ,strong) UILabel *priceLable;
@property (nonatomic ,strong) UILabel *timeLable;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
