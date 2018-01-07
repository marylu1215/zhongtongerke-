//
//  LMMessageCell.m
//  LMNYHealth
//
//  Created by lm on 26/2/16.
//  Copyright © 2016年 LM. All rights reserved.
//
#define MAX_WIDTH_OF_TEXT   self.frame.size.width-40 //文字宽度限制
#define kWIDTH  [UIScreen mainScreen].bounds.size.width
#import "LMMessageCell.h"

@interface LMMessageCell ()
@end
@implementation LMMessageCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"message";
    LMMessageCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[  LMMessageCell  alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.userInteractionEnabled=YES;
        
        self.timeLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:c255255255];
        self.timeLabel.backgroundColor = [UIColor colorWithHexString:@"aaaaaa"];
        self.timeLabel.layer.cornerRadius =6;
        self.timeLabel.clipsToBounds = YES;
        self.timeLabel.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:self.timeLabel];
        
        //分割线1
      
        self.messageView=[[UIView alloc]init];
        self.messageView.backgroundColor=c255255255;
        [self.contentView addSubview:self.messageView];
        
        self.titlteLabel=[UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self.messageView addSubview:self.titlteLabel];
 
        
        self.contetLabel=[[UILabel alloc]init];
        self.contetLabel.numberOfLines=0;
        self.contetLabel.textColor= cGrayWord;
        self.contetLabel.font=[UIFont systemFontOfSize:15];
         [self.messageView addSubview:self.contetLabel];
        
     
    }
    return self;
}
-(void)setMessage:(LMMEssage *)message
{
    _message=message;
    
    self.timeLabel.text = [NSString timeIntervalWithDataStr:message.date];

    self.timeLabel.sd_layout.topSpaceToView(self.contentView,px(20)).widthIs([NSString backSizeWithText: self.timeLabel.text andFont:font(12)].width+5).heightIs(15).centerXEqualToView(self);

    self.contetLabel.text=message.des;
    self.contetLabel.textAlignment=NSTextAlignmentLeft;
    CGRect textOfRect = [self.contetLabel textRectForBounds:CGRectMake(0, 0, MAX_WIDTH_OF_TEXT, MAXFLOAT) limitedToNumberOfLines:0];
    //根据label的计算出的高度，来定义label的frame
    CGRect frameOfLabel = CGRectZero;
    frameOfLabel.size = textOfRect.size;
    frameOfLabel.origin.x = px(30);
    
    self.contetLabel.frame = frameOfLabel;

    
    //计算】输入框的frame
    CGRect frameOfPop = frameOfLabel;
    frameOfPop.origin.x -= 20;
    frameOfPop.origin.y = CGRectGetMaxY(self.timeLabel.frame)+15;
    frameOfPop.size.width += 20;
    frameOfPop.size.height +=78;
    
    self.messageView.sd_layout.topSpaceToView(self.timeLabel,px(30)).heightIs(frameOfPop.size.height).leftSpaceToView(self.contentView,0).rightSpaceToView(self.contentView,0);
    
    self.titlteLabel.text=message.title;
    CGSize titlteLabelSize=[self.titlteLabel.text sizeWithFont:font(15)];
   
    self.titlteLabel.sd_layout.widthIs(titlteLabelSize.width).heightIs(15).leftSpaceToView(self.messageView,px(30)).topSpaceToView(self.messageView,20);
    self.contetLabel.sd_layout.topSpaceToView(self.titlteLabel,px(30)).heightIs( frameOfLabel.size.height).bottomSpaceToView(self.messageView,20).rightSpaceToView(self.messageView,20).leftSpaceToView(self.messageView,px(30)).centerXEqualToView(self.messageView);
    //设定单元格的bounds
    CGRect bounds = self.bounds;
    bounds.size.height = frameOfPop.size.height+px(80);
    
    self.bounds=bounds;
    

}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    UIView *view = [[UIView alloc]init];
    view.backgroundColor= cGrayWord;
    self.selectedBackgroundView=view;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor=cGrayWord;
    self.selectedBackgroundView=view;
    
}

@end
