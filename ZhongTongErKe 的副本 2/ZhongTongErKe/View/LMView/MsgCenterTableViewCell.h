//
//  MsgCenterTableViewCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/26.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
@interface MsgCenterTableViewCell : UITableViewCell

@property (nonatomic ,strong) Message *message;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
