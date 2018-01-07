//
//  PostDetailTableCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/6.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define PostDetailTableCellIdentifier @"PostDetailTableCellIdentifier"
#import "PostDetailTableCell.h"

@interface PostDetailTableCell ()

@property (nonatomic ,strong) UIImageView *headImageView;
@property (nonatomic ,strong) UILabel *nameLabel;
@property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UIImageView *bottomLine;

@end
@implementation PostDetailTableCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
   
    PostDetailTableCell *cell = [tableView dequeueReusableCellWithIdentifier:PostDetailTableCellIdentifier];
    if (!cell) {
        cell = [[PostDetailTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:PostDetailTableCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}



-(void)configUI{
    
   
    self.headImageView = [[UIImageView alloc]init];
    [self.contentView  addSubview:self.headImageView];
    
    self.nameLabel = [UILabel  addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.nameLabel];
    
    self.contentLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.contentLabel];
    
    self.bottomLine = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.contentView addSubview: self.bottomLine];
    

}
-(void)setInvitation:(Invitation *)invitation
{
    _invitation = invitation;
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:invitation.head] placeholderImage:[UIImage imageNamed:headPortraitImageName]];
    
    self.headImageView.sd_layout.widthIs(px(50)).heightIs(px(50)).topSpaceToView(self.contentView,px(20)).leftSpaceToView(self.contentView,px(82));
    
    self.nameLabel.text = invitation.username;
    self.nameLabel.sd_layout.widthIs([NSString backSizeWithText:self.nameLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView( self.headImageView,px(10)).topSpaceToView(self.contentView,px(36));

    CGFloat  superMsgViewH  =0;
    self.contentLabel.text = invitation.comment_content;
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13)};
    CGRect descFrame =  [self.contentLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(176), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(146);
    descFrame.origin.y = px(88);
    self.contentLabel.frame = descFrame;
    
    self.bottomLine.sd_layout.widthIs(kScreenWidth)
    .heightIs(px(2)).bottomSpaceToView(self.contentView,0);
    superMsgViewH = CGRectGetMaxY(self.contentLabel.frame)+px(20);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;

}


@end
