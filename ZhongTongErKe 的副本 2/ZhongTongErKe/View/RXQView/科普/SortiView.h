//
//  SortiView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SortiView : UIView

@property (nonatomic , copy) void (^sortBlock)(BOOL isUP);

@end
