//
//  Forum.h
//  ZhongTongErKe
//
//  Created by khj on 2017/7/3.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Forum : NSObject

@property (nonatomic ,copy) NSString *cid;//话题ID
@property (nonatomic ,copy) NSString *group_id;//话题帖子所属群组ID
@property (nonatomic ,copy) NSString *title;//话题标题
@property (nonatomic ,copy) NSString *content;//话题内容
@property (nonatomic ,copy) NSString *img;//话题插图
@property (nonatomic ,copy) NSString *publish_name;//上传人
@property (nonatomic ,assign) long long upload_time;//上传时间
@property (nonatomic ,copy) NSString *reply;//查看人数
@property (nonatomic ,assign)BOOL is_top;//是否置顶
@property (nonatomic ,assign) BOOL is_cream;//是否为精华
@property (nonatomic ,assign) long long save_time;//

@end
