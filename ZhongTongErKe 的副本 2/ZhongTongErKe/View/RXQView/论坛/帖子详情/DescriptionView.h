//
//  DescriptionView.h
//  MagicFinger
//
//  Created by xufeng on 16/10/14.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFWBTextView.h"
#import "XFTopBottomLineView.h"

@interface DescriptionView : XFTopBottomLineView
- (instancetype)initWithPlaceholder:(NSString *)placeholder maxLength:(NSInteger)length;
//** 问题描述 */
@property (nonatomic,strong) XFWBTextView *descriptionTV;

@end
