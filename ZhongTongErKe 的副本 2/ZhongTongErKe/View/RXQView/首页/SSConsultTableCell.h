//
//  SSConsultTableCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSTableCellButton.h"
#import "XFBaseLineTableCell.h"
#import "ExConsult.h"

@interface SSConsultTableCell : XFBaseLineTableCell

@property (nonatomic ,copy) void (^listenBlock)(UIButton *button);

@property (nonatomic ,strong) ExConsult *exConsult;

@property (nonatomic,strong) UIButton *listenButton;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
