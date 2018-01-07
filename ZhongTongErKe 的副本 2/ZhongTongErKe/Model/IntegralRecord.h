//
//  IntegralRecord.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Integral;

@interface IntegralRecord : NSObject
//** 日期 */
@property (nonatomic ,copy) NSString *IRDate;

@property (nonatomic , strong) NSArray *integralArray;


@end
