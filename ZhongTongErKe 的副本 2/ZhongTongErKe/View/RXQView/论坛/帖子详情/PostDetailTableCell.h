//
//  PostDetailTableCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/6.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "XFBaseLineTableCell.h"
#import "Invitation.h"

@interface PostDetailTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) Invitation *invitation;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
