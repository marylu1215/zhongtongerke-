//
//  LMMEssage.m
//  LMNYHealth
//
//  Created by lm on 26/2/16.
//  Copyright © 2016年 LM. All rights reserved.
//

#import "LMMEssage.h"

@implementation LMMEssage

+(id)messageWithJSON:(NSDictionary *)messageDic
{
    return [[self alloc]initWithmessageJSON:messageDic];
}

-(id)initWithmessageJSON:(NSDictionary *)messageDic
{
    if (self = [super init]) {
        //解析每个小时的数据
        self.date =messageDic[@"date"];
        self.des=messageDic[@"description"];
        self.title=messageDic[@"title"];
        self.readflag=[messageDic[@"readflag"]intValue];
        self.mid=messageDic[@"mid"];
    }
    
    return self;

}
+(NSArray *)getAllMessage
{
    LMMEssage *msg1=[[LMMEssage alloc]init];
    msg1.date=@"11111111111";
    msg1.title=@"亲,点此签到领取15积分";
    msg1.des=@"领取15积分";
    
    msg1.readflag=0;
    
    LMMEssage *msg2=[[LMMEssage alloc]init];
   msg2.date= @"1111111111111";
   msg2.title=@"健身";
    msg2.des=@"一起健身";
    
    msg2.readflag=1;
    
    return @[msg1,msg2];
}
@end
