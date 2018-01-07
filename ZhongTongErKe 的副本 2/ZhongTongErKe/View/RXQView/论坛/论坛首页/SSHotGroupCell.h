//
//  SSHotGroupCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KJVerticalButton.h"

@interface SSHotGroupCell : XFBaseLineTableCell

@property (nonatomic,strong) NSArray *hotGroupArray;

@property (nonatomic ,copy) void(^selectGroupBlock)(KJVerticalButton *button);

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
