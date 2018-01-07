//
//  PostDetailHeaderView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Invitation.h"

@interface PostDetailHeaderView : UIView

@property (nonatomic ,strong) UIButton *praiseButton;
@property (nonatomic ,strong) UIButton *replyButton;
@property (nonatomic ,strong) Invitation *invitation;

@property (nonatomic ,copy) void (^repBlock)(UIButton *replyButton);

@property (nonatomic ,copy) void (^priseBlock)(UIButton *priseButton);

@end
