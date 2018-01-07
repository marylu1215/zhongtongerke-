//
//  SSGoodsForSaleCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Package.h"

@interface SSGoodsForSaleCell : XFBaseLineTableCell

@property (nonatomic ,strong) Package *package;


+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
