//
//  UIBarButtonItem+Common.m
//
//  Created by kouhanjin on 16/4/10.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Common)
+ (UIBarButtonItem *)itemWithBtnTitle:(NSString *)title target:(id)obj action:(SEL)selector;

+ (UIBarButtonItem *)itemWithIcon:(NSString*)iconName showBadge:(BOOL)showbadge target:(id)obj action:(SEL)selector;

+ (instancetype)itemWithImage:(NSString *)image hightImage:(NSString *)hightImage selectImage:(NSString *)selectImage target:(id)target action:(SEL)action;

+ (instancetype)redPointWithImage:(NSString *)image hightImage:(NSString *)hightImage target:(id)target action:(SEL)action;

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action font:(UIFont *)font color:(UIColor *)color highlightColor:(UIColor *)highlightColor;
@end

