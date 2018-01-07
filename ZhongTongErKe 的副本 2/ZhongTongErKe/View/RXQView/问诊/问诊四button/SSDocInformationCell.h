//
//  SSDocInformationCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"
#import "Doctor.h"

@protocol  SSDocInformationCellDelegate <NSObject>
@optional
- (void)handleSelectedButtonActionWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath;

@end
@interface SSDocInformationCell :XFBaseLineTableCell

@property (nonatomic ,strong) Doctor *doctor;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic,strong) UIButton *checkButton;
@property (nonatomic, weak) id<SSDocInformationCellDelegate> delegate;
@property (assign, nonatomic) NSIndexPath *selectedIndexPath;

@end
