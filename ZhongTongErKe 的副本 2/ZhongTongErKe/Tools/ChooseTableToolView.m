//
//  ChooseTableToolView.m
//  MagicFinger
//
//  Created by xufeng on 16/9/23.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "ChooseTableToolView.h"
#import "HighlightedButton.h"
#import "SSTabBarController.h"
#import "ICNavigationController.h"
@interface ChooseTableToolView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIButton *topButton;
@property (nonatomic, strong) NSArray *buttonArray;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) NSArray *tableDataArr;
@property (nonatomic, weak) UIView *footerView;
@property (nonatomic ,assign) long flag;

@end

@implementation ChooseTableToolView
- (NSMutableArray *)tableDataArrOfArr{
    if (!_tableDataArrOfArr) {
        _tableDataArrOfArr = [NSMutableArray array];
    }
    return _tableDataArrOfArr;
}

- (instancetype)initWithBtnArray:(NSArray *)btnArray tableDataArrOfArr:(NSMutableArray *)tableDataArrOfArr
{
    if (self = [super init]) {
        self.buttonArray = btnArray;
        self.tableDataArrOfArr = tableDataArrOfArr;
        
        self.backgroundColor = BACKGROUND_COLOR;
        
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
        
        UIImageView *bottomLine = [UIImageView createImageViewWithImageName:nil color:cMainLine];
        [footerView addSubview:bottomLine];
        bottomLine.sd_layout.widthIs(kScreenWidth).heightIs(kPx(2)).bottomSpaceToView(footerView,0);
        
        [_contentView addSubview:tableView];
        [_contentView addSubview:footerView];
    }
    
    return _contentView;
}

- (void)setupChildView
{
    for (NSInteger i = 0; i < self.buttonArray.count; i++) {
        if (i >= self.tableDataArrOfArr.count) {
            NSArray *arr = [NSArray array];
            [self.tableDataArrOfArr addObject:arr];
        }
        
        BtnSuperView *btnSuperView = [[BtnSuperView alloc] initWithTitle:self.buttonArray[i]];
        btnSuperView.tag = 100 + i;
        __weak typeof(self) weakSelf = self;
        btnSuperView.btnClickBolck = ^(HighlightedButton *btn){
            
            NSInteger tag = btn.superview.tag;
            
            weakSelf.tableDataArr = weakSelf.tableDataArrOfArr[tag - 100];
            weakSelf.flag = tag - 100;
            if (weakSelf.tableDataArr.count) {
                
                btn.selected = !btn.selected;
            }
            
            [weakSelf.tableView reloadData];
            // 显示/隐藏视图
            [weakSelf showOrHideView:btn.selected];
            
            if (weakSelf.selectButton != btn) {
                weakSelf.selectButton.selected = NO;
                weakSelf.selectButton = btn;
            }
            
        };
        
        if (i == self.buttonArray.count - 1) {
            btnSuperView.lineView.hidden = YES;
        }
        [self addSubview:btnSuperView];
        
    }
    
}


- (void)showOrHideView:(BOOL)isSelected
{
    ICLog(@"showOrHideView--%zd---%@",isSelected,[UIApplication sharedApplication].delegate.window.rootViewController);
    
    UIView *rootView = [self viewController:self].view;
    
    
    
    CGRect triggerRect = [self convertRect:self.bounds toView:rootView];
    
    if (isSelected) {
        [rootView addSubview:self.contentView];
        self.contentView.frame = CGRectMake(0, CGRectGetMaxY(triggerRect), kScreenWidth, kScreenHeight - CGRectGetMaxY(triggerRect));
        self.contentView.alpha = 1.0;
        
        if (self.tableDataArr.count * 44 > self.contentView.height * 0.9) {
            self.tableView.frame = CGRectMake(0, 0, self.contentView.width, self.contentView.height * 0.9);
            self.tableView.scrollEnabled = YES;
            self.footerView.y = CGRectGetMaxY(self.tableView.frame);
        }else
        {
            self.tableView.frame = CGRectMake(0, 0, self.contentView.width, 44 * self.tableDataArr.count);
            self.tableView.scrollEnabled = NO;
            self.footerView.y = CGRectGetMaxY(self.tableView.frame);
        }
        
        if (self.changeBgViewColor) {
            
            self.changeBgViewColor();
        }
        
    }else
    {
        self.contentView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - CGRectGetMaxY(triggerRect));
        self.contentView.alpha = 0.0;
        
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *menuID = @"menuID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:menuID];
    
    if (cell == nil) {
        if (_constructNoArray.count) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:menuID];
        }
        
        else
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuID];
        }
        
        cell.textLabel.font = font(15);
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    cell.textLabel.text = self.tableDataArr[indexPath.row];
    
    if (_constructNoArray.count) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:menuID];
    }
    cell.textLabel.font = font(15);
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = self.tableDataArr[indexPath.row];
    
    if (_constructNoArray.count) {
        if (self.flag) {
            cell.detailTextLabel.text = _constructNoArray[indexPath.row];
        }
        else
        {
            cell.detailTextLabel.text = @"";
        }
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
    
    if (self.selectCellModelBlock) {
        self.selectCellModelBlock(self.selectButton.superview.tag - 100 , indexPath.row);
    }
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

- (UIViewController*)viewController:(UIView *)view {
    
    for (UIView* next = [view superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[ UIViewController class]]) {
            
            return ( UIViewController*)nextResponder;
            
        }
    }
    
    return nil;
}

- (void)setConstructNoArray:(NSArray *)constructNoArray
{
    _constructNoArray = constructNoArray;
    
    ICLog(@"%ld",(long)self.selectButton.tag);
    
    [self.tableView reloadData];
    
}
@end
