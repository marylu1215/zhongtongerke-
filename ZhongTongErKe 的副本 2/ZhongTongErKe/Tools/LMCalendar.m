//
//  LMCalendar.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "LMCalendar.h"

@implementation LMCalendar
static LMCalendar *_manger;
+(instancetype)sharedCalender
{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _manger =
      (LMCalendar*)[NSCalendar autoupdatingCurrentCalendar];
        });
        return _manger;
   

}
@end
