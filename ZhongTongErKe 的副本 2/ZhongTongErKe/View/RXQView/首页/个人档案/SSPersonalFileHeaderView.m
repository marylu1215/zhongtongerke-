//
//  SSPersonalFileHeaderView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//
//
//  SSPersonalFileHeaderView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPersonalFileHeaderView.h"
#import "User.h"
#import "LMImageView.h"
#import "PersonInfoView.h"

@interface SSPersonalFileHeaderView ()

@property (nonatomic ,strong) PersonInfoView *infoView;


@end

@implementation SSPersonalFileHeaderView

- (instancetype)initWithFrame:(CGRect)frame

{
    if (self = [super initWithFrame: frame]) {
       
       _bgImageView = [[LMImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _bgImageView.image = [UIImage imageNamed:@"bgtwo"];
        [self addSubview:_bgImageView];
       
        UILabel *headLabel = [UILabel addLabelWithText:@"健康档案" AndFont:Font15 AndAlpha:1.0 AndColor:c255255255];
        [_bgImageView addSubview:headLabel];
        headLabel.sd_layout.widthIs([NSString backSizeWithText:headLabel.text andFont:font(Font15)].width).heightIs(Font15).centerXEqualToView(_bgImageView).centerYEqualToView(_bgImageView.arrowBtn);
        
        
        self.infoView  = [[PersonInfoView alloc]initWithFrame:CGRectMake((kScreenWidth-px(250))/2,CGRectGetMaxY(_bgImageView.arrowBtn.frame)+px(78), px(250), px(250))];
        [self addSubview:self.infoView];
        
        UIView *bottomSeparatorView = [[UIView alloc]init];
        bottomSeparatorView.backgroundColor =  BACKGROUND_COLOR;
        [self addSubview:bottomSeparatorView];
        bottomSeparatorView.sd_layout.widthIs(kScreenWidth).heightIs(px(20)).bottomSpaceToView(self,0);
    }
    return self;
}

-(void)setUser:(User *)user
{
    self.infoView.user = user;
    
}

@end
