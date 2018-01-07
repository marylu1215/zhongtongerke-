//
//  SSCouponTableViewCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scoupon.h"

@class  SSCouponTableViewCell;
@protocol SSCouponTableViewCellDelegate <NSObject>

@optional

-(void)SSCouponTableViewCellDelegate:(SSCouponTableViewCell *)cell WithBtn:(UIButton *)btn;

@end

@interface SSCouponTableViewCell : UITableViewCell

@property (nonatomic ,strong) Scoupon *scoupon;
@property(nonatomic,weak) id<SSCouponTableViewCellDelegate>delegate;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
