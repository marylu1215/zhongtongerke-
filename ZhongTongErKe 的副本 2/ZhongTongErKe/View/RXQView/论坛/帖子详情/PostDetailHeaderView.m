//
//  PostDetailHeaderView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PostDetailHeaderView.h"

@interface PostDetailHeaderView ()

@property (nonatomic ,strong) UIImageView *headImageView;
@property (nonatomic ,strong) UILabel *nameLabel;
@property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UIImageView *bottomLine;
@end
@implementation PostDetailHeaderView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self prepareUI];
    }
    
    return self;
}

-(void)prepareUI
{
    
    self.headImageView = [[UIImageView alloc]init];
    [self addSubview:self.headImageView];
    
    self.nameLabel = [UILabel  addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cGrayWord];
    [self addSubview:self.nameLabel];

    
    self.praiseButton = [UIButton addBtnImage:ltPraiseImageName WithTarget:self action:@selector(praiseAction:)];
    [self addSubview: self.praiseButton];
    
    self.replyButton = [UIButton addBtnImage:tz_replyImageName WithTarget:self action:@selector(replyActon:)];
    [self addSubview:self.replyButton];
    
    self.contentLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    self.contentLabel.numberOfLines = 0;
    [self addSubview:self.contentLabel];
    
    self.bottomLine = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self addSubview:self.bottomLine];
    
    self.bottomLine.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self,0);
}


-(void)setInvitation:(Invitation *)invitation
{
  
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:invitation.head] placeholderImage:[UIImage imageNamed:headPortraitImageName]];
    self.headImageView.sd_layout.widthIs(px(60)).heightIs(px(60)).topSpaceToView(self,px(20)).leftSpaceToView(self,px(14));
    
    self.nameLabel.text = invitation.username;
    self.nameLabel.sd_layout.widthIs([NSString backSizeWithText:self.nameLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.headImageView,px(10)).topSpaceToView(self,px(40));
    
    self.replyButton.sd_layout.widthIs(self.replyButton.imageView.image.size.width).heightIs(self.replyButton.imageView.image.size.height).rightSpaceToView(self,px(30)).topSpaceToView(self,px(40));
    
   self.praiseButton.sd_layout.widthIs(self.praiseButton.imageView.image.size.width).heightIs(self.praiseButton.imageView.image.size.height).rightSpaceToView(self.replyButton,px(20)).centerYEqualToView(self.replyButton);
    
    self.contentLabel.text =invitation.comment_content;
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13)};
    CGRect descFrame =  [self.contentLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(114), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(90);
    descFrame.origin.y = px(90);
    self.contentLabel.frame = descFrame;
    
}

//回复
-(void)replyActon:(UIButton *)btn
{
    if (self.repBlock) {
        
        self.repBlock(btn);
    }
}

//点赞
-(void)praiseAction:(UIButton *)btn
{
    if (self.priseBlock) {
        
        self.priseBlock(btn);
    }
}

@end
