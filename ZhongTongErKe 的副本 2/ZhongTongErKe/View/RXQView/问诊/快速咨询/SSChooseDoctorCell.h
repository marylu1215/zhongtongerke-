//
//  SSChooseDoctorCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFBaseLineTableCell.h"


@protocol  SSChooseDoctorCellDelegate <NSObject>
@optional
- (void)handleSelectedButtonActionWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath;

@end

@interface SSChooseDoctorCell : XFBaseLineTableCell

@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *describeLabel;
@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic ,strong) UILabel *priceLabel;
@property (nonatomic,strong) UIButton *checkButton;

@property (nonatomic, weak) id<SSChooseDoctorCellDelegate> delegate;
@property (assign, nonatomic) NSIndexPath *selectedIndexPath;

@end
