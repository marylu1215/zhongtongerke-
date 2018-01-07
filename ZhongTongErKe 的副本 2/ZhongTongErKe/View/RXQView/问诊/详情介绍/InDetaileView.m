//
//  InDetaileView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "InDetaileView.h"

@interface InDetaileView ()
@property (nonatomic ,strong)  UIImageView *patImageView;
@property (nonatomic ,strong) UILabel *patLabel;
@property (nonatomic ,strong) UILabel *priceLabel;
@property (nonatomic ,strong) UILabel *contentLable;
@property (nonatomic ,strong) UIImageView *docImageView;
@property (nonatomic ,strong) UIButton *listenButton;
@property (nonatomic ,strong) UILabel *seeLable;
@property (nonatomic ,strong) UILabel *timeLabel;
@property (nonatomic ,strong) UIView *sepView;
@property (nonatomic ,strong) UILabel *dateTimeLabel;
@property (nonatomic ,strong) UIImageView *dateImageView;
@property (nonatomic ,strong) UILabel *praiseTimeLabel;
@property (nonatomic ,strong) UIButton *praiseButton;
@property (nonatomic ,strong) UILabel *listenLabel;
@property (nonatomic ,strong) UIImageView *listenImageView;
@property (nonatomic , strong) AVPlayer *mediaPlayer;


@end

@implementation InDetaileView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
      
        self.patImageView = [[UIImageView alloc]init];
        [self addSubview:self.patImageView];
        self.patImageView.layer.cornerRadius = px(60)/2;
        self.patImageView.clipsToBounds =YES;
    self.patLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cGrayWord];
        [self addSubview: self.patLabel];

    self.priceLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:S_COLOR];
        [self addSubview:self.priceLabel];
        
    self.contentLable = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
        self.contentLable.numberOfLines = 0;
        [self addSubview:self.contentLable];
        
      self.docImageView  = [[UIImageView alloc]init];
        [self addSubview:self.docImageView];
        self.docImageView.layer.cornerRadius = px(60)/2;
       self.docImageView.clipsToBounds =YES;
        
     self.listenButton =  [UIButton addBtnImage:index_listenImageName WithTarget:self action:@selector(listenAction:)];
    [self addSubview: self.listenButton];
        
        
    self.seeLable = [UILabel addLabelWithText:@"一元偷偷听" AndFont:Font9 AndAlpha:1.0 AndColor: c255255255];
    [self.listenButton  addSubview: self.seeLable];
    
   self.timeLabel  = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cGrayWord];
    [self addSubview:self.timeLabel];
    
    self.sepView = [[UIView alloc]init];
    self.sepView.backgroundColor = [UIColor colorWithHexString:@"e9e9e9"];
    [self addSubview:self.sepView];
      
    self.dateTimeLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cGrayWord];
    [self addSubview:self.dateTimeLabel];
      
    self.dateImageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:clockImageName]];
    [self addSubview:self.dateImageView];
   
    self.praiseTimeLabel  = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cGrayWord];
    [self addSubview: self.praiseTimeLabel];
        
    self.praiseButton = [UIButton addBtnImage:praiseImageName WithTarget:self action:@selector(priseAction)];
    [self addSubview:self.praiseButton];
        
    self.listenLabel  = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cGrayWord];
        [self addSubview:self.listenLabel];
        
    self.listenImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed: @"myHearIcon"]];
    [self addSubview:self.listenImageView];

}
    return self;
}


-(void)setExConsult:(ExConsult *)exConsult
{
    _exConsult = exConsult;
   
     [self.patImageView sd_setImageWithURL:[NSURL URLWithString: exConsult.user_head] placeholderImage:[UIImage imageNamed:headPortraitImageName]];
     self.patImageView.sd_layout.widthIs(px(60)).heightIs(px(60)).leftSpaceToView(self,px(20)).topSpaceToView(self,px(20));
    
    self.patLabel.text = exConsult.username;
   self. patLabel.sd_layout.widthIs([NSString backSizeWithText: self.patLabel.text andFont:font(Font13)].width).heightIs(Font13).centerYEqualToView(self.patImageView).leftSpaceToView(self.patImageView,px(10));
    self.priceLabel.text = exConsult.price;
     self.priceLabel.sd_layout.widthIs([NSString backSizeWithText: self.priceLabel.text andFont:font(Font13)].width).heightIs(Font13).centerYEqualToView(self.patLabel).rightSpaceToView(self,px(20));
    
    self.contentLable.text = exConsult.content;
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13 )};
    CGRect descFrame =  [self.contentLable .text textRectWithSize:CGSizeMake(self.frame.size.width-px(110), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(90);
    descFrame.origin.y = px(90);
    self.contentLable.frame = descFrame;
    
    [self.docImageView sd_setImageWithURL:[NSURL URLWithString: exConsult.doctor_head] placeholderImage:[UIImage imageNamed:@"1"]];
    self.docImageView.sd_layout.widthIs(px(60)).heightIs(px(60)).leftSpaceToView(self,px(20)).topSpaceToView( self.contentLable,px(44));
    
    self.listenButton.sd_layout.widthIs(self.listenButton.imageView.image.size.width).heightIs(self.listenButton.imageView.image.size.height).leftSpaceToView( self.docImageView,px(30)).centerYEqualToView(self.docImageView);
    self.seeLable.sd_layout.widthIs([NSString backSizeWithText: self.seeLable.text andFont:font(Font9)].width).heightIs(Font9).centerYEqualToView(self.listenButton).leftSpaceToView(self.listenButton, px(30));
    
    self.timeLabel.text = @"";
    self.timeLabel.sd_layout.widthIs([NSString backSizeWithText:self.timeLabel.text andFont:font(Font13)].width).heightIs(Font13).centerYEqualToView(self.listenButton).leftSpaceToView(self.listenButton,px(30));
    
    self.sepView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(self.docImageView,px(20));
    
    NSString *createTimeStr = [NSString stringWithFormat:@"%lld", exConsult.over_time];
    
    if (createTimeStr.length < 13) {
       exConsult.over_time = exConsult.over_time* 1000;
    }
    
    self.dateTimeLabel.text = [NSString timeIntervalWithDataStr:[NSString stringWithFormat:@"%lld", exConsult.over_time]];
    self.dateTimeLabel.sd_layout.widthIs([NSString backSizeWithText:self.dateTimeLabel.text andFont:font(Font13)].width).heightIs(Font13).rightSpaceToView(self,px(20)).topSpaceToView(self.sepView, px(30));
    self.dateImageView.sd_layout.widthIs(self.dateImageView.image.size.width).heightIs(self.dateImageView.image.size.height).centerYEqualToView(self.dateTimeLabel).rightSpaceToView(self.dateTimeLabel,px(10));
    
    self.praiseTimeLabel.text = exConsult.num;
    self.praiseTimeLabel.sd_layout.widthIs([NSString backSizeWithText:self.praiseTimeLabel.text andFont:font(Font13)].width).heightIs(Font13).rightSpaceToView(self.dateImageView,px(30)).centerYEqualToView(self. dateTimeLabel);
  self.praiseButton.sd_layout.widthIs(self.praiseButton.imageView.image.size.width).heightIs(self.praiseButton.imageView.image.size.height).centerYEqualToView(self.praiseTimeLabel).rightSpaceToView(self.praiseTimeLabel,px(10));
    
   
    self. listenLabel.text = exConsult.view;
    self.listenLabel.sd_layout.widthIs([NSString backSizeWithText:self.listenLabel.text andFont:font(Font13)].width).heightIs(Font13).rightSpaceToView(self. self.praiseButton,px(30)).centerYEqualToView(self.dateTimeLabel);
    
     self.listenImageView.sd_layout.widthIs(self.listenImageView.image.size.width).heightIs(self.listenImageView.image.size.height).centerYEqualToView(self.praiseTimeLabel).rightSpaceToView(self.listenLabel,px(10));
    
}
-(void)listenAction:(UIButton *)btn
{
   _mediaPlayer = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:[_exConsult.answer containsString:@"http"]?_exConsult.answer:[NSString stringWithFormat:@"%@%@",ImageBaseURL,_exConsult.answer]]]; //在线
    [_mediaPlayer play];
    
}

-(void)priseAction
{
    if (self.priseBlcok) {
        
        self.priseBlcok();
        
    }
}


@end
