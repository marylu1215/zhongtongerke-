//
//  NSString+Tools.h
//  
//
//  Created by kouhanjin on 15/12/21.
//  Copyright © 2015年 khj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Tools)
/**
 *  计算当前字符串显示所需的实际frame，返回值的x = 0, y = 0
 */
- (CGRect)textRectWithSize:(CGSize)size attributes:(NSDictionary *)attributes;
+ (NSString *)notEqualToNull:(NSString *)str;

/**
 *  格式化时间戳
 */
+ (NSString *)timeIntervalWithDataStr:(NSString *)dataStr;
+ (NSString *)YMTimeIntervalWithDataStr:(NSString *)dataStr;
/**
 *  字符串转为时间戳字符串,
 */
+ (NSString *)strToTimeInterval:(NSString *)timeDtr;
+ (NSString *)strToYMTimeInterval:(NSString *)timeDtr;
+ (NSString *)strYyyyMMToTimeInterval:(NSString *)timeDtr;
+ (NSString *)ToTimeIntervalyyyyMMdd:(NSString *)timeDtr;
/**
 *  时间戳转字符串
 *
 */
+ (NSString *)toTimeIntervalWithDataStr:(NSString *)dataStr;
+ (NSString *)stryyyyMMddmmssToTimeInterval:(NSString *)timeDtr;
/**
 *  获取时间戳的时间
 *
 */
+ (NSString *)timeHourIntervalWithDataStr:(NSString *)dataStr;
/**
 *  获取时间戳的月份
 *
 */
+ (NSString *)timeMonthIntervalWithDataStr:(NSString *)dataStr;
/**
 *  邮箱验证
 *
 */
+ (BOOL) validateEmail:(NSString *)email;
/**
 *  昵称验证
 *
 */
+ (BOOL) validatenickName:(NSString *)nickName;
/**
 *  验证是否为手机号码
 *
 */
+ (BOOL)validateMobile:(NSString *)mobile;
/**
 *  验证银行卡账号是否输入正确
 *
 */
+(BOOL)isValidCardNumber:(NSString *)cardNo;
/**
 *  过滤表情
 *
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;
/**
 *  验证是否为身份证号
 *
 */
+ (BOOL)validateIdentifyID:(NSString *)idCard;


+ (BOOL)validatePwdNumber:(NSString *) string;



//保留几位数字

+ (NSString *)numStringFormatWithNum:(CGFloat)number AndUnitString:(NSString *)unitString;

//--年--月--日 转后台数据
+ (NSString *)yyMMDDStrToTimeInterval:(NSString *)timeDtr;
//--年--月 转后台数据
+ (NSString *)returnBgDtaWithYYMMStr:(NSString *)dateStr;
//--月--日 转后台数据
+ (NSString *)returnBgDtaWithMMDDStr:(NSString *)dateStr;
//秒转时分秒
+(NSString*)HHDDMMTimeformatFromSeconds:(NSInteger)seconds;
//** 星期几
+(NSString*)weekdayStringFromDate:(NSString *)dataStr;
+(NSString*)weekdayStringFromYYMMDDStr:(NSString *)YYMMDDStr;

// 返回字符串的首个子
+ (NSString *)firstStrWithStr:(NSString *)str;

- (float) heightWithFont: (UIFont *) font withinWidth: (float) width;
- (float) widthWithFont: (UIFont *) font;
//** 根据文字字体大小返回文本宽度*/
+(CGSize)backSizeWithText:(NSString *)text andFont:(UIFont *)font;

+ (NSString *)currentTime:(NSString *)timeStr;

/**
 *  时间戳转字符串
 *
 *  @param timeStamp 时间戳
 *  @param format    转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)dateStrFromCstampTime:(NSTimeInterval)timeStamp
                     withDateFormat:(NSString *)format;

/**
 *  字典转JSON
 *
 *  @param dic
 *
 *  @return
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

/**
 判断后台返回的字符串是否为空串
 */
+(NSString *)isNotEqualToNullWith:(NSString *)str;
+ (NSString *)ic_stringDate;

/**
 判断字符串是否有空格
 */
+ (BOOL)isEmptyStr:(NSString *)str;
/**
 
 返回以当前时间年月日格式的时间戳
 
 */
+ (NSString *)currentTimeIntervalByYMD;
/**
 *  取出特殊字符串
 *
 */
+ (NSString *)cancelSpecialStr:(NSString *)string;
/**
 *  获取UUID
 *
 */
+ (NSString *)getUUID;
//判断发表时间
// 传入一个timeStr，返回对应格式的字符串
+(NSString *)setupCreateTime:(NSString *)timeStr;

//**截取手机号码 */
+(NSString *)backTelNumWithTelNum:(NSString *)telNum;

+(NSString *)translationArabicNum:(NSInteger)arabicNum;

//把字符串转换成数组
+(NSString *)transformStrToArr:(NSString *)str;

+ (NSString *)YMcurrentTime:(NSString *)timeStr;

+(NSString *)computeDateWithDays:(NSInteger)days;

+(NSString *)dateToOld:(NSString *)bornString;

+(NSArray *) transFormStringToArr:(NSString *)string;

@end
