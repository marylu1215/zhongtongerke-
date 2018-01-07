//
//  SSSubjectListHead.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSSubjectListHead.h"
@interface SSSubjectListHead ()
@property(nonatomic,strong) UIImageView *bottomLineView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UILabel *detailLabel;

@end

@implementation SSSubjectListHead

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}



- (void)addSubviews{
 
    self.titleLabel =  [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cHBColor];
    [self addSubview:self.titleLabel];
    
    self.numLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cHBColor];
    [self addSubview:self.numLabel];
    
    self.detailLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    self.detailLabel.numberOfLines=0;
    [self addSubview:self.detailLabel];
    
    self.bottomLineView= [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self addSubview:self.bottomLineView];
}

- (void)makeConstaits{
   
    self.bottomLineView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self, 0);
    
}

-(void)setMyassessment:(MyAssessment *)myassessment
{
    self.titleLabel.text = myassessment.assessment.ceshi_name;
    self.titleLabel.sd_layout.leftSpaceToView(self, px(30)).topSpaceToView(self, px(20)).widthIs([NSString backSizeWithText:self.titleLabel.text andFont:font(Font13)].width).heightIs(Font13);
   
    self.numLabel.text = [NSString stringWithFormat:@"(%@)",myassessment.numStr];
    self.numLabel.sd_layout.leftSpaceToView(self.titleLabel, px(24)).rightSpaceToView(self, px(30)).centerYEqualToView(self.titleLabel).heightIs(Font13);
    
  
    self.detailLabel.text = myassessment.subTitle;
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13)};
    CGRect descFrame =  [self.detailLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(60), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(30);
    descFrame.origin.y =  px(70);
    self.detailLabel.frame = descFrame;

    CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY(self.detailLabel.frame)+px(30);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}


@end
