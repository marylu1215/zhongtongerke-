//
//  CurrentServiceTableViewCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyServices.h"

@interface CurrentServiceTableViewCell :XFBaseLineTableCell

@property (nonatomic ,strong) MyServices *myServices;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
