//
//  UITextView+XFExtension.h
//  MagicFinger
//
//  Created by xufeng on 16/6/23.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (XFExtension)
@property (nonatomic,copy) void(^textLengthBlock)(NSUInteger count);

- (void)textView:(UITextView *)textView maxStrLength:(NSInteger)length;

@end
