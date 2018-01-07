//
//  ResultTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define ResultTableViewCellIdentifier @"ResultTableViewCellIdentifier"

#import "ResultTableViewCell.h"

@interface ResultTableViewCell ()

@property (nonatomic ,strong) UILabel *titleLabel;

@property (nonatomic ,strong) UIButton *deleButton;


@end
@implementation ResultTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
   static NSString *ID =ResultTableViewCellIdentifier;
   ResultTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ResultTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
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
    
    self.titleLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview: self.titleLabel];
    
    self.deleButton = [UIButton addBtnImage:crossImageName WithTarget:self action:@selector(deleAction)];
    [self.contentView addSubview: self.deleButton];
    
    
}
-(void)configueFrame
{
    self.deleButton.sd_layout.widthIs(self.deleButton.imageView.image.size.width).heightIs(self.deleButton.imageView.image.size.height).rightSpaceToView(self.contentView,px(30)).centerYEqualToView( self.deleButton);
    
    self.titleLabel.sd_layout.leftSpaceToView(self.contentView,px(30)).rightSpaceToView(self. self.deleButton,0).heightIs(15).centerYEqualToView( self.deleButton);
}


-(void)deleAction
{
    if (self.deleteBlock) {
        
        self.deleteBlock();
    }
}

-(void)setTitleStr:(NSString *)titleStr
{
    self.titleLabel.text = titleStr;
}
@end
