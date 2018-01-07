//
//  DiffPostView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/7/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Forum.h"
#import "ReplyNote.h"

@interface DiffPostView : UIView

@property (nonatomic ,strong) Forum *forum;
@property (nonatomic ,strong) ReplyNote *replyNote;

@end
