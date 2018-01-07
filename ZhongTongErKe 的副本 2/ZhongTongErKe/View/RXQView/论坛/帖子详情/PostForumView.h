//
//  PostForumView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/6.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Forum.h"

@interface PostForumView : UIView

@property (nonatomic , copy) NSString *noteNum;
@property (nonatomic ,strong) UITextField *repTextField;
@property (nonatomic ,copy) void (^sendBlock)();

@property (nonatomic ,strong) Forum *forum;

@end
