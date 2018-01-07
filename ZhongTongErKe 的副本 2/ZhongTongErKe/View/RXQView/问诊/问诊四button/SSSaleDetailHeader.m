//
//  SSSaleDetailHeader.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/23.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSSaleDetailHeader.h"

@interface SSSaleDetailHeader ()

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UIImageView *lineView;

@end

@implementation SSSaleDetailHeader

- (instancetype)init{
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubviews{
    
      self.bgImageView = [[UIImageView alloc]init];
    [self addSubview:self.bgImageView];
    
    self.headLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:S_COLOR];
    [self addSubview:self.headLabel];

    
    self.titleLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview:self.titleLabel];
    
    self.lineView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"f1eff0"]];
    [self addSubview:self.lineView];
    
    
    
}
- (void)makeConstaits{
   
    self.bgImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(262)).topSpaceToView(self,0);
    
    self.titleLabel.sd_layout.leftSpaceToView(self,px(63)).topSpaceToView(self.bgImageView,px(20)).rightSpaceToView(self,0).heightIs(Font15);
    
    self.headLabel.sd_layout.leftSpaceToView(self,px(66)).topSpaceToView( self.titleLabel,px(20)).rightSpaceToView(self,px(30)).heightIs(Font15);
    
    self.lineView.sd_layout.widthIs(kScreenWidth).heightIs(px(14)).topSpaceToView(self.headLabel,px(30));
    

}

-(void)setPackage:(Package *)package
{

    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImageBaseURL,package.img]]];
    
    self.titleLabel.text = package.title;

    self.headLabel.text = [NSString stringWithFormat:@"¥%@/例",  package.price];

}
@end
