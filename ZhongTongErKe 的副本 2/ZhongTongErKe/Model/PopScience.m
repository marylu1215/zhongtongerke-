//
//  PopScience.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/14.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PopScience.h"

@implementation PopScience
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"cid" : @"id",
             @"des":@"description"
             };
}
@end
