//
//  PaymentModeCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/7/7.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "XFBaseLineTableCell.h"
#import "PayModel.h"

@protocol PaymentModeCellDelegte <NSObject>

@optional
- (void)handleSelectedButtonActionWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath;

@end

@interface PaymentModeCell : XFBaseLineTableCell

@property (nonatomic ,strong) UIButton *chooseButton;
@property (nonatomic, weak) id<PaymentModeCellDelegte> delegate;

@property (assign, nonatomic) NSIndexPath *selectedIndexPath;

@property (nonatomic ,strong) PayModel *payModel;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
