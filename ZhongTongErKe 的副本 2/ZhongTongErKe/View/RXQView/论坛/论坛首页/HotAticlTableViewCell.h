//
//  HotAticlTableViewCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReNote.h"

@interface HotAticlTableViewCell : UITableViewCell

@property (nonatomic ,strong) ReNote *reNote;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
