//
//  LMMEssage.h
//  LMNYHealth
//
//  Created by lm on 26/2/16.
//  Copyright © 2016年 LM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMMEssage : NSObject

@property(nonatomic,copy) NSString  *date;
@property(nonatomic,strong)NSString *des;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,assign)int  readflag ;
@property(nonatomic,strong)NSString *mid;
+ (id)messageWithJSON:(NSDictionary *)MessageDic;
+(NSArray *)getAllMessage;
@end
