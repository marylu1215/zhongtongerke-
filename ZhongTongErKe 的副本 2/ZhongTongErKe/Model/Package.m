//
//  Package.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "Package.h"

@implementation Package

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"cid" : @"id",
             @"des" :@"description"
             };
}

@end
