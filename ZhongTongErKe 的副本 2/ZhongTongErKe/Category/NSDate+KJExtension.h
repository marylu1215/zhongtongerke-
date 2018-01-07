//
//  NSDate+KJExtension.h
//
//  Created by kouhanjin on 16/8/16.
//  Copyright © 2016年 khj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (KJExtension)
/**
 * 是否为今年
 */
- (BOOL)isThisYear;
/**
 * 是否为今天
 */
- (BOOL)isThisToday;
/**
 * 是否为昨天
 */
- (BOOL)isThisYesterday;

/** 获取到的时间字符串转成NSDate */
+ (NSDate * )timeStringToDate: (NSString *)timeString;
/** 把NSDate转成自己需要的时间格式 */
- (NSString *)dateToRequiredString;

@end
