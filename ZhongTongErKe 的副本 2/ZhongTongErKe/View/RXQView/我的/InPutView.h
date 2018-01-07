//
//  InPutView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InPutView : UIView<UITextFieldDelegate>

@property (nonatomic ,strong) UITextField *inputTextField;

-(id)initWithFrame:(CGRect)frame headImageStr:(NSString *)headImageStr placeHolder:(NSString *)placeHolder;

@end
