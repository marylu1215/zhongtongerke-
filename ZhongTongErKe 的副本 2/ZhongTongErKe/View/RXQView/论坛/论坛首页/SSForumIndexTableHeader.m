//
//  SSForumIndexTableHeader.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSForumIndexTableHeader.h"

@interface SSForumIndexTableHeader ()

@property (nonatomic,strong)UIView *bottomLineView;
@property (nonatomic,strong)UIView *topSeparator;


@end

@implementation SSForumIndexTableHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self addSubViews];
        [self makeConstraits];
    }
    return self;
}

- (void)addSubViews{
    
    [self addSubview:self.button];
    [self addSubview:self.label];
    [self addSubview:self.imageView];
    [self addSubview:self.bottomLineView];
    [self addSubview:self.topSeparator];
    self.btnTitleLabel = [UILabel labelWithText:@"" Font:Font13 Color:cHBColor Alignment:NSTextAlignmentRight];
    [self addSubview:self.btnTitleLabel];
    
}
- (void)makeConstraits{
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(11*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(17*kScreenWidthScale, 17*kScreenHeightScale));
        make.left.mas_equalTo(px(30));
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(150*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(40);
    }];
   
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.bottom.mas_equalTo(0);
    }];
    [self.topSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.top.mas_equalTo(0);
    }];
    
    self.button.sd_layout.widthIs(kScreenWidth).topSpaceToView(self,0).bottomSpaceToView(self,0)
    ;
    self.btnTitleLabel.sd_layout.rightSpaceToView(self,px(30)).heightIs(Font13).centerYEqualToView(self.label).leftSpaceToView(self.label,0);
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.font = [UIFont systemFontOfSize:Font15];
        _label.textColor = MAIN_COLOR;
    }
    return _label;
}
- (UIButton *)button{
    if (!_button) {
        _button = [[UIButton alloc]init];
        _button .titleLabel.font = font(Font13);
       
    }
    return _button;
}
- (UIView *)bottomLineView{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc]init];
        _bottomLineView.backgroundColor = LINE_COLOR;
    }
    return _bottomLineView;
}
- (UIView *)topSeparator{
    if (!_topSeparator) {
        _topSeparator = [[UIView alloc]init];
        _topSeparator.backgroundColor = BACKGROUND_COLOR;
    }
    return _topSeparator;
}

@end
