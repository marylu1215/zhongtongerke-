//
//  SSDocDetailTopView.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/21.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hospital.h"

@interface SSDocDetailTopView : UIView
@property (nonatomic ,strong) Hospital *hospital;
@property (nonatomic ,strong) UIButton *arrowBtn;
@property (nonatomic , copy) void (^telBlock)();
@property (nonatomic ,copy) void (^backBlock)();

@end
