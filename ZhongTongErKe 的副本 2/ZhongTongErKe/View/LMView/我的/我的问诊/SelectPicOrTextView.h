//
//  SelectPicOrTextView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/15.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectPicOrTextView : UIView

@property (nonatomic , copy) void (^btnSelectBlock)(UIButton *btn);

@end
