//
//  SSProConsultCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
#import "TitleButton.h"

@interface SSProConsultCell : XFBaseLineTableCell

@property (nonatomic ,strong) NSArray *adminArray;
@property (nonatomic ,copy) void (^selectBlock)(TitleButton *titleButton);
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
