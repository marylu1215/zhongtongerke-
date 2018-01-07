//
//  Invitation.h
//  ZhongTongErKe
//
//  Created by khj on 2017/7/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Invitation : NSObject

@property (nonatomic ,copy) NSString *comment_content;
@property (nonatomic ,copy) NSString *comment_like_num;
@property (nonatomic ,copy) NSString *comment_time;
@property (nonatomic ,copy) NSString *head;
@property (nonatomic ,copy) NSString *cid;
@property (nonatomic ,copy) NSString *parent_id;
@property (nonatomic ,copy) NSString *userid;
@property (nonatomic ,copy) NSString *username;
@property (nonatomic,assign) BOOL seeMore;
@end
