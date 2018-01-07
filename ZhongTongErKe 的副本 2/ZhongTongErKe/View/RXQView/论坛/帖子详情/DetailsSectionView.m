//
//  DetailsSectionView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "DetailsSectionView.h"

@interface DetailsSectionView ()

@property (nonatomic ,strong) UIImageView *headImgeView;
@property  (nonatomic ,strong) UILabel *nameLabel;
@property (nonatomic ,strong) UILabel *titLabel;


@end

@implementation DetailsSectionView

-(id)init
{
    if (self = [super init]) {
        
        self.backgroundColor = c255255255;
        self.headImgeView = [[UIImageView alloc]init];
        self.headImgeView.layer.cornerRadius = px(60)/2;
        self.headImgeView.clipsToBounds = YES;
        [self addSubview:self.headImgeView];
        
        self.nameLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
        [self addSubview: self.nameLabel];
        
        self.titLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self addSubview:self.titLabel];
        
    }
    return self;
}

-(void)setForum:(Forum *)forum
{
    _forum = forum;

    [self.headImgeView sd_setImageWithURL:[NSURL URLWithString:forum.img] placeholderImage:[UIImage imageNamed:@"wd-pic"]];
    self.headImgeView.sd_layout.widthIs(px(60)).heightIs(px(60)).leftSpaceToView(self,px(14)).topSpaceToView(self,px(22));
    
    self.nameLabel.text = forum.publish_name;
    self.nameLabel. sd_layout.leftSpaceToView(self.headImgeView,px(10)).heightIs(Font13).centerYEqualToView(self.headImgeView).rightSpaceToView(self,0);
    
    self.titLabel.text = forum.title;
     self.titLabel.sd_layout.leftSpaceToView(self.headImgeView,px(10)).heightIs(Font15).bottomSpaceToView(self,0).rightSpaceToView(self,0);
    
    
}
@end
