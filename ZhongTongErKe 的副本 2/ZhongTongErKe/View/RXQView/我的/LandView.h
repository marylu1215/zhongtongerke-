//
//  LandView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandView : UIView

@property (nonatomic ,copy) void (^landBlock)();
@property (nonatomic ,copy) void (^registerBlock)();
@property (nonatomic ,copy) void (^forgetBlock)();

-(id)initWithFrame:(CGRect)frame landBtnTitle:(NSString *)title account:(NSString *)accountTip registerStr:(NSString *)registerStr forgetPwd:(NSString *)forgetPwd;

@end
