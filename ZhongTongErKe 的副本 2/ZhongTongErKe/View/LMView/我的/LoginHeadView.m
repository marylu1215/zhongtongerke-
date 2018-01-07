//
//  LoginHeadView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/15.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "LoginHeadView.h"
#import "UserTool.h"

@implementation LoginHeadView

-(id)init
{
    if (self = [super init]) {
        
        UIImage *iconImage = [UIImage imageNamed:userIconImageName];
        UIImageView *iconImageView = [[UIImageView alloc]init];
        iconImageView.frame = CGRectMake((kScreenWidth-iconImage.size.width)/2.0, 0, iconImage.size.width, iconImage.size.height);
        [self  addSubview:iconImageView];
        
//        [iconImageView sd_setImageWithURL: [NSURL URLWithString:[[UserTool user].head  containsString:@"http"]? [UserTool user].head:[NSString stringWithFormat:@"%@%@",ImageBaseURL, [UserTool user].head]]  placeholderImage:iconImage];
        
        [iconImageView sd_setImageWithURL:[UserTool user].head placeholderImage:iconImage];
        
        
        UILabel *nameLabel = [UILabel addLabelWithText:@"中童儿科" AndFont:Font15 AndAlpha:1.0 AndColor:c255255255];
        [self addSubview:nameLabel];
        nameLabel.sd_layout.widthIs([NSString backSizeWithText:nameLabel.text andFont:font(Font15)].width).heightIs(Font15).centerXEqualToView(iconImageView).topSpaceToView(iconImageView,px(10));
        
        CGFloat superMsgViewH = 0;
        superMsgViewH = iconImage.size.height+px(10)+Font15;
        
        CGRect bounds = self.bounds;
        bounds.size.height = superMsgViewH;
        self.bounds=bounds;

    }
    
    return self;
}

@end
