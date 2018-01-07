//
//  numberChooseBtnView.h
//  NYHealth
//
//  Created by xufeng on 16/2/19.
//  Copyright © 2016年 HY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface numberChooseBtnView : UIView

@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) UIButton *rightBtn;
@property (nonatomic,strong) UILabel *numberLabel;
@property (nonatomic,assign) int number;
+(numberChooseBtnView *)numberChooseBtnViewWith:(int)number;
-(void)leftBtnClick;
-(void)rightBtnClick;
@end
