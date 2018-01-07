//
//  Answer.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface Answer : NSObject

@property (nonatomic ,copy) NSString *doctor_head;
@property (nonatomic ,copy) NSString *answer;
@property (nonatomic ,copy) NSString *content;
@property (nonatomic ,assign) long long create_time;
@property (nonatomic ,copy) NSString *doctor_name;
@property (nonatomic ,copy) NSString *doctorid;
@property (nonatomic ,copy) NSString *cid;
@property (nonatomic ,copy) NSString *num;
@property (nonatomic ,assign) long long over_time;
@property (nonatomic ,copy) NSString *type;
@property (nonatomic ,copy) NSString *userid;
@property (nonatomic ,copy) NSString *view;
@property (nonatomic ,copy) NSString *price;

@end
