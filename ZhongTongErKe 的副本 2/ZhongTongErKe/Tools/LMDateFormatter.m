//
//  LMDateFormatter.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "LMDateFormatter.h"

@implementation LMDateFormatter
static LMDateFormatter *_manger;

+ (instancetype)sharedFormatter
{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _manger = [[LMDateFormatter alloc]init];
        });
        return _manger;
    
}
@end
