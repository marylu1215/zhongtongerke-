//
//  HealthHistory.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Problem.h"

@interface HealthHistory : NSObject

@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *subTitle;
@property (nonatomic ,strong) NSArray *problems;
@property (nonatomic ,assign) long long create_time;
@property (nonatomic ,copy) NSString *cid;
@property (nonatomic ,copy) NSString *jks;
@property (nonatomic ,assign) long long upload_time;
@property (nonatomic ,copy) NSString *userid;

@end
