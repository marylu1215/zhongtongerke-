//
//  ICNavigationController.h
//  MagicFinger
//
//  Created by 瀚宇科技 on 16/4/27.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICNavigationController : UINavigationController
@property (nonatomic,weak) UIButton *button;
- (void)back:(UIButton *)btn;
@end
