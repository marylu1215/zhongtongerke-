//
//  Course.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject

@property (nonatomic , copy) NSString *title;
@property (nonatomic ,copy)  NSString *num;
@property (nonatomic ,copy)  NSString *courseUrl;
@property (nonatomic ,copy)  NSString *courseImageName;

//**适应年龄 */
@property (nonatomic ,copy)  NSString *adaptiveAge;
//** 课程频次 */
@property (nonatomic ,copy)  NSString *frequency;
//** 课时 */
@property (nonatomic ,copy)  NSString *period;
//**形式 */
@property (nonatomic ,copy)  NSString *form;
//** 目标*/
@property (nonatomic ,copy)  NSString *goal;
//**适应症 */
@property (nonatomic ,copy)  NSArray *primaryArray;
//** 目标*/
@property (nonatomic ,copy)  NSString *state;

@property (nonatomic ,copy) NSString *sortNum;

@property (nonatomic ,copy) NSString *date;

@property (nonatomic ,copy) NSString *teacher;
@end
