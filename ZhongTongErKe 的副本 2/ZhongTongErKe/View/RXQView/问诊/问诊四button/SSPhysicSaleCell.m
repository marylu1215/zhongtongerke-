//
//  SSPhysicSaleCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/23.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define SSPhysicSaleCellIdentifier @"SSPhysicSaleCellIdentifier"
#import "SSPhysicSaleCell.h"

@interface SSPhysicSaleCell ()

@property (nonatomic,strong) UIImageView *headImageView;

@end

@implementation SSPhysicSaleCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
   SSPhysicSaleCell *cell = [tableView dequeueReusableCellWithIdentifier:SSPhysicSaleCellIdentifier];
    if (!cell) {
        cell = [[SSPhysicSaleCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:SSPhysicSaleCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
      
        self.headImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.headImageView];
        self.headImageView.sd_layout.widthIs(kScreenWidth).topSpaceToView(self.contentView,0).bottomSpaceToView(self.contentView,0);
    }
    return self;
}

-(void)setActivitieTheme:(ActivitieTheme *)activitieTheme
{
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImageBaseURL,activitieTheme.img]] placeholderImage:[UIImage imageNamed:activityImageName]];
}


@end
