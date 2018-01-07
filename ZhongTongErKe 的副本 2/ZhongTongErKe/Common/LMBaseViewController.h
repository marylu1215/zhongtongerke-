//
//  LMBaseViewController.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMBaseViewController : UIViewController
-(void)setUP;
-(void)configUI;
-(void)configFrame;
-(void)loadData;
-(void)showAlertView:(NSString *)msg;
-(void)showErrorWithJSON:(id)JSON;
@end
