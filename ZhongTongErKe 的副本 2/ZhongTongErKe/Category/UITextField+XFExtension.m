//
//  UITextField+XFExtension.m
//  MagicFinger
//
//  Created by xufeng on 16/5/19.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "UITextField+XFExtension.h"

@implementation UITextField (XFExtension)
+(UITextField *)addTextFieldWithPlaceholder:(NSString *)placeholder Font:(CGFloat)font TextColor:(UIColor *)color TextAlignment:(NSTextAlignment)textAlignment{
    UITextField *TF = [[UITextField alloc]init];
    TF.font = [UIFont systemFontOfSize:font];
    TF.textColor = color;
    TF.textAlignment = textAlignment;
    TF.placeholder = placeholder;
    
    TF.clearButtonMode = UITextFieldViewModeWhileEditing;
    TF.returnKeyType = UIReturnKeyDone;
    return TF;
}

/**
 限制汉字输入字数，英文时为2倍

 @param textField
 @param length    汉字输入字数
 */
- (void)textField:(UITextField *)textField maxZhHansStrLength:(NSInteger)length
{
    NSString *toBeString = textField.text;
    //    toBeString = [toBeString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    // 取出字符串收尾空格
    NSString *lang = [textField.textInputMode primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > length) {
                textField.text = [toBeString substringToIndex:length];
                
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        NSInteger limitLength = length * 2;
        BOOL hasZhHans = NO;
        for (int i=0; i<toBeString.length; i++)
        {
            NSRange range=NSMakeRange(i,1);
            
            NSString *subString=[toBeString substringWithRange:range];
            
            const char *cString=[subString UTF8String];
            
            if (strlen(cString)==3){
                //有汉字
                hasZhHans = YES;
            }
        }
        if (hasZhHans) {
            limitLength = length;
        }
        if (toBeString.length > limitLength) {
            textField.text = [toBeString substringToIndex:limitLength];
            
        }
    }
    
}

@end
