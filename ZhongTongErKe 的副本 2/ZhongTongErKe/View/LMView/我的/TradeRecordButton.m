//
//  TradeRecordButton.m
//  医生端
//
//  Created by 徐风 on 17/6/23.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "TradeRecordButton.h"
#import "JF_CalendarTools.h"
@interface  TradeRecordButton ()

@property (nonatomic, strong) UIImageView  *downImageView;



@end
@implementation TradeRecordButton

-(id)initWithFrame:(CGRect)frame
{
    if (self =  [super initWithFrame:frame]) {
        
        self.backgroundColor = cHBColor;

        self.yearLabel = [UILabel addLabelWithText:[NSString stringWithFormat:@"%d",[JF_CalendarTools getYear]] AndFont:Font15 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"e9e9e9"]];
        [self addSubview: self.yearLabel];
        
        self.yearLabel.sd_layout.leftSpaceToView(self,px(74)).rightSpaceToView(self,0).heightIs(Font15).topSpaceToView(self,px(10));
       
    
        self.monthLabel = [UILabel addLabelWithText:[NSString stringWithFormat:@"%d%d",[JF_CalendarTools getMonth]/10,[JF_CalendarTools getMonth]] AndFont:Font24 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"ffffff"]];
        [self addSubview: self.monthLabel];
        self.monthLabel.sd_layout.leftSpaceToView(self,px(70)).topSpaceToView(self.yearLabel,px(10)).heightIs(Font24).widthIs(px(60));
        
        UILabel *unitMLabel = [UILabel addLabelWithText:@"月" AndFont:Font24 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"ffffff"]];
        [self addSubview:unitMLabel];
        unitMLabel.sd_layout.widthIs([NSString backSizeWithText:unitMLabel.text andFont:font(Font24)].width).heightIs(Font24).centerYEqualToView( self.monthLabel).leftSpaceToView(self.monthLabel,0);
        
        self.downImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:whitedownIconImageName]];
        [self addSubview:self.downImageView];
        self.downImageView.sd_layout.widthIs(self.downImageView.image.size.width).heightIs(self.downImageView.image.size.height).leftSpaceToView(unitMLabel,px(20)).centerYEqualToView( self.monthLabel);
    
    }
    return self;
}

@end
