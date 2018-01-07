//
//  FamilyGroup.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FamilyGroup : NSObject

@property (nonatomic , copy)  NSString *cid;
@property (nonatomic , copy)  NSString *parentid;

@property (nonatomic , copy)  NSString *nikename;
@property (nonatomic , copy)  NSString *year;
@property (nonatomic ,copy)   NSString *sex;
@property (nonatomic ,copy)   NSString *height;
@property (nonatomic ,copy)   NSString *weight;
@property (nonatomic ,copy) NSString * marriage;//婚姻
@property (nonatomic ,copy) NSString *children ;//小孩
@property (nonatomic ,copy) NSString *culture ;//文化
@property (nonatomic ,copy) NSString *medical;
@property (nonatomic ,copy) NSString * medical_insurance;
@property (nonatomic ,assign) long sortNum;

@property (nonatomic ,copy) NSString *percent;



@end
