//
//  Comment.h
//  ZhongTongErKe
//
//  Created by khj on 2017/7/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (nonatomic ,copy) NSString *content;
@property (nonatomic ,assign) long long create_time;
@property (nonatomic ,copy) NSString *doctorid;
@property (nonatomic ,copy) NSString *gift;
@property (nonatomic ,copy) NSString *cid;
@property (nonatomic ,copy) NSString *service;
@property (nonatomic ,copy) NSString *state;
@property (nonatomic ,copy) NSString *userid;
@property (nonatomic ,copy) NSString *username;
@property (nonatomic ,copy) NSString *view;

@end
