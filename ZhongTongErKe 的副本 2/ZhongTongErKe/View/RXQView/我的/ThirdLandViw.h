//
//  ThirdLandViw.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/9.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdLandViw : UIView

@property (nonatomic , copy) void (^clickBtnBlock)(UIButton *btn);

-(id)initWithFrame:(CGRect)frame WithIconArr:(NSArray *)IconArr;

@end
