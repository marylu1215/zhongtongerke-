//
//  PopScience.h
//  ZhongTongErKe
//
//  Created by khj on 2017/7/14.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PopScience : NSObject

@property (nonatomic,copy) NSString *bookmark;//收藏人数
@property (nonatomic,copy) NSString *content;//内容
@property (nonatomic,assign) long long create_time;//上传时间
@property (nonatomic,copy) NSString *cid;//科普的id
@property (nonatomic,copy) NSString *path;//科普文章的封面
@property (nonatomic,copy) NSString *title;//标题
@property (nonatomic,copy) NSString *uid;//发表科普文章的id
@property (nonatomic,copy) NSString *view;//浏览量
@property (nonatomic,copy) NSString *des;//科普文章的类型


@end
