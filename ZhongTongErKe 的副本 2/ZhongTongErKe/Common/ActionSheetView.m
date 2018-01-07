//
//  ActionSheetView.m
//  MagicFinger
//
//  Created by khj on 16/6/8.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "ActionSheetView.h"
#import "User.h"
#import "ActionSheetCell.h"
#import "AlertViewCell.h"

#define kDuration .25
#define kTopMargin 20
#define kCellH 44

#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

static NSString *const companyViewCellID = @"alertViewCell";
@interface ActionSheetView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@end

@implementation ActionSheetView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithList:(NSArray *)list height:(CGFloat)height type:(ActionSheetViewType)type{
    self = [super init];
    if(self){
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        self.backgroundColor = RGBACOLOR(160, 160, 160, 0);
        
        
        CGFloat tableViewH = kCellH * (list.count + 1) + kTopMargin;
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AlertViewCell class]) bundle:nil] forCellReuseIdentifier:companyViewCellID];
        
        if (tableViewH > kScreenHeight * 0.7) {
            tableViewH = kScreenHeight * 0.7;
            _tableView.scrollEnabled = YES;
        }else
        {
            _tableView.scrollEnabled = NO;
        }
        self.sheetType = type;
        
        _tableView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, tableViewH);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listData = list;
        
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellH)];
        UIButton *footBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [footBtn setTitle:@"取消" forState:UIControlStateNormal];
        [footBtn setTitleColor:RGBCOLOR(2, 168, 243) forState:UIControlStateNormal];
        footBtn.frame = footView.frame;
        [footBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        footBtn.backgroundColor = [UIColor whiteColor];
        
        [footView addSubview:footBtn];
        _tableView.tableFooterView = footView;
        
        
        [self addSubview:_tableView];
        [self animeData];
    }
    return self;
}

- (void)animeData{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
    [self addGestureRecognizer:tapGesture];
    tapGesture.delegate = self;
    [UIView animateWithDuration:kDuration animations:^{
        self.backgroundColor = RGBACOLOR(160, 160, 160, .4);
        [UIView animateWithDuration:kDuration animations:^{
            [_tableView setFrame:CGRectMake(_tableView.frame.origin.x, kScreenHeight - _tableView.frame.size.height + kTopMargin, _tableView.frame.size.width, _tableView.frame.size.height - kTopMargin)];
        }];
    } completion:^(BOOL finished) {
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    ICLog(@"gestureRecognizer");
    if([touch.view isKindOfClass:[self class]]){
        return YES;
    }
    return NO;
}

- (void)tappedCancel{
    [UIView animateWithDuration:kDuration animations:^{
        [_tableView setFrame:CGRectMake(0, kScreenHeight,kScreenWidth, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

- (void)showInView:(UIViewController *)sView
{
    if(sView == nil){
        [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:self];
    }else{
        [sView.view addSubview:self];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (_listData.count > 0) {
        return [_listData count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.sheetType == ActionSheetViewTypeFactoryUser) {
        
        AlertViewCell *cell = [tableView dequeueReusableCellWithIdentifier:companyViewCellID];
       
        return cell;
    }else if (self.sheetType == ActionSheetViewTypeTransDevice)
    {
        ActionSheetCell *cell = [ActionSheetCell cellWithTableView:tableView];
      
        return cell;
    }else if (self.sheetType == ActionSheetViewTypeDeviceType)
    {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell==nil){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.text = _listData[indexPath.row];
        
        return cell;
        
    }
    else if (self.sheetType == ActionSheetViewTypeCompanyType)
    {
        AlertViewCell *cell = [tableView dequeueReusableCellWithIdentifier:companyViewCellID];
        
        return cell;
        
    }else if (self.sheetType == ActionSheetViewTypeProjectType)
    {
        AlertViewCell *cell = [tableView dequeueReusableCellWithIdentifier:companyViewCellID];
     
        return cell;
    }
    else if (self.sheetType == ActionSheetViewTypePouringWay)
    {
        AlertViewCell *cell = [tableView dequeueReusableCellWithIdentifier:companyViewCellID];
       
        return cell;
    }
    else if (self.sheetType == ActionSheetViewTypeProjectSchedule)
    {
        AlertViewCell *cell = [tableView dequeueReusableCellWithIdentifier:companyViewCellID];
      
        return cell;
    }
    else if (self.sheetType == ActionSheetViewTypePart)
    {
        AlertViewCell *cell = [tableView dequeueReusableCellWithIdentifier:companyViewCellID];
     
        return cell;
    }
    else if (self.sheetType == ActionSheetViewTypeHotGroup)
    {
        AlertViewCell *cell = [tableView dequeueReusableCellWithIdentifier:companyViewCellID];
       HotGroup *hotGroup = _listData[indexPath.row];
        cell.nameLabel.text = [NSString stringWithFormat:@"%@",hotGroup.group_name];

        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self tappedCancel];
    
    if(_delegate != nil && [_delegate respondsToSelector:@selector(sheetView:didSelectIndex:)]){
        [_delegate sheetView:self didSelectIndex:indexPath.row];
        return;
    }
    
    if (self.selectRowAtIndex) {
        self.selectRowAtIndex(indexPath.row);
    }
}

- (void)btnClick
{
    [self tappedCancel];
}

@end
