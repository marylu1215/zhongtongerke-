//
//  TopBtnView.m
//  MagicFinger
//
//  Created by khj on 16/8/22.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "TopBtnView.h"
#import "BtnSuperView.h"

#import "HighlightedButton.h"

//NSString * const KJUpdateMenuTitleNote = @"KJUpdateMenuTitleNote";

@interface TopBtnView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIButton *topButton;
@property (nonatomic, strong) NSArray *buttonArray;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSArray *proArray;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, weak) UIView *footerView;
@end

@implementation TopBtnView

- (instancetype)initWithBtnArray:(NSArray *)btnArray
{
    if (self = [super init]) {
        self.buttonArray = btnArray;

        [self setupChildView];

    }
    
    return self;
}

- (UIView *)contentView
{
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
        _contentView.alpha = 0.0;
        _contentView.backgroundColor = RGBColor(0, 0, 0, 0.5);
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
        tapGesture.delegate = self;
        
        [_contentView addGestureRecognizer:tapGesture];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor whiteColor];
        self.tableView = tableView;
        tableView.delegate = self;
        tableView.dataSource  = self;
        

        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
        self.footerView = footerView;
        footerView.backgroundColor = tableView.backgroundColor;
        
        for (NSInteger i = 0; i < 2; i++) {
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = [UIColor colorWithHexString:@"#b3b3b3"];
            lineView.height = 1;
            lineView.width = kPx(40);
            lineView.y = 10 + i * 9;
            lineView.x = (footerView.width - lineView.width) * 0.5;
            
            [footerView addSubview:lineView];
        }
       
        [_contentView addSubview:tableView];
        [_contentView addSubview:footerView];
        
    }
    
    return _contentView;
}

- (void)setupChildView
{
    for (NSInteger i = 0; i < self.buttonArray.count; i++) {
        
        BtnSuperView *btnSuperView = [[BtnSuperView alloc] initWithTitle:self.buttonArray[i]];
        btnSuperView.tag = 100 + i;
        
        btnSuperView.btnClickBolck = ^(HighlightedButton *btn){
            
            btn.selected = !btn.selected;
            
            NSInteger tag = btn.superview.tag;
            
            if (tag == 100) {
                self.proArray = self.projects;
                
            }else if (tag == 101)
            {
                self.proArray = self.companys;
            }
            [self.tableView reloadData];
            // 显示/隐藏视图
            [self showOrHideView:btn.selected];
            
            if (self.selectButton != btn) {
                self.selectButton.selected = NO;
                self.selectButton = btn;
            }
        
        };
        
        if (i == self.buttonArray.count - 1) {
            btnSuperView.lineView.hidden = YES;
        }
        [self addSubview:btnSuperView];
        
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    ICLog(@"frame:%@",NSStringFromCGRect(self.frame));
    NSInteger btnCount = self.subviews.count;
    CGFloat btnW = self.width / btnCount;
    CGFloat btnH = self.height;
    CGFloat btnY = 0;
    CGFloat btnX = 0;
    
    for (NSInteger i = 0; i < btnCount; i++) {
        
        BtnSuperView *btnView = self.subviews[i];
        btnX = btnW * i;
        btnView.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    }
    
}

- (void)showOrHideView:(BOOL)isSelected
{
    ICLog(@"showOrHideView--%zd---%@",isSelected,[UIApplication sharedApplication].delegate.window.rootViewController);
    
    if (isSelected) {
        [self.superview addSubview:self.contentView];
        self.contentView.frame = CGRectMake(0, CGRectGetMaxY(self.frame), kScreenWidth, kScreenHeight - CGRectGetMaxY(self.frame));
        self.contentView.alpha = 1.0;
        if (self.proArray.count * 44 > self.contentView.height * 0.9) {
            self.tableView.frame = CGRectMake(0, 0, self.contentView.width, self.contentView.height * 0.9);
            self.tableView.scrollEnabled = YES;
            self.footerView.y = CGRectGetMaxY(self.tableView.frame);
        }else
        {
            self.tableView.frame = CGRectMake(0, 0, self.contentView.width, 44 * self.proArray.count);
            self.tableView.scrollEnabled = NO;
            self.footerView.y = CGRectGetMaxY(self.tableView.frame);
        }
        
    }else
    {
        self.contentView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - CGRectGetMaxY(self.frame));
        self.contentView.alpha = 0.0;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.proArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *menuID = @"menuID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:menuID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuID];
        cell.textLabel.font = font(15);
        cell.textLabel.textColor = [UIColor blackColor];
    }
   
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [self.selectButton setTitle:cell.textLabel.text forState:UIControlStateNormal];
    self.selectButton.selected = NO;
    [self showOrHideView:self.selectButton.selected];

}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    ICLog(@"touch view :%@----%@",touch.view,[self.superview class]);
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}

- (void)hideView
{
    ICLog(@"hideView");
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[BtnSuperView class]]) {
            BtnSuperView *btnView = (BtnSuperView *)view;
            
            btnView.topButton.selected = NO;
            [self showOrHideView:btnView.topButton.selected];
        }
    }
}
@end
