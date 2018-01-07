//
//  ICMapHelper.m
//  MagicFinger
//
//  Created by 瀚宇科技 on 16/5/9.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "ICMapHelper.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
//地图
#import <MAMapKit/MAMapKit.h>
//导航
#import <AMapNaviKit/AMapNaviKit.h>
//搜索
#import <AMapSearchKit/AMapSearchKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@implementation ICMapHelper
+ (void)registerMapSDK
{
    //地图
    [[AMapServices sharedServices] setEnableHTTPS:YES];
    [AMapServices sharedServices].apiKey = [self apiKey];
    
}

+ (NSString *)apiKey
{
    return @"379af740d025b48a1dda13b7dc820e5f";
}
@end
