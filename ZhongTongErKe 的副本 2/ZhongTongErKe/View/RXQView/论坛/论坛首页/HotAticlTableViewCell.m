//
//  HotAticlTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define HotAticlTableViewCellIdentifier @"HotAticlTableViewCellIdentifier"

#import "HotAticlTableViewCell.h"

@interface  HotAticlTableViewCell ()

@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic ,strong) UIImageView *stickImageView;//置顶
@property (nonatomic ,strong) UIImageView *essenceImageView;//精华
@property (nonatomic ,strong) UIImageView *adminImageView;
@property (nonatomic ,strong) UILabel *adminLabel;
@property (nonatomic ,strong) UIImageView *msgImageView;
@property (nonatomic ,strong) UILabel *msgLabel;
@property (nonatomic ,strong) UIImageView *timeImageView;
@property (nonatomic ,strong) UILabel *timeLabel;

@end

@implementation HotAticlTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
   
    static NSString *ID =  HotAticlTableViewCellIdentifier;
   HotAticlTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HotAticlTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
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


-(void)prepareUI{
    
    self.stickImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:ltTopImageName]];
    self.stickImageView.hidden = YES;
    [self.contentView addSubview:self.stickImageView];
    
    self.essenceImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:essenceImageName]];
    self.essenceImageView.hidden = YES;
    [self.contentView addSubview: self.essenceImageView];
    
    self.titleLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview: self.titleLabel];
    
    self.adminImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:adminImageName]];
    [self.contentView addSubview: self.adminImageView];
    
    self.adminLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.adminLabel];
    
    self.msgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:ltMassageImageName]];
    [self.contentView addSubview: self.msgImageView];
    
    self.msgLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview: self.msgLabel];
    
    self.timeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:ltTimeImageName]];
    [self.contentView addSubview:self.timeImageView];
    
    self.timeLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview: self.titleLabel];
    
    
}

-(void)configueFrame
{
    
}
-(void)setReNote:(ReNote *)reNote
{
    _reNote = reNote;
    
    self.titleLabel.text =  reNote.note.title;
    
    if ([reNote.stateArray containsObject:@"置顶"]) {
        self.stickImageView.sd_layout.widthIs(self.stickImageView.image.size.width).heightIs(self.stickImageView.image.size.height).leftSpaceToView(self.contentView ,px(30)).topSpaceToView(self.contentView ,px(20));
        if ([reNote.stateArray containsObject:@"精华"]) {
             self.essenceImageView.sd_layout.widthIs(self.essenceImageView.image.size.width).heightIs(self.essenceImageView.image.size.height).leftSpaceToView(self.essenceImageView ,px(10)).centerYEqualToView(self.stickImageView);
            
            self.titleLabel.sd_layout.leftSpaceToView(self.essenceImageView,px(10)).rightSpaceToView(self.contentView,0).centerYEqualToView(self.stickImageView).heightIs(12);
        }
        else
        {
             self.titleLabel.sd_layout.leftSpaceToView(self.stickImageView,px(10)).rightSpaceToView(self.contentView,0).centerYEqualToView(self.stickImageView).heightIs(12);
        }
        
    }
    
    else
    {
        if ([reNote.stateArray containsObject:@"精华"]) {
            
                self.essenceImageView.sd_layout.widthIs(self.stickImageView.image.size.width).heightIs(self.stickImageView.image.size.height).leftSpaceToView(self.contentView ,px(20)).topSpaceToView(self.contentView ,px(30));
            
             self.titleLabel.sd_layout.leftSpaceToView(self.essenceImageView,px(10)).rightSpaceToView(self.contentView,0).centerYEqualToView(self.stickImageView).heightIs(12);
        }
        else
        {
             self.titleLabel.sd_layout.leftSpaceToView(self.contentView,px(20)).rightSpaceToView(self.contentView,0).centerYEqualToView(self.stickImageView).heightIs(12);
        }
    }
    
    self.adminImageView.sd_layout.widthIs(self.adminImageView.image.size.width).heightIs(self.adminImageView.image.size.height).bottomSpaceToView(self.contentView,0).leftSpaceToView(self.contentView,px(30));
    
    self.adminLabel.text = reNote.note.user.username;
    self.adminLabel.sd_layout.widthIs([NSString backSizeWithText: self.adminLabel.text andFont:font(12)].width).heightIs(12).centerYEqualToView( self.adminImageView).leftSpaceToView(self.adminImageView,0);
    
    
    self.msgImageView.sd_layout.widthIs(self.msgImageView.image.size.width).heightIs( self.msgImageView.image.size.height).bottomSpaceToView(self.contentView,0).leftSpaceToView(self.contentView,px(282)*kScreenWidthScale);
    
    self.msgLabel.text = reNote.note.repNum;
    self.msgLabel.sd_layout.widthIs([NSString backSizeWithText: self.msgLabel.text andFont:font(12)].width).heightIs(12).centerYEqualToView( self.adminImageView).leftSpaceToView(self.msgLabel,0);

    self.timeLabel.text = [NSString timeIntervalWithDataStr:reNote.note.updaTime];
    self.timeLabel.sd_layout.widthIs([NSString backSizeWithText:self.timeLabel.text andFont:font(12)].width).heightIs(12).centerYEqualToView( self.adminImageView).rightSpaceToView(self.contentView,px(30));
    
    
    self.timeImageView.sd_layout.widthIs( self.timeImageView.image.size.width).heightIs( self.timeImageView.image.size.height).bottomSpaceToView(self.contentView,0).rightSpaceToView(self.timeLabel,px(10));
    
}
@end
