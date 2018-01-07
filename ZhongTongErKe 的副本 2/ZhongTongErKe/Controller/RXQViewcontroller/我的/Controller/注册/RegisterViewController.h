//
//  RegisterViewController.h
//  MagicFinger
//
//  Created by khj on 16/5/18.
//  Copyright © 2016年 zeenc. All rights reserved.
//


@interface RegisterViewController :  XFWorkBaseController

@property (nonatomic, copy) void(^registerSucessBlock)(NSString *tel,NSString *pwd,BOOL isShowMsg);

@end
