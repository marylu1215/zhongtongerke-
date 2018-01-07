//
//  SSMyColletionAticleCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define AticleCellIdentifier @"SSMyColletionAticleCellIdentifier"
#import "SSMyColletionAticleCell.h"

@interface SSMyColletionAticleCell ()

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) UILabel *headLabel;
@property (nonatomic, strong) UILabel *tagLabel;
@property (nonatomic, strong) UIImageView *checkImageView;
@property (nonatomic, strong) UILabel *checkLabel;
@property (nonatomic, strong) UIImageView *colletionImageView;
@property (nonatomic, strong) UILabel *collectionLabel;
@property (nonatomic, strong) UIImageView *clockImageView;
@property (nonatomic, strong) UILabel *clockLabel;

@property (nonatomic ,strong) UIImageView *topSepImageView;

@property (nonatomic ,strong) UIImageView *boSepImageView;

@end

@implementation SSMyColletionAticleCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID =  AticleCellIdentifier;
    SSMyColletionAticleCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SSMyColletionAticleCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}



- (void)configUI
{
    
    self.topSepImageView =[UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.contentView addSubview: self.topSepImageView];
    
    self.boSepImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.contentView addSubview:self.boSepImageView ];
    
    self.headImageView = [[UIImageView alloc]init];
   
    [self.contentView addSubview:self.headImageView];
    
    self.playBtn = [UIButton addBtnImage:playSmallImageName WithTarget:self action:@selector(playAction:)];
    [self.headImageView addSubview:self.playBtn];
    self.playBtn.hidden = YES;
    self.playBtn.userInteractionEnabled = NO;
    
    self.headLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    self.headLabel.numberOfLines = 0;
    [self.contentView addSubview:self.headLabel];
    
    self.tagLabel = [UILabel addLabelWithText:@"" AndFont:Font9 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview: self.tagLabel];
    
    self.checkImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:eyeIconImageName]];
    [self.contentView addSubview:self.checkImageView];
    
    self.checkLabel = [UILabel addLabelWithText:@"" AndFont:Font9 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.checkLabel];
    
    self.colletionImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:collectionImageName]];
    [self.contentView addSubview:self.colletionImageView];
    
    self.collectionLabel = [UILabel addLabelWithText:@"" AndFont:Font9 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview: self.collectionLabel];
    
    self.clockImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:clockImageName]];
    [self.contentView addSubview:self.clockImageView];
    
    self.clockLabel = [UILabel addLabelWithText:@"" AndFont:Font9 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.clockLabel];
}


-(void)playAction:(UIButton *)btn
{
    
    if (self.playVideoBlock) {
        self.playVideoBlock(btn);
    }
}
- (void)configFrame
{
    
    self.topSepImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(self.contentView,0);
    
    self.headImageView.sd_layout.widthIs(90).heightIs(75).leftSpaceToView(self.contentView,0).centerYEqualToView(self.contentView);
    
    self.playBtn.sd_layout.widthIs(self.playBtn.imageView.image.size.width).heightIs(self.playBtn.imageView.image.size.height).centerXEqualToView(self.headImageView).centerYEqualToView(self.headImageView);
    
     self.boSepImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.contentView,0);
}

-(void)setArticle:(Article *)article
{
    _article = article;
    

    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:  [article.path containsString:@"http"]?article.path:[NSString stringWithFormat:@"%@%@",ImageBaseURL,article.path]] placeholderImage:[UIImage imageNamed:bannerImageName]];
    
    CGFloat superMsgViewH = 0;
    self.headLabel.text = article.title;
    NSDictionary *descDic = @{NSFontAttributeName:font(12)};
    CGRect descFrame =  [self.headLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(242), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(190);
    descFrame.origin.y = px(30);
    self.headLabel.frame = descFrame;
    
    self.tagLabel.text = article.des;
    self.tagLabel.sd_layout.widthIs([NSString backSizeWithText:self.tagLabel.text andFont:font(12*kScreenWidthScale)].width).heightIs(12).leftSpaceToView(self.contentView,px(190)).centerYEqualToView(self.contentView).topSpaceToView(self.headLabel,px(50));
    
    self.checkImageView.sd_layout.widthIs(self.checkImageView.image.size.width).heightIs(self.checkImageView.image.size.height).centerYEqualToView(self.tagLabel).leftSpaceToView(self.tagLabel,px(10));
    
    self.checkLabel.text = [NSString stringWithFormat:@"%@人查看",article.view];
    self.checkLabel.sd_layout.widthIs([NSString backSizeWithText: self.checkLabel.text andFont:font(12*kScreenWidthScale)].width).heightIs(12).centerYEqualToView(self.tagLabel).leftSpaceToView(self.checkImageView,px(10));
    
    self.colletionImageView.sd_layout.widthIs( self.colletionImageView.image.size.width).heightIs( self.colletionImageView.image.size.height).centerYEqualToView(self.tagLabel).leftSpaceToView(self.checkLabel,px(10));
    
    self.collectionLabel.text = [NSString stringWithFormat:@"%@人收藏",article.bookmark];
    self.collectionLabel.sd_layout.widthIs([NSString backSizeWithText:  self.collectionLabel.text andFont:font(12*kScreenWidthScale)].width).heightIs(12).centerYEqualToView(self.tagLabel).leftSpaceToView(self.colletionImageView,px(10));
    
    
    self.clockImageView.sd_layout.widthIs(self.clockImageView.image.size.width).heightIs( self.clockImageView.image.size.height).centerYEqualToView(self.tagLabel).leftSpaceToView(self.collectionLabel,px(10));
    
    NSString *createTimeStr = [NSString stringWithFormat:@"%lld",article.create_time];
    
    if (createTimeStr.length < 13) {
       article.create_time = article.create_time * 1000;
    }
    
    
    NSDate *date = [NSDate timeStringToDate:[NSString timeIntervalWithDataStr:[NSString stringWithFormat:@"%lld",article.create_time]]];
    self.clockLabel.text = [NSString stringWithFormat:@"%@更新",[date dateToRequiredString]];
    
    self.clockLabel.sd_layout.widthIs([NSString backSizeWithText: self.clockLabel.text andFont:font(12*kScreenWidthScale)].width).heightIs(12).centerYEqualToView( self.clockImageView).leftSpaceToView(self.clockImageView,px(10));
    
    superMsgViewH = CGRectGetMaxY(self.headLabel.frame)+px(100);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
    
}

-(void)setVideo:(Video *)video
{
    self.headImageView.userInteractionEnabled = YES;
    self.playBtn.hidden = NO;
    self.playBtn.userInteractionEnabled = YES;
    self.clockImageView.hidden = YES;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:video.url] placeholderImage:[UIImage imageNamed:bannerImageName]];
    
    
    CGFloat superMsgViewH = 0;
    self.headLabel.text = video.title;
    NSDictionary *descDic = @{NSFontAttributeName:font(12)};
    CGRect descFrame =  [self.headLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(242), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(190);
    descFrame.origin.y = px(30);
    self.headLabel.frame = descFrame;
    
    self.collectionLabel.text = video.collection;
    self.collectionLabel.sd_layout.widthIs([NSString backSizeWithText:  self.collectionLabel.text andFont:font(12)].width).heightIs(12).topSpaceToView(self.headLabel,px(50)).rightSpaceToView(self.contentView,px(30));
    
    self.colletionImageView.sd_layout.widthIs( self.colletionImageView.image.size.width).heightIs( self.colletionImageView.image.size.height).centerYEqualToView(  self.collectionLabel).rightSpaceToView(  self.collectionLabel,px(10));
    
    self.checkLabel.text = video.see;
    self.checkLabel.sd_layout.widthIs([NSString backSizeWithText: self.checkLabel.text andFont:font(12)].width).heightIs(12).centerYEqualToView( self.collectionLabel).rightSpaceToView(  self.colletionImageView,px(20));
    
    self.checkImageView.sd_layout.widthIs(self.checkImageView.image.size.width).heightIs(self.checkImageView.image.size.height).centerYEqualToView(  self.collectionLabel). rightSpaceToView(self.checkLabel,px(10));
    
    
    superMsgViewH = CGRectGetMaxY(self.headLabel.frame)+px(100);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
    
}
@end
