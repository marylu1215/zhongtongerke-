//
//  AnwserTableCell.m
//  ZhongTongErKe
//
//  Created by l m on 2017/7/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define AnwserTableCellIdentifier  @"AnwserTableCellIdentifier"

#import "AnwserTableCell.h"

@interface AnwserTableCell ()

@property (nonatomic ,strong) UILabel *answerLabel;


@end
@implementation AnwserTableCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    
   AnwserTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:AnwserTableCellIdentifier];
    if (cell == nil) {
        cell = [[AnwserTableCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AnwserTableCellIdentifier];
    }
    
    return cell;
}

-(void)configUI
{
    self.backgroundColor = c255255255;
    
    self.answerLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    self.answerLabel.numberOfLines =0;
    [self.contentView addSubview:self.answerLabel];
    
}

-(void)setSubject:(Subject *)subject
{
    
    CGFloat superMsgViewH = 0;
    self.answerLabel.text = subject.answer;
    NSDictionary *descDic = @{NSFontAttributeName:font(12)};
    CGRect descFrame =  [ self.answerLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(60), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(30);
    descFrame.origin.y = px(50);
    self.answerLabel.frame = descFrame;

    superMsgViewH = CGRectGetMaxY(self.answerLabel.frame);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
    
}


@end
