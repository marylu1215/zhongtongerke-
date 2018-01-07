//
//  XFWorkBaseTableViewController.h
//  MagicFinger
//
//  Created by xufeng on 16/6/6.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFWorkBaseTableViewController : UITableViewController
/**
 功能编码数组
 */
-(void)setUP;
-(void)configUI;
-(void)configFrame;
-(void)loadData;
-(void)showAlertView:(NSString *)msg;
-(void)showErrorWithJSON:(id)JSON;

@end
