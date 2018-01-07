//
//  GuideView.h
//  MagicFinger
//
//  Created by khj on 16/11/7.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideView : UIView
+ (void)showGudieView:(NSArray *)imageArray;
- (instancetype)init:(NSArray *)imageArray;
@end
