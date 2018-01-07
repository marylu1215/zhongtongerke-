//
//  UIButton+XFExtension.h
//  MagicFinger
//
//  Created by xufeng on 16/5/19.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XFExtension)
+(UIButton *)addBtnWithTitle:(NSString *)title WithFont:(CGFloat)font WithTitleColor:(UIColor *)color;
+(UIButton *)addBtnWithTitle:(NSString *)title WithFont:(CGFloat)font WithTitleNomalColor:(UIColor *)color TitleHighlightedColor:(UIColor *)highlightedColor;
+(UIButton *)addBtnWithTitle:(NSString *)title WithFont:(CGFloat)font WithTitleColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius backNormalColor:(UIColor *)normalColor backHighlightedColor:(UIColor *)highlightedColor;
+(UIButton *)topImageBtnWithTitle:(NSString *)title ImageName:(NSString *)imageName;
- (void)verticalImageAndTitle:(CGFloat)spacing;
+ (UIButton *)leftWordBtn:(NSString *)title image:(UIImage *)image font:(UIFont *)font spacing:(CGFloat)spacing;
-(void)topImageConfig;
-(void)imageCenterConfig;
@end
