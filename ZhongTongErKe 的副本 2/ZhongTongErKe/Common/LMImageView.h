//
//  LMImageView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMImageView : UIImageView
@property (nonatomic ,strong) UIButton *arrowBtn;
@property (nonatomic ,copy) void (^backBlock)();

@end
