//
//  WonderfulAnswerCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define WonderfulAnswerCellIdentifier @"WonderfulAnswerCellIdentifier"

#import "WonderfulAnswerCell.h"
#import "DiffPostView.h"

@interface WonderfulAnswerCell ()

@property (nonatomic,strong) DiffPostView *diffPostView;

@property (nonatomic ,strong) UIImageView *headImageView;
@property (nonatomic ,strong) UILabel *telLabel;
@property (nonatomic ,strong) UILabel *desLabel;
@property (nonatomic ,strong) UIImageView *upVoteImageView;
@property (nonatomic ,strong) UILabel *upVoteLabel;
@property (nonatomic ,strong) UIImageView *timeImageView;
@property (nonatomic ,strong) UILabel *timeLabel;
@property (nonatomic ,strong) UIImageView *sepImageView;
@end

@implementation WonderfulAnswerCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = WonderfulAnswerCellIdentifier;
   WonderfulAnswerCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[WonderfulAnswerCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self prepareUI];
        [self configueFrame];
        
    }
    return self;
}

-(void)prepareUI
{
    
    self.headImageView = [[UIImageView alloc]init];
    self.headImageView.layer.cornerRadius = px(50)/20;
    self.headImageView.clipsToBounds = YES;
    [self.contentView addSubview: self.headImageView];
    
    self.telLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.telLabel];
    
    self.desLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview: self.desLabel];
    
    self.upVoteImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:ltPraiseImageName]];
    [self.contentView addSubview:self.upVoteImageView];
    
    self.upVoteLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview: self.upVoteLabel];
    
    self.timeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:ltTimeImageName]];
    [self.contentView addSubview:self.timeImageView];
    
    self.timeLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.timeLabel];
    
    self.sepImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor ];
    [self.contentView addSubview:self.sepImageView];
    
}

-(void)configueFrame
{
    self.headImageView.sd_layout.widthIs(px(50)).heightIs(px(50)).topSpaceToView(self.contentView ,px(60)).leftSpaceToView(self.contentView,px(20));
    self.telLabel.sd_layout.leftSpaceToView(self.headImageView,px(10)).rightSpaceToView(self.contentView,0).heightIs(12).centerYEqualToView( self.headImageView);
    
    self.sepImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.contentView,0);
}
-(void)setReplyNote:(ReplyNote *)replyNote
{
    _replyNote = replyNote;

    [self.diffPostView removeFromSuperview];
    
    self.diffPostView  = [[DiffPostView alloc]init];
    [self.contentView addSubview: self.diffPostView];
    self.diffPostView.replyNote = replyNote;
    self.diffPostView.sd_layout.widthIs(kScreenWidth).heightIs(px(30)).topSpaceToView(self.contentView,px(20));

    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:replyNote.head]placeholderImage:[UIImage imageNamed:@"1"]];
    
    self.desLabel.text = replyNote.comment_content;
    NSDictionary *descDic = @{NSFontAttributeName:font(12)};
    CGRect descFrame =  [self.desLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(50), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(20);
    descFrame.origin.y = px(124);
    self.desLabel.frame = descFrame;

    self.upVoteImageView.sd_layout.widthIs( self.upVoteImageView.image.size.width).heightIs(self.upVoteImageView.image.size.height).topSpaceToView( self.desLabel,px(56)).leftSpaceToView(self.contentView,px(30));
  
    
    self.upVoteLabel.text = [NSString stringWithFormat:@"%@赞",replyNote.comment_like_num];
    self.upVoteLabel.sd_layout.widthIs([NSString backSizeWithText: self.upVoteLabel.text andFont:font(12)].width).heightIs(12).centerYEqualToView(self.upVoteImageView).leftSpaceToView( self.upVoteImageView,px(10));

    
    NSString *createTimeStr = [NSString stringWithFormat:@"%lld",replyNote.upload_time];
    
    if (createTimeStr.length < 13) {
       replyNote.upload_time = replyNote.upload_time * 1000;
    }
    
    
    NSDate *date = [NSDate timeStringToDate:[NSString timeIntervalWithDataStr:[NSString stringWithFormat:@"%lld",replyNote.upload_time]]];
    self.timeLabel.text =  [NSString stringWithFormat:@"%@更新",[date dateToRequiredString]];
    
    self.timeLabel.sd_layout.widthIs([NSString backSizeWithText:self.timeLabel.text andFont:font(12)].width).heightIs(12).centerYEqualToView(self.upVoteImageView).rightSpaceToView(self.contentView,px(30));
    
    self.timeImageView.sd_layout.widthIs(self.timeImageView.image.size.width).heightIs(self.timeImageView.image.size.height).rightSpaceToView( self.timeLabel,px(10)).centerYEqualToView(self.upVoteImageView);
    
    CGFloat  superMsgViewH  =0;
   
    superMsgViewH = CGRectGetMaxY(self.desLabel.frame)+px(100);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;

    
}


@end
