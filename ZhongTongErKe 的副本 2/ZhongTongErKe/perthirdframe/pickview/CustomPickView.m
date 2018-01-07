//
//  CustomPickView.m
//  legend
//
//  Created by heyk on 16/1/11.
//  Copyright © 2016年 e3mo. All rights reserved.
//

#import "CustomPickView.h"

#import "Const.h"
#define PROVINCE_COMPONENT  0
#define CITY_COMPONENT      1
#define DISTRICT_COMPONENT  2
#define kButtonHeihgt SYS_UI_SCALE_WIDTH_SIZE(42)
typedef NS_ENUM(NSInteger,CustomPickType){
    
    CustomPickType_Date,
    CustomPickType_SingleRow,
    CustomPickType_Province,
};
@interface CustomPickView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong)NSArray *pickDataArray;
@property (nonatomic,strong)NSArray *cityArray;
@property (nonatomic,strong)NSArray *distrctArray;



@property (nonatomic,strong)NSString *selectValue;
@property (nonatomic,strong)NSString *oldValue;
@property (nonatomic,copy)CustomPickSelect selectBlock;
@property (nonatomic,copy)CustomPickValueChange valueChangeBlock;
@property (nonatomic,copy)CustomPickDisSelect disSelectBock;


@end

@implementation CustomPickView{
    
    CustomPickType currentType;
    UIView *contentView;
    UITapGestureRecognizer *tap;
    
    
    UIDatePicker *datePicker;
    UIPickerView *pickView;
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

+(CustomPickView*)getInstance{
    
    static CustomPickView *customPickView = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        customPickView = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
    });
    
//    CustomPickView *customPickView = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
    return customPickView;
    
}

-(void)showDatePick:(NSString*)currentValue   select:(CustomPickSelect)selectBlock disSelect:(CustomPickDisSelect)disSelect{
    
    currentType = CustomPickType_Date;
    self.oldValue = currentValue;
    self.selectBlock = selectBlock;
    self.disSelectBock = disSelect;
    
    
    [self setUI];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect frame = contentView.frame;
        frame.origin.y = YYSScreenH - YYS_X_FROM6(180)-YYS_X_FROM6(42);
        contentView.frame = frame;
        
    } completion:^(BOOL finished) {
        
    }];
    
}



-(void)showPick:(NSString*)currentValue data:(NSArray*)data valueChange:(CustomPickValueChange)changeBlock select:(CustomPickSelect)selectBlock disSelect:(CustomPickDisSelect)disSelect{
    
    currentType = CustomPickType_SingleRow;
    self.selectValue = currentValue;
    self.oldValue = currentValue;;
    self.pickDataArray = data;
    self.selectBlock = selectBlock;
    self.disSelectBock = disSelect;
    self.valueChangeBlock = changeBlock;
    
    [self setUI];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect frame = contentView.frame;
        frame.origin.y = YYSScreenH - YYS_X_FROM6(180)-YYS_X_FROM6(42);
        contentView.frame = frame;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}






-(void)setUI{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    if (contentView) {
        [contentView removeFromSuperview];
        contentView = nil;
    }
    if (tap) {
        [self removeGestureRecognizer:tap];
        tap = nil;
    }
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBack)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
    
    contentView = [[UIView alloc] initWithFrame:CGRectMake(0, YYSScreenH + YYS_X_FROM6(180)+YYS_X_FROM6(42), YYSScreenW,  YYS_X_FROM6(180)+YYS_X_FROM6(42))];
    contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:contentView];
    
    if (currentType == CustomPickType_Date) {
        datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0,0, YYSScreenW, 160)];
        [contentView addSubview:datePicker];
        
        
        NSTimeZone *systemTimeZone = [NSTimeZone systemTimeZone];
        [datePicker setTimeZone:systemTimeZone];//设置时区
        [datePicker setDatePickerMode:UIDatePickerModeDate];
        NSDate *use_date = [NSDate date];
        
        NSString *oldValueStr = self.oldValue ;
        
        if (oldValueStr.length > 0) {
            NSString *dateStr = oldValueStr;
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"HH:mm:ss"];
            use_date= [dateFormatter dateFromString:dateStr];
        }
        [datePicker setDate:use_date];
        //最小时间
        [datePicker setMinimumDate:[NSDate dateWithTimeIntervalSince1970:0]];
        //最大时间为当前时间
        [datePicker setMaximumDate:[NSDate date]];
        
    }
    else if(currentType == CustomPickType_SingleRow){
        pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,0, YYSScreenW, 160)];
        pickView.delegate = self;
        pickView.dataSource = self;
        [contentView addSubview:pickView];
        
        
        NSString *oldValue = self.oldValue ;
        
        for (int j = 0; j<self.pickDataArray.count; j++) {
            NSString *str = [self.pickDataArray  objectAtIndex:j];
            if ([str isEqualToString:oldValue]) {
                
                [pickView selectRow:j inComponent:0 animated:YES];
                break;
            }
        }
    }
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //button.backgroundColor = [UIColor orangeColor];
    button.backgroundColor = MAIN_COLOR;
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Arial" size:YYS_X_FROM6(16)];
    button.frame = CGRectMake(0, contentView.frame.size.height-YYS_X_FROM6(42), YYSScreenW, YYS_X_FROM6(42));
    [button addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:button];
//    NSLog(@"%@",[[UIApplication sharedApplication].windows lastObject].class);
    
    [[[UIApplication sharedApplication].windows lastObject] addSubview:self];
}

-(void)selectClick:(UIButton*)button{
    
    if (self.selectBlock) {
        
        if (currentType == CustomPickType_Date) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"HH:mm:ss"];
            NSString *dateStr = [dateFormatter stringFromDate:datePicker.date];
            self.selectBlock(dateStr);
        }
        else if(currentType == CustomPickType_SingleRow){
            NSMutableString *selectValue = [NSMutableString string];
            [selectValue appendString:self.selectValue];
            self.selectBlock(selectValue);
        }
        
        
    }
    
    [self dismiss];
    
}

-(void)tapBack{
    
    if (self.disSelectBock) {
        if (currentType == CustomPickType_Province) {
            
//            self.disSelectBock(self.oldAddresssModel);
        }
        else{
            NSString *oldValueStr = self.oldValue;
            self.disSelectBock(oldValueStr);
        }
 
    }
    
    [self dismiss];
}

-(void)dismiss{
    
    [UIView animateWithDuration:0.25
                     animations:^{
                         
                         CGRect frame = contentView.frame;
                         frame.origin.y = YYSScreenH + YYS_X_FROM6(180)+YYS_X_FROM6(42);
                         contentView.frame = frame;
                         
                     } completion:^(BOOL finished) {
                         
                         [contentView removeFromSuperview];
                         contentView = nil;
                         
                         [self removeGestureRecognizer:tap];
                         tap = nil;
                         
                         [self removeFromSuperview];
                     }];
}

#pragma mark - UIPickerView Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {//设置picker有几个模块
    
    if ( currentType ==CustomPickType_SingleRow) {
        return 1;
    }
    else if(currentType ==CustomPickType_Province){
        return 3;
    }
    
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {//每个模块中有几行
    
    if ( currentType ==CustomPickType_SingleRow) {
        return _pickDataArray.count;
    }
    
    else if (currentType ==CustomPickType_Province){
        
        if (component == PROVINCE_COMPONENT) {//省
            return [_pickDataArray count];
        }
        else if(component == CITY_COMPONENT){//市
            
            return [_cityArray count];
            
            
        }
        else if(component == DISTRICT_COMPONENT){//区
            return [_distrctArray count];
            
        }
        
    }
    
    return 0;
}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {//行高
    return 45;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {//设置文字
    
    UILabel *retval= [[UILabel alloc] initWithFrame:view.bounds];
    retval.lineBreakMode = NSLineBreakByWordWrapping;
    retval.numberOfLines = 0;
    [retval setFont:[UIFont fontWithName:@"Arial" size:21]];
    retval.textAlignment = NSTextAlignmentCenter;
    [retval setBackgroundColor:[UIColor clearColor]];
    
    if ( currentType ==CustomPickType_SingleRow) {
        NSString *str = [_pickDataArray objectAtIndex:row];
        retval.text = str;
    }
    else if(currentType == CustomPickType_Province){
        
        if (component == PROVINCE_COMPONENT) {
            
            NSString *str = [_pickDataArray objectAtIndex:row];
            retval.text = str;
        }
        else if (component == CITY_COMPONENT) {
            NSString *str = [_cityArray objectAtIndex:row];
            retval.text = str;
        }
        else {
            NSString *str = [_distrctArray objectAtIndex:row];;
            retval.text = str;
        }
    }
    return retval;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {//选择后操作
    
    if (currentType == CustomPickType_SingleRow) {
        NSString *str = [_pickDataArray objectAtIndex:row];
        self.selectValue = str;
        if (self.valueChangeBlock) {
            self.valueChangeBlock(str,component);
        }
    }
    else if(currentType == CustomPickType_Province){
    
        
    }
    
    
}




@end
