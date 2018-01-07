//
//  SSBottomScrollView.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSIndexHeadView.h"
@interface SSBottomScrollView : TouchScrollView

@property (nonatomic , strong)  UIButton *addCourseBtn;

@property (nonatomic , copy) void (^chooseBlock)();

-(id)initWithFrame:(CGRect)frame courseArray:(NSArray *)courseArray;


@end
