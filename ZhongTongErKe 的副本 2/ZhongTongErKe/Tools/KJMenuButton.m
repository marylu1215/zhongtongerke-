//
//  KJMenuButton.m
//  MagicFinger
//
//  Created by khj on 16/9/13.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "KJMenuButton.h"

@implementation KJMenuButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView.x < self.titleLabel.x) {
        
        self.titleLabel.x = self.imageView.x;
        
        self.imageView.x = self.titleLabel.maxX + 5;
    }
}

@end
