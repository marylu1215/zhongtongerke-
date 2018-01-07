//
//  SSBottomButton.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/11.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSBottomButton : UIButton

@property (nonatomic,strong)UILabel *contentLabel;
+ (instancetype)loadBottomButtonWithTitle:(NSString *)title;

@end
