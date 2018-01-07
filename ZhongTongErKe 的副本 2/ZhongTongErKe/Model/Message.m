//
//  Message.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/26.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "Message.h"

@implementation Message

+(NSArray *)getAllMessages
{
    Message *doctorservice = [[Message alloc]init];
    doctorservice.headInfo = doctorserviceImageName;
    doctorservice.info = @"医生服务";
    
    Message *voice = [[Message alloc]init];
   voice.headInfo = voiceIconImageName;
    voice.info = @"语音服务";
    
    
    Message *systemNotice = [[Message alloc]init];
    systemNotice.headInfo = systemNoticeImageName;
    systemNotice.info = @"系统公告";
    

    Message *recommend = [[Message alloc]init];
    recommend.headInfo = recommendImageName;
    recommend.info = @"为您推荐";
    
    
    return @[doctorservice,voice,systemNotice,recommend];
    
}
@end
