//
//  NSDate+XFExtension.h
//  MagicFinger
//
//  Created by xufeng on 16/5/23.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XFExtension)
//获得当前的时间戳
+(NSString *)getCurrentDateString;
+(NSString *)getCurrentDateStringFromFormatter:(NSString *)formatter;
@end
