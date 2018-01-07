//
//  XFWorkBaseController.h
//  MagicFinger
//
//  Created by xufeng on 16/5/25.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface XFWorkBaseController : BaseViewController


@property (nonatomic,strong) NSString *cid;

-(void)setUP;
-(void)configUI;
-(void)configFrame;
-(void)loadData;

-(void)showAlertView:(NSString *)msg;
-(void)showErrorWithJSON:(id)JSON;

@end
