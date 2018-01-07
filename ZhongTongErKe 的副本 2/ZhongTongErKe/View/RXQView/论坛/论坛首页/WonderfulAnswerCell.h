//
//  WonderfulAnswerCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReplyNote.h"

@interface WonderfulAnswerCell : UITableViewCell

@property (nonatomic ,strong) ReplyNote *replyNote;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
