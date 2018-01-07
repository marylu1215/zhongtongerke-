//
//  SSBasicFileTableCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
#import "Problem.h"
#import "SSBasicFileButton.h"

@class SSBasicFileTableCell;

@protocol SSBasicFileTableCellDelegate <NSObject>
@optional
- (void)cell:(SSBasicFileTableCell *)cell actionWithButton:(SSBasicFileButton *)button view:(UIView *)view;

@end


@interface SSBasicFileTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) Problem *problem;
@property (nonatomic ,strong) UIView *btnView;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, weak) id<SSBasicFileTableCellDelegate> delegate;

@end
