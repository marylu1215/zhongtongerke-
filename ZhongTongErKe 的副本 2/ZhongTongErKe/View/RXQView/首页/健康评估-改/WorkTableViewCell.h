//
//  WorkTableViewCell.h
//  MagicFinger
//
//  Created by khj on 16/5/20.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSProConsultCell.h"
#import "TitleButton.h"
#import "Assessment.h"

@interface WorkTableViewCell : XFBaseLineTableCell
@property (nonatomic ,strong) NSArray *adminArray;
@property (nonatomic ,strong) NSArray *assessmentArray;
@property (nonatomic ,copy) void (^selectBlock)(TitleButton *titleButton);
+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
