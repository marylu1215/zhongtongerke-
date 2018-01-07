//
//  HealthHistory.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "HealthHistory.h"

@implementation HealthHistory

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"cid" : @"id"
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"problems" : [Problem  class]
             };
}
@end
