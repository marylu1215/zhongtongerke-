//
//  ReplyNote.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ReplyNote : NSObject
@property (nonatomic ,copy) NSString *comment_content;
@property (nonatomic ,copy) NSString *comment_like_num;
@property (nonatomic ,copy) NSString *head;
@property (nonatomic ,assign) BOOL is_cream;
@property (nonatomic ,assign) BOOL is_top;
@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,assign) long long upload_time;
@property (nonatomic ,copy) NSString *user_name;
@property (nonatomic ,copy) NSString *cid;//话题ID

@end
