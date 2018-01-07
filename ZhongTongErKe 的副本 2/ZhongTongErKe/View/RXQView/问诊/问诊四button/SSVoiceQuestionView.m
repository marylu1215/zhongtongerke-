//
//  SSVoiceQuestionView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSVoiceQuestionView.h"
#import "KJPlaceholderTextView.h"

@interface SSVoiceQuestionView ()

@property (nonatomic,strong) UIImageView *headImageview;
@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UILabel *describeLabel;
@property (nonatomic ,strong) UIView *tagView;

@property (nonatomic,strong) UIView *remindView;
@property (nonatomic,strong) UILabel *remindLabel;


@property (nonatomic ,strong) UIView *bottomView;
@property (nonatomic,strong)  UILabel *publicLabel;
@property (nonatomic,strong) UIButton *checkButton;
@property (nonatomic ,strong) UIImageView *lineImageView;

@end

@implementation SSVoiceQuestionView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
   
    
    self.headImageview = [[UIImageView alloc]init];
    self.headImageview.layer.cornerRadius = px(80)/2;
    self.headImageview.clipsToBounds = YES;
    self.headImageview.layer.borderColor = cHBColor.CGColor;
    self.headImageview.layer.borderWidth = px(2);
    [self addSubview:self.headImageview];
    
    self.headLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview:self.headLabel];
    
    self.describeLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self addSubview:self.describeLabel];
    
    self.tagView = [[UIView alloc]init];
    [self addSubview:self.tagView];
    
    self.remindView = [[UIView alloc]init];
    self.remindView.backgroundColor = [UIColor colorWithHexString:@"e6e5e5"];
    [self addSubview:self.remindView];
    
    self.remindLabel = [UILabel addLabelWithText:@"医生的回复仅为建议，具体诊疗请前往医院进行" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.remindView addSubview:self.remindLabel];
    

    //** 填写描述 */
    self.descView = [[DescriptionView alloc]initWithPlaceholder:@"请输入您要咨询的问题!" maxLength:500];
    [self addSubview:self.descView];

   
    self.bottomView = [[UIView alloc]init];
    [self addSubview:self.bottomView];
    
    self.lineImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.bottomView addSubview:self.lineImageView];
    
    self.publicLabel = [UILabel addLabelWithText:@"公开提问" AndFont:Font15 AndAlpha:1.0 AndColor:cHBColor];
    [self.bottomView addSubview: self.publicLabel];
    
    self.checkButton = [UIButton addBtnImage:unchoose_fwgmImageName WithTarget:self action:@selector(chooseAction:)];
    [self.checkButton setImage:[UIImage imageNamed:choose_fwgmImageName] forState:UIControlStateSelected];
    [self.bottomView addSubview: self.checkButton];
    
    
}
- (void)makeConstaits
{
    
    
    self.headImageview.sd_layout.widthIs(px(80)).heightIs(px(80)).leftSpaceToView(self,px(20)).topSpaceToView(self,px(30));
    

    
}

-(void)setDoctor:(Doctor *)doctor
{
    
      [self.headImageview sd_setImageWithURL:[NSURL URLWithString:[doctor.head containsString:@"http"]?doctor.head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,doctor.head]] placeholderImage:[UIImage imageNamed:@"1"]];
    
     self.headLabel.text = doctor.name;
    self.headLabel.sd_layout.widthIs([NSString backSizeWithText:self.headLabel.text andFont:font(Font15)].width).heightIs(Font15).leftSpaceToView(self.headImageview,px(20)).topSpaceToView(self,px(30));
    
    
    self.describeLabel.text = [NSString stringWithFormat:@"%@ %@",doctor.department,doctor.title];
    self.describeLabel.sd_layout.leftSpaceToView(self.headLabel,px(10)).heightIs(Font13).centerYEqualToView(self.headLabel).rightSpaceToView(self,0);
    
    
    NSArray *tagArr = @[@"三甲医院",@"极速回复",@"专业有效"];
    
    int totalloc = (kScreenWidth-px(145))/63;
    
    ICLog(@"%f ---totalloc%d",(kScreenWidth-px(145)),totalloc);
    
    CGFloat btnWidth = px(110);
    CGFloat btnHeight = px(36);
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    for (int index = 0; index < tagArr.count; index++) {
        
        // 行号
        int row = index / totalloc;
        // 列号
        int col = index % totalloc;
        
        btnX =  (btnWidth+px(16))* col;
        btnY =  (btnHeight+px(20))* row;
        
        UILabel *label = [UILabel labelWithText:tagArr[index] Font:Font13 Color:cHBColor Alignment:NSTextAlignmentCenter];
        
        label.layer.borderColor = cHBColor.CGColor;
        label.layer.borderWidth = px(2);
        label.frame  = CGRectMake(btnX,  btnY, btnWidth, btnHeight);
        [self.tagView addSubview:label];
        
    }
    
    self.tagView.frame = CGRectMake(px(116), px(72), kScreenWidth-px(116), CGRectGetMaxY(self.tagView.subviews.lastObject.frame));
    
    
    self.remindView.frame = CGRectMake(0, CGRectGetMaxY(self.tagView.frame)+px(32), kScreenWidth, px(60));
    
    self.remindLabel.sd_layout.leftSpaceToView(self.remindView,px(20)).rightSpaceToView(self.remindView,0).heightIs(Font13).centerYEqualToView(self.remindView);
    
    
    self.descView.frame = CGRectMake(0, CGRectGetMaxY( self.remindView.frame), kScreenWidth, px(260));
    
    self.bottomView.frame = CGRectMake(0,CGRectGetMaxY( self.descView.frame), kScreenWidth, px(54));
    
    self.lineImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(self.bottomView,0);
    
    self.publicLabel.text = @"公开提问";
    
    self.publicLabel.sd_layout.widthIs([NSString backSizeWithText: self.publicLabel.text andFont:font(Font15)].width).heightIs(Font15).leftSpaceToView(self.bottomView,px(20)).centerYEqualToView( self.bottomView);
    
    
    self.checkButton.sd_layout.widthIs(self.checkButton.imageView.image.size.width).heightIs(self.checkButton.imageView.image.size.height).centerYEqualToView(self.bottomView).rightSpaceToView(self.bottomView,px(30));
    
    CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY(self.bottomView.frame);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;

}

-(void)chooseAction:(UIButton *)button
{
    button.selected = !button.selected;
    
}
@end
