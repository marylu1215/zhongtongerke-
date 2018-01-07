//
//  PurchaseTitleView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/7/7.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Purchase.h"

@interface PurchaseTitleView : UIView

@property (nonatomic ,strong) Purchase *purchase;

@property (nonatomic ,copy) void(^chooseBlock)();

-(id)initWithFrame:(CGRect)frame section:(BOOL)section;

@end
