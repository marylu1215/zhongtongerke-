//
//  NSDate+XFExtension.m
//  MagicFinger
//
//  Created by xufeng on 16/5/23.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "NSDate+XFExtension.h"

@implementation NSDate (XFExtension)
//获得当前的时间戳
//+(NSString *)getCurrentDateString
//{
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSTimeInterval delta = [zone secondsFromGMTForDate:[NSDate date]];
//    NSString *string = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970] + delta];
//    NSString *dateString = [[string componentsSeparatedByString:@"."]objectAtIndex:0];
//    return dateString;
//}
+(NSString *)getCurrentDateString
{
    //    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSDate *date = [NSDate date];
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];//东八区
//    NSInteger interval = [zone secondsFromGMTForDate: date];
//    NSDate *localeDate = [date dateByAddingTimeInterval: interval];
    
    NSTimeInterval a=[date timeIntervalSince1970] * 1000;
    NSString *timeString = [NSString stringWithFormat:@"%lld", (long long)a];
    return timeString;
}
+(NSString *)getCurrentDateStringFromFormatter:(NSString *)formatter{//北京时间
    NSDate *date = [NSDate date];
    NSDateFormatter* dateFormatter2 = [[NSDateFormatter alloc]init];
    [dateFormatter2 setDateStyle:NSDateFormatterFullStyle];
    [dateFormatter2 setDateFormat:formatter];
    NSString *fixString = [dateFormatter2 stringFromDate:date];
    return fixString;
}

@end
