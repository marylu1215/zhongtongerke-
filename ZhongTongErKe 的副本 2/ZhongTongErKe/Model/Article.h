//
//  Article.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic ,copy) NSString *cid;
@property (nonatomic ,copy) NSString *img;
@property (nonatomic ,copy) NSString *title;//文章标题
@property (nonatomic ,copy) NSString *content;//文章内容
@property (nonatomic ,copy) NSString *type;
@property (nonatomic, copy) NSString *see;
@property (nonatomic, copy) NSString *collection;
@property (nonatomic , copy) NSString *uploadtime;
@property (nonatomic , copy) NSString *uploaduser;
@property (nonatomic , copy) NSString *biaoshi;
@property (nonatomic , copy) NSString *uid;//上传文章的人
@property (nonatomic , copy) NSString *view;//查看次数
@property (nonatomic , copy) NSString *bookmark;//收藏人数
@property (nonatomic, assign) long long create_time;//收藏人数片路
@property (nonatomic , copy) NSString *path;//文章封面图片路径
@property (nonatomic , copy) NSString *des;//文章封面图片路径

@end
