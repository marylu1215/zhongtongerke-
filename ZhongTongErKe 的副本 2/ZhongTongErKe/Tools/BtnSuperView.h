//
//  BtnSuperView.h
//  MagicFinger
//
//  Created by khj on 16/8/22.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KJMenuButton.h"
@class HighlightedButton;

@interface BtnSuperView : UIView

@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, copy) void(^btnClickBolck)(HighlightedButton *btn);
@property (nonatomic, weak) KJMenuButton *topButton;

- (instancetype)initWithTitle:(NSString *)btnTitle;

@end
