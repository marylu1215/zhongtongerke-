//
//  ChooseToolView.m
//  MagicFinger
//
//  Created by xufeng on 16/8/16.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "ChooseToolView.h"

#define borderW 1
#define bottomLineH 0.5
@interface ChooseToolView ()
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic, weak) UIButton *selectButton;
@property (nonatomic,strong) NSMutableArray *btnMuArr;
@property (nonatomic,strong) NSMutableArray *midLineMuArr;
@property (nonatomic,strong) UIView *bottomLine;

@end

@implementation ChooseToolView

-(NSMutableArray *)btnMuArr{
    if (!_btnMuArr) {
        _btnMuArr = [NSMutableArray array];
    }
    return _btnMuArr;
}

-(NSMutableArray *)midLineMuArr{
    if (!_midLineMuArr) {
        _midLineMuArr = [NSMutableArray array];
    }
    return _midLineMuArr;
}
- (id)initWithFrame:(CGRect)frame titles:(NSArray *)titlesArr borderColor:(UIColor *)borderColor chooseToolViewType:(ChooseToolViewType)type More:(BOOL)more
{
    if (self = [super initWithFrame:frame]) {
       
        NSInteger count = titlesArr.count;
        CGRect newFrame = frame;
        if (frame.size.width > kScreenWidth) {
            newFrame.size.width = kScreenWidth;
            self.frame = newFrame;
        }
        
        //防止自动下沉
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, newFrame.size.width , newFrame.size.height) ];
        [self addSubview:bgView];
        bgView.backgroundColor = [UIColor clearColor];
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, newFrame.size.width, newFrame.size.height)];
        [self addSubview:_scrollView];
//        _scrollView.contentSize = CGSizeMake(frame.size.width, 0);
        _scrollView.contentSize = frame.size;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        
        CGFloat width = frame.size.width / count;
        CGFloat height = frame.size.height;
        
        // 添加指示器
        UIView *indicatorView = [[UIView alloc] init];
        indicatorView.backgroundColor = MAIN_COLOR;
        indicatorView.height = 2;
        indicatorView.y = height - indicatorView.height;
        self.indicatorView = indicatorView;
        
       
   
        
        CGFloat btnX = px(30);
        
        for (int i = 0; i < count; i++) {
            
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake( more?i * width:btnX, 0, more?width:[NSString backSizeWithText:titlesArr[i] andFont:font(Font13)].width ,height - bottomLineH)];
            
              btnX+= [NSString backSizeWithText:titlesArr[i] andFont:font(Font13)].width+px(30);
            button.tag = i;
            
            [button setTitle:titlesArr[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
            
            button.titleLabel.font = [UIFont boldSystemFontOfSize:Font13];
            
            [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollView addSubview:button];
            [self.btnMuArr addObject:button];
            
            if (i == 0) {
                [button.titleLabel sizeToFit];
                
                button.enabled = NO;
                self.selectButton = button;
                
                [self setUpIndicatorViewWidthAndCenter:button];
            }
            if (i != count - 1) {
                //边框
                UIView *lineView = [[UIView alloc] init];
                lineView.backgroundColor = borderColor;
                lineView.frame = CGRectMake(CGRectGetMaxX(button.frame) - borderW, 0, borderW, button.height);
                [self.midLineMuArr addObject:lineView];
                [self.scrollView addSubview:lineView];
                
                if (type == ChooseToolViewBorder) {
                    lineView.hidden = NO;
                }else{
                    lineView.hidden = YES;
                }
            }
        }
        
        if (type == ChooseToolViewIndicator) {//下划线
           
            [self.scrollView addSubview:indicatorView];
            
        }else{//边框
            _scrollView.layer.borderColor = borderColor.CGColor;
            _scrollView.layer.borderWidth = borderW;
            _scrollView.layer.cornerRadius = 3.f;
            _scrollView.layer.masksToBounds = YES;
        }
    }
    return self;
}

#pragma mark - setter

-(void)setTitleColor:(UIColor *)titleColor{
    for (int i = 0; i < self.btnMuArr.count; i++) {
        UIButton *button = self.btnMuArr[i];
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
}

-(void)setSelectedTitleColor:(UIColor *)selectedTitleColor{
    for (int i = 0; i < self.btnMuArr.count; i++) {
        UIButton *button = self.btnMuArr[i];
        [button setTitleColor:selectedTitleColor forState:UIControlStateDisabled];
    }
}
- (void)setTitleFont:(UIFont *)titleFont{
    for (int i = 0; i < self.btnMuArr.count; i++) {
        UIButton *button = self.btnMuArr[i];
        button.titleLabel.font = titleFont;
    }
}

- (void)setBgNomalColor:(UIColor *)BgNomalColor{
    for (int i = 0; i < self.btnMuArr.count; i++) {
        UIButton *button = self.btnMuArr[i];
        [button setBackgroundImage:[UIColor imageWithColor:BgNomalColor] forState:(UIControlStateNormal)];
    }
}

- (void)setBgSelectedColor:(UIColor *)BgSelectedColor{
    for (int i = 0; i < self.btnMuArr.count; i++) {
        UIButton *button = self.btnMuArr[i];
        [button setBackgroundImage:[UIColor imageWithColor:BgSelectedColor] forState:(UIControlStateDisabled)];
    }
}

- (void)setIndicatorLineColor:(UIColor *)indicatorLineColor{
    self.indicatorView.backgroundColor = indicatorLineColor;
}

- (void)setShowBottomLine:(BOOL)showBottomLine{
    _showBottomLine = showBottomLine;
    self.bottomLine.hidden = !showBottomLine;
}

- (void)setIndicatorLineHeight:(CGFloat)indicatorLineHeight{
    _indicatorLineHeight = indicatorLineHeight;
    self.indicatorView.height = indicatorLineHeight;
    self.indicatorView.y = self.height - indicatorLineHeight;
}

- (void)setMidLineHeight:(CGFloat)midLineHeight{
    for (UIView *line in self.midLineMuArr) {
        line.height = midLineHeight;
        line.y = (self.height - midLineHeight)/2;
        line.hidden = NO;
    }
}

- (void)setMidLineWidth:(CGFloat)midLineW{
    for (UIView *line in self.midLineMuArr) {
        line.width = midLineW;
        line.hidden = NO;
    }
}

- (void)setShowMidLine:(BOOL)showMidLine{
    for (UIView *line in self.midLineMuArr) {
        line.hidden = !showMidLine;
    }
}

- (void)setMidLineColor:(UIColor *)midLineColor{
    for (UIView *line in self.midLineMuArr) {
        line.backgroundColor = midLineColor;
    }
}

#pragma mark - privite

- (void)setUpIndicatorViewWidthAndCenter:(UIButton *)button
{
//    self.indicatorView.width = button.titleLabel.width + 20;
    self.indicatorView.width = button.width;
    self.indicatorView.centerX = button.centerX;
}

- (void)titleClickAtIndex:(NSInteger)index{
    UIButton *button = self.btnMuArr[index];
    [self titleClick:button];
}

- (void)titleClick:(UIButton *)button
{
    // 修改按钮选中状态
    self.selectButton.enabled = YES;
    button.enabled = NO;
    self.selectButton = button;
    
    // 设置指示器的宽度，中心点
    [UIView animateWithDuration:0.25 animations:^{
        [self setUpIndicatorViewWidthAndCenter:button];
    }];
    
    if (_chooseBlock) {
        _chooseBlock(button.tag);
    }
}

- (void)didChooseAtIndex:(ChooseBlock)chooseBlock{
    _chooseBlock = chooseBlock;
}

@end
