//
//  KJVerticalButton.h
//  
//
//  Created by kouhanjin on 16/2/19.
//  Copyright © 2016年 khj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KJVerticalButton : UIButton
@property (nonatomic, weak) UIView *badgeView;

- (void)showRedPoint;
- (void)hideRedPoint;
@end
