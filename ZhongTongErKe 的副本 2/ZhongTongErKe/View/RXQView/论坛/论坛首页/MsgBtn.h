//
//  MsgBtn.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MsgBtn : UIButton

@property (nonatomic ,strong) UIImageView *messageView;

@property (nonatomic, strong) UIImageView *redPointView;

-(id)initWithFrame:(CGRect)frame
;

@end
