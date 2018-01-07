//
//  CornerButton.m
//  Cannel
//
//  Created by 瀚宇科技 on 16/3/28.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "CornerButton.h"

@implementation CornerButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self cornerButtonWithCorner:kCorner];
        
        [self setBackgroundImage:[UIImage imageNamed:changePasswordImageName] forState:UIControlStateNormal];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self cornerButtonWithCorner:kCorner];
}

/**
 *  圆角
 */

- (void)cornerButtonWithCorner:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
   
}
@end
