//
//  ExConsult.h
//  ZhongTongErKe
//
//  Created by khj on 2017/7/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExConsult : NSObject

@property (nonatomic ,copy) NSString *content;
@property (nonatomic ,assign) long long create_time;
@property (nonatomic ,strong) NSArray *doctorid;
@property (nonatomic ,copy) NSString *cid;
@property (nonatomic ,copy) NSString *userid;
@property (nonatomic ,copy) NSString *view;
@property (nonatomic ,copy) NSString *head;
@property (nonatomic ,copy) NSString *answer;
@property (nonatomic ,copy) NSString *doctor_head;
@property (nonatomic ,copy) NSString *doctorname;
@property (nonatomic ,copy) NSString *num;
@property (nonatomic ,assign) long long over_time;
@property (nonatomic ,copy) NSString *type;
@property (nonatomic ,copy) NSString *user_head;
@property (nonatomic ,copy) NSString *username;
@property (nonatomic ,copy) NSString *price;
@end
