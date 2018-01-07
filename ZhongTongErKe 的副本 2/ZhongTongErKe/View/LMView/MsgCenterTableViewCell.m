
//
//  MsgCenterTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/26.
//  Copyright © 2017年 Claf. All rights reserved.
//


#define MsgCenterTableViewCellIdentifier @"MsgCenterTableViewCellIdentifier"

#import "MsgCenterTableViewCell.h"

@interface MsgCenterTableViewCell ()

@property (nonatomic ,strong) UIImageView *headImageView;

@property (nonatomic ,strong) UILabel *infoLabel;

@property (nonatomic ,strong) UIImageView *rightImageView;

@end

@implementation MsgCenterTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = MsgCenterTableViewCellIdentifier;
    MsgCenterTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ MsgCenterTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
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
   
    self.backgroundColor = BACKGROUND_COLOR;
    
    self.headImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.headImageView];
    
    self.rightImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:rightImageName]];
    [self.contentView addSubview:self.rightImageView];
    
    
    self.infoLabel = [UILabel labelWithText:@"" Font:12 Color:TITLE_COLOR Alignment:NSTextAlignmentLeft];
    [self.contentView addSubview:self.infoLabel];
}
-(void)configueFrame
{
      self.rightImageView.sd_layout.widthIs(self.rightImageView.image.size.width).heightIs(self.rightImageView.image.size.height).rightSpaceToView(self.contentView,px(20)).centerYEqualToView(self.contentView);
}
-(void)setMessage:(Message *)message
{
    _message = message;
    self.headImageView.image = [UIImage imageNamed:message.headInfo];
    
    self.headImageView.sd_layout.widthIs(self.headImageView.image.size.width).heightIs(self.headImageView.image.size.height).leftSpaceToView(self.contentView,px(20)).centerYEqualToView(self.contentView);
    
    self.infoLabel.text = message.info;
    
    self.infoLabel.sd_layout.widthIs([NSString backSizeWithText:self.infoLabel.text andFont:font(12)].width).heightIs([NSString backSizeWithText:self.infoLabel.text andFont:font(12)].height).centerYEqualToView(self.contentView).leftSpaceToView(self.headImageView,px(20));
}



@end
