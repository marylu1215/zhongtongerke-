//
//  LMMessageCell.h
//  LMNYHealth
//
//  Created by lm on 26/2/16.
//  Copyright © 2016年 LM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMMEssage.h"
@interface LMMessageCell :  XFBaseLineTableCell
@property(nonatomic,strong) UILabel *timeLabel;
@property(nonatomic,strong) UIView *messageView;
@property(nonatomic,strong) UILabel  *titlteLabel;
@property(nonatomic,strong) UILabel  *contetLabel;
@property(nonatomic,strong) LMMEssage *message;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
