//
//  SSVoiceQuestionView.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"
#import "DescriptionView.h"

@interface SSVoiceQuestionView : UIView
//** 问题描述 */
@property (nonatomic, strong) DescriptionView *descView;
@property (nonatomic ,strong) Doctor *doctor;

@end
