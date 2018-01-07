//
//  IWSearchBar.m
//  ItcastWeibo
//
//  Created by mj on 14-1-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWSearchBar.h"

@implementation IWSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clearsOnBeginEditing = YES;
        // 1.背景
        self.font = [UIFont systemFontOfSize:Font13];//Placeholder字体大小和你输入字体大小时一样的
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
        
        self.layer.cornerRadius = 3.0;
        
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        self.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: searchImageName]];
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}
-(void)setPlaceholder:(NSString *)placeholder{
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: RGBColor(153, 153, 153, 1.0)}];
}
- (CGRect)leftViewRectForBounds:(CGRect)bounds;{
    
    UIImage *image = [UIImage imageNamed:searchImageName];
    return CGRectMake(5, (self.height - image.size.height)/2, image.size.width, image.size.height);
}
-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    
    UIImage *image = [UIImage imageNamed:searchImageName];
    return CGRectMake(image.size.width + px(10) + px(10), bounds.origin.y, self.width - image.size.width - px(10) - px(10), bounds.size.height);
}
- (CGRect)editingRectForBounds:(CGRect)bounds;{
   
    UIImage *image = [UIImage imageNamed:searchImageName];
    return CGRectMake(image.size.width + px(10) + px(10), bounds.origin.y, self.width - image.size.width - px(10) - px(10), bounds.size.height);
}
- (CGRect)textRectForBounds:(CGRect)bounds{
    UIImage *image = [UIImage imageNamed:searchImageName];
    return CGRectMake(image.size.width + px(10) + px(10), bounds.origin.y, self.width - image.size.width - px(10) - px(10), bounds.size.height);
}

@end
