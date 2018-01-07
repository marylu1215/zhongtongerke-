//
//  PersonInfoHeaderView.h
//  MagicFinger
//
//  Created by xufeng on 16/5/18.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface PersonInfoHeaderView : UIView
@property (nonatomic ,strong) User *user;
@property (nonatomic,strong) UIImageView *avatarIV;
@property(nonatomic,strong)  UILabel *titleLabel;
@property (nonatomic,copy)   void(^avatarIVClickBlock)();


@end
