//
//  PersonInfoHeaderView.m
//  MagicFinger
//
//  Created by xufeng on 16/5/18.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "PersonInfoHeaderView.h"
@interface PersonInfoHeaderView ()

@property (nonatomic ,strong) UIImageView *lineImageView;

@end
@implementation PersonInfoHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configUI];
        [self configFrame];
    }
    return self;
}

-(void)configUI{
    
    _titleLabel = [UILabel labelWithText:@"头像" Font:12 Color: TITLE_COLOR Alignment:(NSTextAlignmentLeft)];
    [self addSubview:_titleLabel];
    
    _avatarIV = [[UIImageView alloc]init];
    _avatarIV.layer.cornerRadius = px(132)/2;
    _avatarIV.clipsToBounds = YES;
    _avatarIV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(avatarIVClick)];
    [_avatarIV addGestureRecognizer:tap];
    [self addSubview:_avatarIV];
    
    self.lineImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self addSubview:self.lineImageView];
    
}
-(void)configFrame{
    
    _avatarIV.sd_layout.widthIs(px(132)).heightIs(px(132)).rightSpaceToView(self,15).centerYEqualToView(self);
    _titleLabel.sd_layout.leftSpaceToView(self,15).rightSpaceToView(_avatarIV,15).centerYEqualToView(self).autoHeightRatio(0);
    
    self.lineImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self,0);
}
-(void)avatarIVClick{
    if (self.avatarIVClickBlock) {
        self.avatarIVClickBlock();
    }
}
- (void)setUser:(User *)user
{
    _user = user;

    [_avatarIV sd_setImageWithURL:[NSURL URLWithString:  [user.head containsString:@"http"]?user.head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,user.head]] placeholderImage:[UIImage imageNamed:headPortraitImageName]];
    
   }
@end
