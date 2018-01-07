//
//  XFDatePickerView.m
//  MagicFinger
//
//  Created by xufeng on 16/6/15.
//  Copyright © 2016年 zeenc. All rights reserved.
//
#define kDuration .25

#define MaxYear 50
#define kStartYear 1930

#define kBtnH 40
#define kBtnW 80
#define datePickerHeight 180

#import "ActionSheetView.h"
#import "XFDatePickerView.h"


@interface XFDatePickerView ()<UIPickerViewDataSource,UIPickerViewDelegate,UIGestureRecognizerDelegate>
{
    NSMutableArray *yearArray;
    NSArray *monthArray;
    NSMutableArray *monthMutableArray;
    NSMutableArray *DaysMutableArray;
    NSMutableArray *DaysArray;
    NSMutableArray *hourArr;
    NSMutableArray *minArr;
    
    NSInteger selectedYearRow;
    NSInteger selectedMonthRow;
    NSInteger selectedDayRow;
    NSInteger selectedMinRow;
    NSInteger selectedSecRow;
    
    BOOL firstTimeLoad;
    
    NSInteger m ;
    int year;
    int month;
    int day;
    int hour;
    int min;
    
    NSString *_currentYearString;
    NSString *_currentMonthString;
    NSString *_currentDayString;
    NSString *_currentHourString;
    NSString *_currentMinString;
    
    int destinateYear;
    NSString *currentDate;
    XFDatePickerType pickerType;
}
@property (weak, nonatomic)  UIPickerView *customPicker;
@property (nonatomic,strong) UIView *pickerBg;
@end
@implementation XFDatePickerView


-(instancetype)initWithCurrentDate:(NSString *)currentD destinateYear:(int)destinateY datePickerType:(XFDatePickerType)type{
    if (self = [super init]) {
        
        currentDate = currentD;
        destinateYear = destinateY;
        pickerType = type;
        
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        self.backgroundColor = RGBColor(160, 160, 160, 0);
        
        self.pickerBg = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - datePickerHeight, self.width, datePickerHeight)];
        self.pickerBg.backgroundColor = c255255255;
        [self addSubview:self.pickerBg];
        
        UIPickerView *customPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kBtnH, self.width, datePickerHeight - kBtnH)];
        customPicker.backgroundColor = c255255255;
        _customPicker = customPicker;
        _customPicker.delegate = self;
        _customPicker.dataSource = self;
        [self.pickerBg addSubview:_customPicker];
        
        // 初始化pickerView - 确定  取消
        [self setUpPickerView];
        
        // 初始化日期
        [self setUpDate];
        
        [self.customPicker reloadAllComponents];
        
        [self animeData];
    }
    return self;
}
- (void)animeData{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
    [self addGestureRecognizer:tapGesture];
    tapGesture.delegate = self;
    [UIView animateWithDuration:kDuration animations:^{
        self.backgroundColor = RGBColor(160, 160, 160, .4);
        [UIView animateWithDuration:kDuration animations:^{
            [UIView animateWithDuration:bottomDuration animations:^{
                self.pickerBg.y = kScreenHeight - datePickerHeight;
            }];
        }];
    } completion:^(BOOL finished) {
    }];
}
- (void)tappedCancel{
    [UIView animateWithDuration:kDuration animations:^{
        self.pickerBg.y = kScreenHeight;
        self.alpha = 0;
    }completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
    
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if([touch.view isKindOfClass:[self class]]){
        return YES;
    }
    return NO;
}
- (void)showInView:(UIViewController *)sView
{
    if(sView == nil){
        [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:self];
    }else{
        [sView.view addSubview:self];
    }
}
//出生年月
- (void)setUpPickerView
{
    CGFloat btnY = 0;
    m = 0;
    
    UIButton *cancelBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, btnY, kBtnW, kBtnH)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [self.pickerBg addSubview:cancelBtn];
    //确定
    CGFloat  sureBtnX = self.frame.size.width - kBtnW;
    
    UIButton *sureBtn=[[UIButton alloc]initWithFrame:CGRectMake(sureBtnX, btnY, kBtnW, kBtnH)];
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:RGBColor(51, 51, 51, 1.0) forState:UIControlStateNormal];
    [sureBtn  addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    [self.pickerBg addSubview:sureBtn];
    
    CGFloat lineViewY = CGRectGetMaxY(sureBtn.frame);
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, lineViewY, kScreenWidth, 1)];
    lineView.backgroundColor = [UIColor redColor];
    [self.pickerBg addSubview:lineView];
    
}

- (void)setUpDate
{
    //1.默认没有初始化选择时间时，为当前时间
    NSDate *date = [NSDate date];
    [self formatterDateWithDate:date];
    //2.年月日小时分钟数组
    yearArray = [[NSMutableArray alloc] init];
    monthMutableArray = [[NSMutableArray alloc] init];
    DaysMutableArray= [[NSMutableArray alloc] init];
    
    if (self.addDate) {
        //没用上
        year+=MaxYear;
    }
    
    for (int i = kStartYear; i <= year; i++)
    {
        [yearArray addObject:[NSString stringWithFormat:@"%d",i]];
        
    }
    if (destinateYear) {
        for (int i = kStartYear; i <= destinateYear ; i++)
        {
            [yearArray addObject:[NSString stringWithFormat:@"%d",i]];
            
        }
    }
    hourArr = [NSMutableArray array];
    for (int i = 0; i < 24; i++) {
        if (i < 10) {
            [hourArr addObject:[NSString stringWithFormat:@"0%d",i]];
        }else{
            [hourArr addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    minArr = [NSMutableArray array];
    for (int i = 0; i < 60; i++) {
        if (i < 10) {
            [minArr addObject:[NSString stringWithFormat:@"0%d",i]];
        }else{
            [minArr addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    
    // PickerView -  Months data
    monthArray = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12"];
    
    for (int i = 1; i < month+1; i++) {//没有终时间，终止时间为当前
        [monthMutableArray addObject:[NSString stringWithFormat:@"%02d",i]];
    }
    
    DaysArray = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= 31; i++)
    {
        [DaysArray addObject:[NSString stringWithFormat:@"%02d",i]];
        
    }
    for (int i = 1; i <day+1; i++)
    {//没用上
        [DaysMutableArray addObject:[NSString stringWithFormat:@"%02d",i]];
        
    }
    
    //3.转化为相应选择器
    if (currentDate) {//有初始化选择时间时,改变默认初始选择时间
        
        long long birthday = [currentDate longLongValue];
        
        date = [NSDate dateWithTimeIntervalSince1970:birthday / 1000.0];
        
        [self formatterDateWithDate:date];
        
        [self pickerWithCurrentYear:_currentYearString currentMonth:_currentMonthString currentDay:_currentDayString currentHour:_currentHourString currentMin:_currentMinString];
        
    }else
    {
        [self pickerWithCurrentYear:_currentYearString currentMonth:_currentMonthString currentDay:_currentDayString currentHour:_currentHourString currentMin:_currentMinString];
    }
    
    selectedYearRow = _currentYearString.intValue - kStartYear;
    selectedMonthRow = _currentMonthString.intValue - 1;
    selectedDayRow = _currentDayString.intValue - 1;
    
}

#pragma mark - 日期格式化
- (void)formatterDateWithDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    
    NSString *currentYearString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    _currentYearString = currentYearString;
    
    [formatter setDateFormat:@"MM"];
    
    NSString *currentMonthString = [NSString stringWithFormat:@"%02ld",(long)[[formatter stringFromDate:date]integerValue]];
    _currentMonthString = currentMonthString;
    
    [formatter setDateFormat:@"dd"];
    NSString *currentDayString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    _currentDayString = currentDayString;
    
    [formatter setDateFormat:@"HH"];
    NSString *currentHourString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    _currentHourString = currentHourString;
    
    [formatter setDateFormat:@"mm"];
    NSString *currentMinString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    _currentMinString = currentMinString;
}

- (void)pickerWithCurrentYear:(NSString *)currentYearString currentMonth:(NSString *)currentMonthString currentDay:(NSString *)currentDayString currentHour:(NSString *)currentHourString currentMin:(NSString *)currentMinString
{
    [self.customPicker selectRow:[yearArray indexOfObject:currentYearString] inComponent:0 animated:YES];
    if (pickerType ==XFDatePickerTypeYM) {
        [self.customPicker selectRow:[monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];
    }
    
    else if (pickerType == XFDatePickerTypeYMD)
    {
         [self.customPicker selectRow:[monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];
        [self.customPicker selectRow:[DaysArray indexOfObject:currentDayString] inComponent:2 animated:YES];
    }
    
    else {
        
        [self.customPicker selectRow:[monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];
        [self.customPicker selectRow:[DaysArray indexOfObject:currentDayString] inComponent:2 animated:YES];

        [self.customPicker selectRow:[hourArr indexOfObject:currentHourString] inComponent:3 animated:YES];
        
        [self.customPicker selectRow:[minArr indexOfObject:currentMinString] inComponent:4 animated:YES];
        
    }
}

#pragma mark - UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    m = row;
    
    if (component == 0)
    {
        selectedYearRow = row;
        
    }
    else if (component == 1)
    {
        selectedMonthRow = row;
    }
    else if (component == 2)
    {
        selectedDayRow = row;
    }
    [self.customPicker reloadAllComponents];
}

#pragma mark - UIPickerViewDatasource

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    UILabel *pickerLabel = (UILabel *)view;
    
    if (pickerLabel == nil) {
        
        CGRect frame = CGRectMake(0.0, 0.0, 80, 60);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:15.0f]];
    }
    
    
    if (component == 0)
    {
        pickerLabel.text =  [NSString stringWithFormat:@"%@ 年",[yearArray objectAtIndex:row]]; // Year
    }
    else if (component == 1)
    {
        pickerLabel.text =  [NSString stringWithFormat:@"%@ 月", [monthArray objectAtIndex:row]]; // Month
    }
    
    if (pickerType == XFDatePickerTypeYMD) {
        if (component == 2)
        {
            pickerLabel.text =  [NSString stringWithFormat:@"%@ 日", [DaysArray objectAtIndex:row]]; // Date
            
        }
    }
    
    if (pickerType == XFDatePickerTypeYMDHM) {
        if (component == 3) {
            pickerLabel.text =  [NSString stringWithFormat:@"%@ 时", [hourArr objectAtIndex:row]]; // Date
        }
        if (component == 4) {
            pickerLabel.text =  [NSString stringWithFormat:@"%@ 分", [minArr objectAtIndex:row]]; // Date
        }
    }
    
    return pickerLabel;
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (pickerType == XFDatePickerTypeYMDHM) {
        return 5;
    }else{
        return 3;
    }
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (pickerType == XFDatePickerTypeYMDHM) {
        if (component == 3) {
            return 24;
        }
        if (component == 4) {
            return 60;
        }
    }
    if (component == 0)
    {
        return [yearArray count];
        
    }
    else if (component == 1)
    {
        NSInteger selectRow =  [pickerView selectedRowInComponent:0];
        
        int n;
        n = year - kStartYear;
        
        if (selectRow==n && !destinateYear) {
            return [monthMutableArray count];
        }else
        {
            return [monthArray count];
            
        }
    }
    else
    {
        NSInteger selectRow1 =  [pickerView selectedRowInComponent:0];
        int n;
        n= year - kStartYear;
        NSInteger selectRow =  [pickerView selectedRowInComponent:1];
        if (selectRow==month-1 &selectRow1==n && !destinateYear) {
            
            return day;
            
        }else{
            
            if (selectedMonthRow == 0 || selectedMonthRow == 2 || selectedMonthRow == 4 || selectedMonthRow == 6 || selectedMonthRow == 7 || selectedMonthRow == 9 || selectedMonthRow == 11)
            {
                return 31;
            }
            else if (selectedMonthRow == 1)
            {
                int yearint = [[yearArray objectAtIndex:selectedYearRow]intValue ];
                
                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
                
            }
            else
            {
                return 30;
            }
            
            
        }
        
    }
    
}

#pragma mark - 取消
- (void)cancelAction
{
    if ([self.delegate respondsToSelector:@selector(cancelChooseDate)]) {
        [self.delegate cancelChooseDate];
    }
    [self tappedCancel];
}
#pragma mark - 确定
- (void)sureAction
{
    NSString *str;
    NSString *timeIntervalStr = [NSString strToTimeInterval:str];
    NSString *dateFormatterStr = [NSString timeIntervalWithDataStr:timeIntervalStr];
    
    if (pickerType ==XFDatePickerTypeYM) {
        str = [NSString stringWithFormat:@"%@%@",[yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]],[monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]]];
        timeIntervalStr = [NSString strToYMTimeInterval:str];
        dateFormatterStr = [NSString YMTimeIntervalWithDataStr:timeIntervalStr];
    }
    else if (pickerType == XFDatePickerTypeYMD) {
        str = [NSString stringWithFormat:@"%@%@%@",[yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]],[monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]],[DaysArray objectAtIndex:[self.customPicker selectedRowInComponent:2]]];
        timeIntervalStr = [NSString strToTimeInterval:str];
        dateFormatterStr = [NSString timeIntervalWithDataStr:timeIntervalStr];
    }
    else{
        str = [NSString stringWithFormat:@"%@%@%@%@%@",[yearArray objectAtIndex:[self.customPicker selectedRowInComponent:0]],[monthArray objectAtIndex:[self.customPicker selectedRowInComponent:1]],[DaysArray objectAtIndex:[self.customPicker selectedRowInComponent:2]],[hourArr objectAtIndex:[self.customPicker selectedRowInComponent:3]],[minArr objectAtIndex:[self.customPicker selectedRowInComponent:4]]];
        timeIntervalStr = [NSString stryyyyMMddmmssToTimeInterval:str];
        //        dateFormatterStr = [NSString timeIntervalyyyymmddhhmmWithDataStr:timeIntervalStr];
    }
    if ([self.delegate respondsToSelector:@selector(sureChooseDate:chooseDateFormatterStr:TimeInterval:)]) {
        [self.delegate sureChooseDate:self chooseDateFormatterStr:dateFormatterStr TimeInterval:timeIntervalStr];
    }
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.hidden = YES;
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

@end
