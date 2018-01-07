//
//  SSTableCellButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/3.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSTableCellButton.h"

@implementation SSTableCellButton

- (instancetype)initWithImageName:(NSString *)imageName
{
    
    if (self = [super init]) {
        
        self.headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        [self addSubview:self.headImageView];
        
         self.headImageView.sd_layout.widthIs(self.headImageView.image.size.width).heightIs(self.headImageView.image.size.height).centerYEqualToView(self).leftSpaceToView(self,0);
        
        
        self.headlabel = [UILabel addLabelWithText:@"" AndFont:Font9 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self addSubview:self.headlabel];

        self.headlabel.sd_layout.rightSpaceToView(self,0).leftSpaceToView( self.headImageView,px(10)).centerYEqualToView(self).heightIs(Font9);
     
    }
    return self;
}




@end
