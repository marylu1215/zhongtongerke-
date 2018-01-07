//
//  XFModelTest.h
//  MagicFinger
//
//  Created by xufeng on 16/5/20.
//  Copyright © 2016年 zeenc. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface XFModelTest : NSObject
#pragma mark - 新数据
//** 今日课程 */
@property (nonatomic, strong) NSDictionary *todayCoursesDict;
//** 健康课程 */
@property (nonatomic, strong) NSDictionary *healthCoursesDict;
//** 课程详情 */
@property (nonatomic, strong) NSDictionary *courseDetailsDict;

//** 医生列表 */
@property (nonatomic, strong) NSDictionary *doctorListDict;

//** 课程表 */
@property (nonatomic, strong) NSDictionary *syllabuListDict;
//** 医院详情 */
@property (nonatomic, strong) NSDictionary *hospitalDetailDict;


//** 健康评估 */
@property (nonatomic, strong) NSDictionary *assessmentDict;

//** 健康史 */
@property (nonatomic, strong) NSDictionary *healthHistoryListDict;

//** 疾病 */
@property (nonatomic, strong) NSDictionary *diseaseListDict;

//**支付方式*/
@property (nonatomic, strong) NSDictionary *payModleListDict;

//**健康任务*/
@property (nonatomic, strong) NSDictionary *healthTaskListDict;

+ (instancetype)sharedModelTest;

@end
