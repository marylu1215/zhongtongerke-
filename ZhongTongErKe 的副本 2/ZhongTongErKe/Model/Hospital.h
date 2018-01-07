//
//  Hospital.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hospital : NSObject

@property (nonatomic ,copy) NSString *address;
@property (nonatomic ,copy) NSString *content;
@property (nonatomic ,copy) NSString *cid;
@property (nonatomic ,copy) NSString *img;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *subTitle;
@property (nonatomic ,copy) NSString *nature;
@property (nonatomic ,copy) NSString *insurance;
@property (nonatomic ,strong) NSArray *honInArray;
@property (nonatomic ,copy) NSString *distance;
@property (nonatomic ,copy) NSString *level;
@property (nonatomic ,copy) NSString *medInsu;
@property (nonatomic ,copy) NSString *information;

@end
