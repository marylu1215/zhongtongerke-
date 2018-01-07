//
//  XFWBTextView.h
//  LMNYHealth
//
//  Created by xufeng on 16/4/7.
//  Copyright © 2016年 LM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFWBTextView : UITextView
@property(nonatomic,copy) NSString *myPlaceholder;  //文字

@property(nonatomic,strong) UIColor *myPlaceholderColor; //文字颜色

@property (nonatomic,weak) UILabel *placeholderLabel; //这里先拿出这个label以方便我们后面的使用

@end
