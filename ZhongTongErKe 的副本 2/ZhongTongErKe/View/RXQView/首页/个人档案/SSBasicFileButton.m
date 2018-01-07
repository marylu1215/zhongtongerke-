//
//  SSBasicFileButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/6.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSBasicFileButton.h"

@implementation SSBasicFileButton



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
      
        
        self.layer.borderColor = cHBColor.CGColor;
        self.layer.borderWidth =px(2);
        self.layer.cornerRadius = 4;
        self.clipsToBounds =YES;
        self.titleLabel.font = font(Font13);
        [self setBackgroundColor:c255255255 forState:UIControlStateNormal];
        [self setBackgroundColor:cHBColor forState:UIControlStateDisabled];
        [self setTitleColor:cHBColor forState:UIControlStateNormal];
        [self setTitleColor:c255255255 forState:UIControlStateDisabled];
        
        
    }
    return self;
}






@end
