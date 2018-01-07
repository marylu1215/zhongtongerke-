//
//  NSArray+Tool.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "NSArray+Tool.h"

@implementation NSArray (Tool)

+(NSArray *)getIntendWithIntendNum:(long)Num IntendArr:(NSArray *)intendArr
{
    if (intendArr.count<Num) {
        
        return intendArr;
    }
    else
    {
        NSMutableArray *intendMutableArr = [NSMutableArray new];
        
        for (int index=0; index<Num; index++) {
            
            [intendMutableArr addObject:intendArr[index]];
        }
        
        return intendMutableArr;
    }
}
@end
