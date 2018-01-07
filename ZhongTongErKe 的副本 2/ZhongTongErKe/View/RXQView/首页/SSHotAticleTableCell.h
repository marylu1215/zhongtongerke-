//
//  SSHotAticleTableCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
#import "Forum.h"

@interface SSHotAticleTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) Forum *forum;

+(instancetype)cellWithTableView:(UITableView *)tableView; 

@end
