//
//  UIButton+Extension.h
//  Shopping
//
//  Created by beijingduanluo on 15/8/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (Extension)
/**
  创建Button
 */
+ (UIButton *)addBtnImage:(NSString *)imgName WithTarget:(id)target action:(SEL)action;
+(UIButton *)addBtnImage:(NSString *)img  WithTitle:(NSString *)title AndTitleColor:(UIColor *)color AndTitleFont:(CGFloat)font AndImgInsets:(UIEdgeInsets)edgeInset AndTitleEdgeInsets:(UIEdgeInsets)titleInsets AndTarget:(id)traget AndAction:(SEL)selector;

+(UIButton *)addBtnWithTitle:(NSString *)title WithBGImg:(NSString *)backImg WithFont:(CGFloat)font WithTitleColor:(UIColor *)color Target:(id)traget Action:(SEL)action;

+(UIButton *)addBtnImage:(NSString *)img  WithTitle:(NSString *)title AndTitleColor:(UIColor *)color AndTitleFont:(CGFloat)font AndTarget:(id)traget AndAction:(SEL)selector;

+(UIButton *)addLeftImage:(NSString *)img  WithTitle:(NSString *)title AndTitleColor:(UIColor *)color AndTitleFont:(CGFloat)font;

/**
创建导航栏左边按钮
 */
+(UIButton *)creatLeftBtnWithImageName:(NSString *)imageName Target:(id)traget Action:(SEL)action;

//圆角按钮
+(UIButton *)addCornerBtnWithTitle:(NSString *)title WithBGImg:(NSString *)backImg WithFont:(CGFloat)font WithTitleColor:(UIColor *)color Target:(id)traget Action:(SEL)action;

/**
 *  背景按钮
 */
+(UIButton *)addBgBtnWithBGClor:(UIColor  *)color  Target:(id)traget Action:(SEL)action;
//箭头按钮
+(UIButton *)addArrowBtnWithImageName:(NSString *)imageName;
// 开关按钮
+ (UIButton *)addStatusImage:(UIImage *)statusImg WithTarget:(id)target action:(SEL)action;
/**
 *  设置按钮背景色
 *
 *  @param backgroundColor 背景颜色
 *  @param state           状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end
