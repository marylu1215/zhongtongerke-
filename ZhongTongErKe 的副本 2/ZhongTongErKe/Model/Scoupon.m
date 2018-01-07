//
//  Scoupon.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "Scoupon.h"

@implementation Scoupon

+(NSArray *)getAllScouponArray

{
    Scoupon *inCou = [[Scoupon alloc]init];
    inCou.scouponType =0;
    inCou.price =@"￥3";
    inCou.info = @"满3.01使用";
    inCou.type =@"问诊优惠券";
    inCou.date = @"2017.5.1 - 2017.6.1";
    
    Scoupon *packageCou = [[Scoupon alloc]init];
    packageCou.scouponType = 1;
    packageCou.price =@"8.5折";
    packageCou.info = @"满300使用";
    packageCou.type =@"专家会诊套餐优惠券";
    packageCou.date = @"2017.5.1 - 2017.6.1";
    
    
    Scoupon *overdueCou = [[Scoupon alloc]init];
    overdueCou.scouponType = 2;
    overdueCou.info = @"满300使用";
    return @[inCou,packageCou,overdueCou];
    
}
@end
