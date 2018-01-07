//
//  Message.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/26.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic ,copy) NSString *headInfo;

@property (nonatomic ,copy) NSString *info;


+(NSArray *)getAllMessages;

@end
