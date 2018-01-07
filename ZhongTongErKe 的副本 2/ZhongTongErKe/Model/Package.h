//
//  Package.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Package : NSObject

@property (nonatomic ,copy) NSString *price;
@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *content;
@property (nonatomic ,assign) long long create_time;
@property (nonatomic ,copy) NSString *department;
@property (nonatomic ,copy) NSString *departmentid;
@property (nonatomic ,copy) NSString *des;
@property (nonatomic ,copy) NSString *cid;
@property (nonatomic ,copy) NSString *img;
@property (nonatomic ,copy) NSString *view;

@end
