//
//  XFDatePickerView.h
//  MagicFinger
//
//  Created by xufeng on 16/6/15.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    XFDatePickerTypeYMD, //年月日
    XFDatePickerTypeYMDHM,//年月日时分
    XFDatePickerTypeYM//年月
} XFDatePickerType;
@class XFDatePickerView;
@protocol XFDatePickerViewDelegate <NSObject>
@optional
/**
 *  确定选择回调
 *
 *  @param datePicker       时间选择器
 *  @param dateFormatterStr 格式化了时间 xxxx-xx-xx 或 xxxx-xx-xx xx：xx
 *  @param timeStr          时间戳
 */
-(void)sureChooseDate:(XFDatePickerView *)datePicker chooseDateFormatterStr:(NSString *)dateFormatterStr TimeInterval:(NSString *)timeStr;
//取消选择
-(void)cancelChooseDate;
@end
@interface XFDatePickerView : UIView
@property (nonatomic,weak) id delegate;
@property (nonatomic,assign) BOOL addDate;
/**
 *  初始化时间选择器
 *
 *  @param currentD   时间戳  默认：nil
 *  @param destinateY 截止年限 比如：2100
 *  @param type       类型：年月日 或 年月日 分：秒
 *
 *  @return 时间选择器
 */
-(instancetype)initWithCurrentDate:(NSString *)currentD destinateYear:(int)destinateY datePickerType:(XFDatePickerType)type;
- (void)showInView:(UIViewController *)sView;

@end
