//
//  KJPlaceholderTextView.h
//  
//
//  Created by kouhanjin on 16/3/17.
//  Copyright © 2016年 khj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KJPlaceholderTextView : UITextView
/** 占位文字 */
/** 占位文字label */
@property (nonatomic, weak) UILabel *placeholderLabel;
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字的颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
/**
 *  textView最大行数
 */
@property (nonatomic, assign) NSUInteger maxNumberOfLines;
/**
 *  文字高度改变block → 文字高度改变会自动调用
 *  block参数(text) → 文字内容
 *  block参数(textHeight) → 文字高度
 */
@property (nonatomic, strong) void(^kj_textHeightChangeBlock)(NSString *text,CGFloat textHeight);
@property (nonatomic, copy) void(^textCountBlock)(NSUInteger count,NSString *text);
@end
