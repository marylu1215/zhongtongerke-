//
//  NYSearchBar.m
//  NYHealth
//
//  Created by xufeng on 16/2/16.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "NYSearchBar.h"

@implementation NYSearchBar

-(void)layoutSubviews{
    UITextField *searchField;
    NSUInteger numViews = [self.subviews count];
    for(int i = 0; i < numViews; i++) {
        if([[self.subviews objectAtIndex:i] isKindOfClass:[UITextField class]]) { //conform?
            searchField = [self.subviews objectAtIndex:i];
        }
    }
    if(!(searchField == nil)) {
        searchField.textColor = [UIColor redColor];
        //	[searchField setBackground: [UIImage imageNamed:@"esri.png"] ];
        [searchField setBorderStyle:UITextBorderStyleRoundedRect];
        UIImage *image = [UIImage imageNamed:@"full_cart"];
        UIImageView *iView = [[UIImageView alloc] initWithImage:image];
        searchField.leftView = iView;
    }
    
    [super layoutSubviews];
}

@end
