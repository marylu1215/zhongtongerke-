//
//  MsgSetTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/1.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define MsgSetTableViewCellIdentifier @"MsgSetTableViewCellIdentifier"

#import "MsgSetTableViewCell.h"

@interface MsgSetTableViewCell ()
@property (nonatomic ,strong)  UILabel *leftTitleLable;
@property (nonatomic ,strong)  UIButton *switchBtn;

@end
@implementation MsgSetTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = MsgSetTableViewCellIdentifier;
    MsgSetTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MsgSetTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
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


-(void)prepareUI
{
    self.leftTitleLable = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.leftTitleLable];
    
    self.switchBtn = [UIButton addStatusImage:[UIImage imageNamed:messageNotificationImageName] WithTarget:self action:@selector(switchAction:)];
    [self.switchBtn setImage:[UIImage imageNamed:garySwicthImageName] forState:UIControlStateSelected];
    
    [self.contentView addSubview:self.switchBtn];
    
}
-(void)configueFrame
{
    self.switchBtn.sd_layout.widthIs( self.switchBtn.imageView.image.size.width).heightIs(self.switchBtn.imageView.image.size.height).centerYEqualToView(self.contentView).rightSpaceToView(self.contentView,px(30));
    
    self.leftTitleLable.sd_layout.leftSpaceToView(self.contentView,px(30)).rightSpaceToView( self.switchBtn,0).heightIs(12).centerYEqualToView(self.contentView);
}


- (void)switchAction:(UIButton *)btn
{
   
    UIButton *switchButton = (UIButton *)btn;
    switchButton.selected = !switchButton.selected;
    
    BOOL isOF;
    
    if(btn.selected == YES){
        isOF = NO;
    }
    else{
        
        isOF = YES;
    }
    
    if (self.switchActionBlock) {
        self.switchActionBlock(isOF,switchButton);
    }
}
-(void)setLeftStr:(NSString *)leftStr
{
    self.leftTitleLable.text = leftStr;
}

@end
