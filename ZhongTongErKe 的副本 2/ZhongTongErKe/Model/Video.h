//
//  Video.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *collection;//收藏人数
@property (nonatomic ,copy) NSString *cid;//视频id
@property (nonatomic ,copy) NSString *url;//视频路径
@property (nonatomic ,copy) NSString *img;
@property (nonatomic ,copy) NSString *see;//查看人数
@property (nonatomic ,copy) NSString *uploaduser;//上传人
@property (nonatomic ,copy) NSString *uploadtime;//上传时间
@property (nonatomic ,copy) NSString *type;//视频标识

@end
