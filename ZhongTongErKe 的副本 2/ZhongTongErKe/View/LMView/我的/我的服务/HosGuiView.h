//
//  HosGuiView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/1.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "numberChooseBtnView.h"
#import "Doctor.h"

@interface HosGuiView : UIView
@property (nonatomic,strong) numberChooseBtnView *numberChoose;
@property (nonatomic ,strong) Doctor *doctor;

@end
