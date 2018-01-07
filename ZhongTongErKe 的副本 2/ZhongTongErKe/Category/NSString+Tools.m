//
//  NSString+Tools.m
//
//  Created by kouhanjin on 15/12/21.
//  Copyright © 2015年 khj. All rights reserved.
//

#import "NSString+Tools.h"
#import "NSDate+KJExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Tools)
- (CGRect)textRectWithSize:(CGSize)size attributes:(NSDictionary *)attributes
{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
}

+ (NSString *)notEqualToNull:(NSString *)str
{
    if (!str) {
        return nil;
    }
    else
    {
        if(![str isEqual:[NSNull null]])
        {
            return str;
        }
        
        else{
            return nil;
        }
        
        
    }
}

+ (NSString *)timeIntervalWithDataStr:(NSString *)dataStr
{
    //    NSDate *date = [NSDate date];
    
    long long birthday=[dataStr longLongValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:birthday/1000.0];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    
    NSString *currentyearString = [NSString stringWithFormat:@"%@",
                                   [formatter stringFromDate:date]];
    int year =[currentyearString intValue];
    
    [formatter setDateFormat:@"MM"];
    
    NSString *currentMonthString = [NSString stringWithFormat:@"%ld",(long)[[formatter stringFromDate:date]integerValue]];
    int month=[currentMonthString intValue];
    [formatter setDateFormat:@"dd"];
    NSString *currentDateString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    int day =[currentDateString intValue];
    
    return [NSString stringWithFormat:@"%d-%02d-%02d",year,month,day];
}
+ (NSString *)YMTimeIntervalWithDataStr:(NSString *)dataStr
{
    //    NSDate *date = [NSDate date];
    
    long long birthday=[dataStr longLongValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:birthday/1000.0];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    
    NSString *currentyearString = [NSString stringWithFormat:@"%@",
                                   [formatter stringFromDate:date]];
    int year =[currentyearString intValue];
    
    [formatter setDateFormat:@"MM"];
    
    NSString *currentMonthString = [NSString stringWithFormat:@"%ld",(long)[[formatter stringFromDate:date]integerValue]];
    int month=[currentMonthString intValue];
    
    
    return [NSString stringWithFormat:@"%d-%02d",year,month];
}

+ (NSString *)strYyyyMMToTimeInterval:(NSString *)timeDtr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMM"];
    NSDate *chooseDate = [dateFormatter dateFromString:timeDtr];
    
    NSTimeInterval timeInterval = [chooseDate timeIntervalSince1970] * 1000;
    NSString  *timeString = [NSString stringWithFormat:@"%lld", (long long)timeInterval];
    
    return timeString;
}

+ (NSString *)strToTimeInterval:(NSString *)timeDtr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSDate *chooseDate = [dateFormatter dateFromString:timeDtr];
    
    NSTimeInterval timeInterval = [chooseDate timeIntervalSince1970] * 1000;
    NSString  *timeString = [NSString stringWithFormat:@"%lld", (long long)timeInterval];
    
    return timeString;
}

+ (NSString *)strToYMTimeInterval:(NSString *)timeDtr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMM"];
    NSDate *chooseDate = [dateFormatter dateFromString:timeDtr];
    
    NSTimeInterval timeInterval = [chooseDate timeIntervalSince1970] * 1000;
    NSString  *timeString = [NSString stringWithFormat:@"%lld", (long long)timeInterval];
    
    return timeString;
}

+ (NSString *)ToTimeIntervalyyyyMMdd:(NSString *)timeDtr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *chooseDate = [dateFormatter dateFromString:timeDtr];
    
    NSTimeInterval timeInterval = [chooseDate timeIntervalSince1970] * 1000;
    NSString  *timeString = [NSString stringWithFormat:@"%lld", (long long)timeInterval];
    
    return timeString;
}
+ (NSString *)yyMMDDStrToTimeInterval:(NSString *)timeDtr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate *backDate = [dateFormatter dateFromString:timeDtr];
    
    NSTimeInterval timeInterval = [backDate timeIntervalSince1970] * 1000;
    NSString  *timeString = [NSString stringWithFormat:@"%lld", (long long)timeInterval];
    
    return timeString;
}

#pragma mark  把某年某月日期转换为后台的数字日期
+ (NSString *)returnBgDtaWithYYMMStr:(NSString *)dateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy年MM月"];
    NSDate *backDate = [dateFormatter dateFromString:dateStr];
    
    NSTimeInterval timeInterval = [backDate timeIntervalSince1970] * 1000;
    NSString  *timeString = [NSString stringWithFormat:@"%lld", (long long)timeInterval];
    
    return timeString;
}

+ (NSString *)returnBgDtaWithMMDDStr:(NSString *)dateStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM月dd日"];
    NSDate *backDate = [dateFormatter dateFromString:dateStr];
    
    NSTimeInterval timeInterval = [backDate timeIntervalSince1970] * 1000;
    NSString  *timeString = [NSString stringWithFormat:@"%lld", (long long)timeInterval];
    
    return timeString;
}


+ (NSString *)stryyyyMMddmmssToTimeInterval:(NSString *)timeDtr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    NSDate *chooseDate = [dateFormatter dateFromString:timeDtr];
    
    NSTimeInterval timeInterval = [chooseDate timeIntervalSince1970] * 1000;
    NSString  *timeString = [NSString stringWithFormat:@"%lld", (long long)timeInterval];
    
    return timeString;
}

+ (NSString *)currentTime:(NSString *)timeStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd  HH:mm"];
    NSDate *chooseDate = [dateFormatter dateFromString:timeStr];
    
    NSTimeInterval timeInterval = [chooseDate timeIntervalSince1970] * 1000;
    NSString  *timeString = [NSString stringWithFormat:@"%lld", (long long)timeInterval];
    
    return timeString;
}

+ (NSString *)toTimeIntervalWithDataStr:(NSString *)dataStr
{
   
    
    long long birthday=[dataStr longLongValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:birthday / 1000.0];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd   HH:mm"];
    
    NSString *dateStr  = [formatter stringFromDate:date];
    
    return dateStr;
}

+ (NSString *)timeHourIntervalWithDataStr:(NSString *)dataStr
{
    //    NSDate *date = [NSDate date];
    
    long long birthday=[dataStr longLongValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:birthday / 1000.0];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    
    NSString *dateStr  = [formatter stringFromDate:date];
    
    return dateStr;
}

+ (NSString *)timeMonthIntervalWithDataStr:(NSString *)dataStr
{
    //    NSDate *date = [NSDate date];
    
    long long birthday=[dataStr longLongValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:birthday / 1000.0];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM-dd"];
    
    NSString *dateStr  = [formatter stringFromDate:date];
    
    return dateStr;
}

+(NSString*)weekdayStringFromDate:(NSString *)dataStr {
    
    
    
    long long birthday=[dataStr longLongValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:birthday / 1000.0];
    
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}
#pragma mark @"昵称只能由中文、字母或数字组成"
+ (BOOL) validatenickName:(NSString *)nickName
{
    NSString *regex = @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+";
    NSPredicate *nickNamepred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [nickNamepred evaluateWithObject:nickName];
}

+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[a-zA-Z0-9_]{3,12}@[a-zA-Z0-9]+(\\.[a-zA-Z]+){1,3}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)validateMobile:(NSString *)mobile
{
    //手机号以13，14， 15，17，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
+ (BOOL)validateIdentifyID:(NSString *)idCard{
    BOOL flag;
    if (idCard.length <= 0) {
        flag = NO;
        return flag;
    }
    //    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:idCard];
}
+(BOOL)isValidCardNumber:(NSString *)cardNo
{
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[cardNo length];
    int lastNum = [[cardNo substringFromIndex:cardNoLength-1] intValue];
    
    cardNo = [cardNo substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

/**
 只是判断是否有表情
 */
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    NSString *regex = @"[`~!@#$%^&*()\\s+-=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？" "]|[a-zA-Z*[\\d]\u4e00-\u9fa5]|[a-zA-Z0-9\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:string];
    
    // 九宫格判断
    if (!isMatch) {
        NSString *other = @"➋➌➍➎➏➐➑➒";
        unsigned long len = string.length;
        for(int i=0;i<len;i++)
        {
            unichar a=[string characterAtIndex:i];
            if(!((isalpha(a))
                 ||(isalnum(a))
                 ||((a=='_') || (a == '-'))
                 ||((a >= 0x4e00 && a <= 0x9fa6))
                 ||([other rangeOfString:string].location != NSNotFound)
                 ))
                return NO;
        }
        return YES;
        
    }
    return isMatch;
}

//只能由英文字母和数字组成的字符串
+ (BOOL)validatePwdNumber:(NSString *)string
{
    NSString* str=@"^[A-Za-z0-9]+$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",str];
    return [numberPre evaluateWithObject:string];
}



- (NSString *)MD5String {
    const char *cstr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cstr, (CC_LONG)strlen(cstr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

//保留几位数字
+(NSString*)HHDDMMTimeformatFromSeconds:(long)seconds
{
    
    NSString *format_time;
    
    if (seconds>3600) {
        
        //format of hour
        NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
        //format of minute
        NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
        //format of time
        
        
        if (!seconds%3600) {
            format_time = [NSString stringWithFormat:@"%@小时",str_hour];
        }
        else{
            
            format_time = [NSString stringWithFormat:@"%@小时%@分钟",str_hour,str_minute];
        }
        
        
        
    }
    else if (seconds<60)
    {
        format_time = [NSString stringWithFormat:@"%ld秒",seconds];
    }
    
    else{
        
        NSString *str_minute = [NSString stringWithFormat:@"%02ld",seconds/60];
        //format of second
        NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
        
        
        
        if (seconds%60==0) {
            
            format_time= [NSString stringWithFormat:@"%@分钟",str_minute];
        }
        else
        {
            format_time =  [NSString stringWithFormat:@"%@分钟%@秒",str_minute,str_second];;
        }
        
    }
    
    return format_time;
    
}

- (float) heightWithFont: (UIFont *) font withinWidth: (float) width
{
    CGRect textRect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                         options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:font}
                                         context:nil];
    
    return ceil(textRect.size.height);
}

- (float) widthWithFont: (UIFont *) font
{
    CGRect textRect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, font.pointSize)
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:font}
                                         context:nil];
    
    return textRect.size.width;
}

+ (NSString *)firstStrWithStr:(NSString *)str
{
    if (str.length) {
        NSString *firstStr = [str substringToIndex:1];
        
        //判断是不是中文开头的
        BOOL isFirst = [self isChineseFirst:firstStr];
        if (isFirst)
        {
            
        }else
        {
            //判断是不是字母开头的
            BOOL isA = [self matchLetter:firstStr];
            if (isA)
            {
                firstStr = [firstStr capitalizedString];
            }else
            {
                
            }
            
        }
        return firstStr;
    }
    else
    {
        return nil;
    }
}

#pragma mark 正则表达式
+ (BOOL)matchLetter:(NSString *)str
{
    //判断是否以字母开头
    NSString *ZIMU = @"^[A-Za-z]+$";
    NSPredicate *regextestA = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ZIMU];
    
    if ([regextestA evaluateWithObject:str] == YES)
        return YES;
    else
        return NO;
}

+ (BOOL)isChineseFirst:(NSString *)firstStr
{
    //是否以中文开头(unicode中文编码范围是0x4e00~0x9fa5)
    int utfCode = 0;
    void *buffer = &utfCode;
    NSRange range = NSMakeRange(0, 1);
    //判断是不是中文开头的,buffer->获取字符的字节数据 maxLength->buffer的最大长度 usedLength->实际写入的长度，不需要的话可以传递NULL encoding->字符编码常数，不同编码方式转换后的字节长是不一样的，这里我用了UTF16 Little-Endian，maxLength为2字节，如果使用Unicode，则需要4字节 options->编码转换的选项，有两个值，分别是NSStringEncodingConversionAllowLossy和NSStringEncodingConversionExternalRepresentation range->获取的字符串中的字符范围,这里设置的第一个字符 remainingRange->建议获取的范围，可以传递NULL
    BOOL b = [firstStr getBytes:buffer maxLength:2 usedLength:NULL encoding:NSUTF16LittleEndianStringEncoding options:NSStringEncodingConversionExternalRepresentation range:range remainingRange:NULL];
    if (b && (utfCode >= 0x4e00 && utfCode <= 0x9fa5))
        return YES;
    else
        return NO;
}

//** 根据文字字体大小返回文本宽度*/
+(CGSize)backSizeWithText:(NSString *)text andFont:(UIFont *)font
{
    CGSize textSize = [text sizeWithFont:font];
    
    return textSize;
}

+ (NSString *)dateStrFromCstampTime:(NSTimeInterval)timeStamp
                     withDateFormat:(NSString *)format
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [self datestrFromDate:date withDateFormat:format];
}

+ (NSString *)datestrFromDate:(NSDate *)date
               withDateFormat:(NSString *)format
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    return [dateFormat stringFromDate:date];
}

+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    if (!dic) {
        return nil;
    }
    NSError *parseError = nil;
    NSData *jsonData;
    
    if (dic) {
        jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    }
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

+(NSString *)isNotEqualToNullWith:(NSString *)str
{
    if (!str) {
        return nil;
    }
    else
    {
        if(![str isEqual:[NSNull null]])
        {
            return str;
        }
        else
        {
            return nil;
        }
    }
    
    
}

+ (NSString *)ic_stringDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    return dateString;
}

+ (BOOL)isEmptyStr:(NSString *)str
{
    NSRange range = [str rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return YES; //yes代表包含空格
    }else {
        return NO; //反之
    }
}

/**
 
 返回以当前时间年月日格式的时间戳
 
 */
+ (NSString *)currentTimeIntervalByYMD
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMddHHmm"];
    
    NSString *dateStr  = [formatter stringFromDate:date];
    
    return [NSString stryyyyMMddmmssToTimeInterval:dateStr];
}

+ (NSString *)cancelSpecialStr:(NSString *)string
{
    NSArray *array = [string componentsSeparatedByString:@"-"];
    
    NSString *noSpecialString = [array componentsJoinedByString:@""];
    
    return noSpecialString;
}

+ (NSString *)getUUID
{
    NSString *uuid = [UIDevice currentDevice].identifierForVendor.UUIDString;
    return uuid;
}
+(NSString *)setupCreateTime:(NSString *)timeStr
{
    
     NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *createDate = [fmt dateFromString:timeStr];
     NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmp = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute  fromDate:createDate toDate:[NSDate date] options:NSCalendarWrapComponents];
        if ([createDate isThisYear]) {
        if ([createDate isThisToday]) {
            // 获取日期差值
            if (cmp.hour >= 1) {
                timeStr = [NSString stringWithFormat:@"%ld小时前",cmp.hour];
                            
            } else if (cmp.minute >= 2)
            {
                timeStr = [NSString stringWithFormat:@"%ld分钟前",cmp.minute];
                            
            } else { // 刚刚
                timeStr = @"刚刚";
                            
            }
            
        } else if ([createDate isThisYesterday])
        {
            fmt.dateFormat = @"昨天 HH:mm";
            timeStr = [fmt stringFromDate:createDate];
                    
        } else
        {
            fmt.dateFormat = @"MM-dd";
            timeStr = [fmt stringFromDate:createDate];
                    
        }
        
    } else
    { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd";
        timeStr = [fmt stringFromDate:createDate];
            
    }
        return timeStr;
}
+(NSString *)backTelNumWithTelNum:(NSString *)telNum
{
    
    NSString *phoneNum = [telNum stringByReplacingCharactersInRange:NSMakeRange(3, 7) withString:@"****"];
    return phoneNum;
}

+(NSString *)translationArabicNum:(NSInteger)arabicNum
{
    NSString *arabicNumStr = [NSString stringWithFormat:@"%ld",(long)arabicNum];
    NSArray *arabicNumeralsArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chineseNumeralsArray = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chineseNumeralsArray forKeys:arabicNumeralsArray];
    
    if (arabicNum < 20 && arabicNum > 9) {
        if (arabicNum == 10) {
            return @"十";
        }else{
            NSString *subStr1 = [arabicNumStr substringWithRange:NSMakeRange(1, 1)];
            NSString *a1 = [dictionary objectForKey:subStr1];
            NSString *chinese1 = [NSString stringWithFormat:@"十%@",a1];
            return chinese1;
        }
    }else{
        NSMutableArray *sums = [NSMutableArray array];
        for (int i = 0; i < arabicNumStr.length; i ++)
        {
            NSString *substr = [arabicNumStr substringWithRange:NSMakeRange(i, 1)];
            NSString *a = [dictionary objectForKey:substr];
            NSString *b = digits[arabicNumStr.length -i-1];
            NSString *sum = [a stringByAppendingString:b];
            if ([a isEqualToString:chineseNumeralsArray[9]])
            {
                if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
                {
                    sum = b;
                    if ([[sums lastObject] isEqualToString:chineseNumeralsArray[9]])
                    {
                        [sums removeLastObject];
                    }
                }else
                {
                    sum = chineseNumeralsArray[9];
                }
                
                if ([[sums lastObject] isEqualToString:sum])
                {
                    continue;
                }
            }
            
            [sums addObject:sum];
        }
        NSString *sumStr = [sums  componentsJoinedByString:@""];
        NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
        return chinese;
    }
}

+ (NSString *)YMcurrentTime:(NSString *)timeStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyyMM"];
    NSDate *chooseDate = [dateFormatter dateFromString:timeStr];
    
    NSTimeInterval timeInterval = [chooseDate timeIntervalSince1970] * 1000;
    NSString  *timeString = [NSString stringWithFormat:@"%lld", (long long)timeInterval];
    
    return timeString;
}

//计算天数后的新日期
+(NSString *)computeDateWithDays:(NSInteger)days
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *myDate = [NSDate date];
    NSDate *newDate = [myDate dateByAddingTimeInterval:60 * 60 * 24 * days];
    
    return [dateFormatter stringFromDate:newDate];
}


+(NSString *)dateToOld:(NSString *)bornString
{

    ICLog(@"%@",bornString);
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *birthDay = [dateFormatter dateFromString:bornString];
    
    NSDate *currentDate = [NSDate date];
    
    NSTimeInterval time = [currentDate timeIntervalSinceDate:birthDay];

    int age = ((int)time)/(3600*24*365);
    return [NSString stringWithFormat:@"%d",age];
    
}

+(NSString*)weekdayStringFromYYMMDDStr:(NSString *)YYMMDDStr
{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date  = [dateFormatter dateFromString:YYMMDDStr];

    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

+(NSArray *)transFormStringToArr:(NSString *)string
{
    NSMutableArray *diseaseArr = [NSMutableArray new];
    
    if (![string containsString:@","]) {
        
        [diseaseArr addObject:string];
        
   
    }
    
    
    else
    {
        NSArray  *array = [string componentsSeparatedByString:@","];
        
        [diseaseArr addObjectsFromArray:array];
        
    }
    
    return diseaseArr;
    
}


@end
