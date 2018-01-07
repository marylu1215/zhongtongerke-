//
//  LoginViewController.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/7.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "LMBaseViewController.h"
#import "User.h"
#import "LoginViewController.h"
#import "UserTool.h"
@interface LoginViewController : LMBaseViewController

@property (nonatomic ,copy) void (^backUserBlock)(User *user);


@property(nonatomic,strong)LoginViewController *loginview;

@end
