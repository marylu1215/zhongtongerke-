//
//  UITextField+XFExtension.h
//  MagicFinger
//
//  Created by xufeng on 16/5/19.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (XFExtension)
+(UITextField *)addTextFieldWithPlaceholder:(NSString *)placeholder Font:(CGFloat)font TextColor:(UIColor *)color TextAlignment:(NSTextAlignment)textAlignment;

// 限制汉字输入字数，英文时为2倍
- (void)textField:(UITextField *)textField maxZhHansStrLength:(NSInteger)length;

@end
