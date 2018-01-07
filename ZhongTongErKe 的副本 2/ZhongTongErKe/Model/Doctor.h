//
//  Doctor.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SeverVice.h"
@interface Doctor : NSObject

@property (nonatomic ,copy) NSString *celebrity;
@property (nonatomic , copy) NSString *department;
@property (nonatomic , copy) NSString *departmentid;
@property (nonatomic , copy) NSString *doctorate;//博士
@property (nonatomic ,copy) NSString *experience;//经验年限
@property (nonatomic , copy) NSString *head;//头像
@property (nonatomic , copy) NSString *high;//头像
@property (nonatomic , copy) NSString *hot;//是否热门
@property (nonatomic , copy) NSString *cid;
@property (nonatomic , copy) NSString *master;//硕士
@property (nonatomic , copy) NSString *middle;
@property (nonatomic ,copy) NSString *name;//医生姓名
@property (nonatomic ,copy) NSString *num;//购买次数
@property (nonatomic ,copy) NSString *primary;

@property (nonatomic ,copy)  NSString *research;//学术研究成果
@property (nonatomic ,copy) NSString *ssyy;//所属医院
@property (nonatomic , copy)  NSString  *specialty;//特长
@property (nonatomic ,copy) NSString *title;//职称
@property (nonatomic ,copy) NSString *top;//是否置顶
@property (nonatomic , copy) NSString *present;
@property (nonatomic ,copy) NSString *university;//大学
@property (nonatomic ,copy) NSString *skill;
@property (nonatomic ,copy) NSString *rank;
@property (nonatomic ,copy) NSString *administrative;
@property (nonatomic ,copy) NSString *level;

@property (nonatomic ,copy) NSString *price;
@property (nonatomic ,strong) SeverVice *service;


@end
