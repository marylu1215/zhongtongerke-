//
//  Scoupon.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    
    CouponInquiryType = 0, //未使用
    CouponPackage = 1, //已使用
    CouponOverdue = 2,//已过期
} ScouponType;


@interface Scoupon : NSObject

@property (nonatomic ,assign) ScouponType  scouponType;

@property (nonatomic , copy)  NSString *price;
@property (nonatomic , copy)  NSString *info;
@property (nonatomic , copy)  NSString *type;
@property (nonatomic , copy)  NSString *date;

+(NSArray *)getAllScouponArray;

@end
