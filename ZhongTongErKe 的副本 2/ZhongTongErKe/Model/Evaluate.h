//
//  Evaluate.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Evaluate : NSObject

@property (nonatomic , copy)  NSString *content;
@property (nonatomic ,copy)  NSString *time;
@property (nonatomic ,copy)  NSString *tel;

+(NSArray *)getAllEvaluateArray;

@end
