//
//  UITextView+XFExtension.m
//  MagicFinger
//
//  Created by xufeng on 16/6/23.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "UITextView+XFExtension.h"
#import <objc/runtime.h>

static NSString *textCountStr = @"textCountStr";
@implementation UITextView (XFExtension)
- (void)setTextLengthBlock:(void (^)(NSUInteger))textCountBlock{
    objc_setAssociatedObject(self, &textCountStr, textCountBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(NSUInteger))textLengthBlock{
    return objc_getAssociatedObject(self, &textCountStr);
}

- (void)textView:(UITextView *)textView maxStrLength:(NSInteger)length
{
    NSString *toBeString = textView.text;
    //    toBeString = [toBeString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    // 取出字符串收尾空格
    NSString *lang = [textView.textInputMode primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        ICLog(@"position:%@",position);
        if (!position) {
            if (toBeString.length > length) {
                textView.text = [toBeString substringToIndex:length];
            }
            if (self.textLengthBlock) {
                self.textLengthBlock(textView.text.length);
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (toBeString.length > length) {
            textView.text = [toBeString substringToIndex:length];
        }
        if (self.textLengthBlock) {
            self.textLengthBlock(textView.text.length);
        }
    }
    
}

@end
