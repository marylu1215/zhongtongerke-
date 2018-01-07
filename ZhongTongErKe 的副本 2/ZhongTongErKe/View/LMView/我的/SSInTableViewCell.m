//
//  SSInTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define SSInTableViewCellIdentifier @"SSInTableViewCellIdentifier"

#import "SSInTableViewCell.h"

@interface SSInTableViewCell ()

@property (nonatomic ,strong) UIImageView *rightImageView;

@end
@implementation SSInTableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = SSInTableViewCellIdentifier;
    SSInTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SSInTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
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
    
   
    self.headImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.headImageView];
    
    self.infoLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.infoLabel];
    
    self.rightImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:goImageName]];
    [self.contentView addSubview:self.rightImageView];
    
    
}
-(void)configueFrame
{
    self.headImageView.sd_layout.widthIs(px(30)).heightIs(px(30)).centerYEqualToView(self.contentView).leftSpaceToView(self.contentView,px(20));
    
    self.infoLabel.sd_layout.leftSpaceToView(self.headImageView,px(10)).centerYEqualToView(self.contentView).rightSpaceToView(self.contentView,0).heightIs(12);
    
    self.rightImageView.sd_layout.widthIs(self.rightImageView.image.size.width).heightIs(self.rightImageView.image.size.height).rightSpaceToView(self.contentView,px(20)).centerYEqualToView(self.contentView);
}
@end
