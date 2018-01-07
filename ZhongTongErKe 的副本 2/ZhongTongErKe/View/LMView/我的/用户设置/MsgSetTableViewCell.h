//
//  MsgSetTableViewCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/1.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MsgSetTableViewCell : UITableViewCell

@property (nonatomic, copy) void(^switchActionBlock)(BOOL isButtonOn,UIButton *switchBtn);

@property (nonatomic, copy) NSString *leftStr;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
