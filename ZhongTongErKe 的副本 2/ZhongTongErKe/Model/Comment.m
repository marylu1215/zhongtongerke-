//
//  Comment.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "Comment.h"

@implementation Comment
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"cid" : @"id"
             };
}
@end
