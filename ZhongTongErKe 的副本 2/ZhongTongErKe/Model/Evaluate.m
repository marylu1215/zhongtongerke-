//
//  Evaluate.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "Evaluate.h"

@implementation Evaluate

+(NSArray *)getAllEvaluateArray
{
    Evaluate *evaluate = [Evaluate new];
    evaluate.content = @"带我家小朋友做了一次，怎么说昵，还是有点出乎意料。最让我吃惊的是当时有几位医生围绕着小朋友，服务确实挺不错的，的确节省时间，如果我自己医院，挂这几位专家号就得3~4周，准备所有材料可能还要得跑好几趟";
    evaluate.tel = @"180********8";
    evaluate.time = @"1111111111111";
    
    Evaluate *evaluate1 = [Evaluate new];
    evaluate1.content = @"带我家小朋友做了一次，怎么说昵，还是有点出乎意料。最让我吃惊的是当时有几位医生围绕着小朋友，服务确实挺不错的，的确节省时间，如果我自己医院，挂这几位专家号就得3~4周，准备所有材料可能还要得跑好几趟";
    evaluate1.tel = @"180********8";
    evaluate1.time = @"1111211111111";
    
    return @[evaluate ,evaluate1];
    
}
@end
