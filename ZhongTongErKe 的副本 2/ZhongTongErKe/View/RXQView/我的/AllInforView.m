//
//  AllInforView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "AllInforView.h"

@interface AllInforView ()

@property (nonatomic ,strong) NSMutableArray *rigthLabelMutableArray;

@end


@implementation AllInforView

-(NSMutableArray *)rigthLabelMutableArray
{
    if (!_rigthLabelMutableArray) {
        
        _rigthLabelMutableArray = [NSMutableArray new];
    }
    return _rigthLabelMutableArray;
}
-(instancetype)initWithTitle:(NSString *)title SubTitle:(NSString *)SubTitle LeftArr:(NSArray *)LeftArr 
{
    if (self = [super init]) {
        
        UILabel *headLabel = [UILabel addLabelWithText:title AndFont:15 AndAlpha:1.0 AndColor:cHBColor];
        headLabel.frame = CGRectMake(px(30), px(20), kScreenWidth-px(30), 15);
        [self addSubview:headLabel];
        
        
        UILabel *subLabel = [UILabel addLabelWithText:SubTitle AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self addSubview:subLabel];
        
        if (SubTitle.length) {
            
            
            subLabel.frame = CGRectMake(px(30), CGRectGetMaxY(headLabel.frame)+px(20), kScreenWidth-px(30), 12);
        }
        
        CGFloat conY = SubTitle.length ?(CGRectGetMaxY( subLabel.frame)+px(40)):(CGRectGetMaxY(headLabel.frame)+px(40));
        
        for (int index=0; index<LeftArr.count; index++) {
        
            UILabel *leConLabel = [UILabel addLabelWithText:LeftArr[index] AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
            leConLabel.frame = CGRectMake(px(30), conY+index*(12+px(22)), [NSString backSizeWithText:leConLabel.text andFont:font(12)].width, 12);
            [self addSubview:leConLabel];
            
            
            UILabel *riConLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cHBColor];
            riConLabel.frame = CGRectMake(CGRectGetMaxX(leConLabel.frame), conY+index*(12+px(22)), kScreenWidth-CGRectGetMaxX(leConLabel.frame), 12);
            [self addSubview:riConLabel];
            
            [self.rigthLabelMutableArray addObject: riConLabel];
        }
    }
    
    return self;
}

-(void)setRightArr:(NSArray *)rightArr
{
    _rightArr = rightArr;
    
    for (int index=0; index<rightArr.count; index++) {
        
        UILabel *label = self.rigthLabelMutableArray[index];
        label.text = rightArr[index];
    }
}
@end
