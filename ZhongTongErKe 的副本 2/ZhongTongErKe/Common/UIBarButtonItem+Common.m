//
//  UIBarButtonItem+Common.m
//
//  Created by kouhanjin on 16/4/10.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "UIBarButtonItem+Common.h"
#import "UIView+Frame.h"

@implementation UIBarButtonItem (Common)
+ (UIBarButtonItem *)itemWithBtnTitle:(NSString *)title target:(id)obj action:(SEL)selector{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:obj action:selector];
    [buttonItem setImageInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [buttonItem setTitleTextAttributes:@{NSForegroundColorAttributeName: c255255255,NSFontAttributeName:font(15)} forState:UIControlStateNormal];
    [buttonItem setTitleTextAttributes:@{NSForegroundColorAttributeName: c218218218,NSFontAttributeName:font(15)} forState:UIControlStateDisabled];
    return buttonItem;
}

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action font:(UIFont *)font color:(UIColor *)color highlightColor:(UIColor *)highlightColor
{
    UIButton* button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:highlightColor forState:UIControlStateHighlighted];
    button.titleLabel.font = font;
    CGSize size = CGSizeMake([NSString backSizeWithText:title andFont:font].width+20, 44);
    button.size = CGSizeMake(size.width, size.height);
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 19, 0, 0);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)itemWithIcon:(NSString*)iconName showBadge:(BOOL)showbadge target:(id)obj action:(SEL)selector {
    UIButton* button = [[UIButton alloc] init];
    button.imageEdgeInsets = UIEdgeInsetsMake(-2, 0, 0, 0);
    [button setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:iconName] forState:UIControlStateHighlighted];
    CGSize imgSize = button.imageView.image.size;
    button.size = CGSizeMake(imgSize.width, imgSize.height);

    [button addTarget:obj action:selector forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];;
}

+ (instancetype)itemWithImage:(NSString *)image hightImage:(NSString *)hightImage selectImage:(NSString *)selectImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    CGSize imageSize = btn.imageView.image.size;
//    btn.size = CGSizeMake(imageSize.width + 20, imageSize.height + 10);

    //xf
    btn.size = CGSizeMake(imageSize.width + 20, 44);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:btn];
}

+ (instancetype)redPointWithImage:(NSString *)image hightImage:(NSString *)hightImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    UIView *imageView = [[UIView alloc] init];
    imageView.backgroundColor = [UIColor redColor];
    
    imageView.y = btn.y - 2;
    imageView.width = 6;
    imageView.x = btn.width - imageView.width;
    imageView.height = imageView.width;
    imageView.layer.cornerRadius = imageView.width * 0.5;
    imageView.layer.masksToBounds = YES;
    
    [btn addSubview:imageView];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:btn];
}
@end
