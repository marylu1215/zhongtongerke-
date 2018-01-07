//
//  CombOptionTableCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define CombOptionTableCellIdentifier @"CombOptionTableCellIdentifier"

#import "CombOptionTableCell.h"
#import "SeverVice.h"
#import "PayButton.h"

@interface  CombOptionTableCell()
@property (nonatomic ,strong) NSMutableArray *btnMutableArray;

@property (nonatomic ,strong) UILabel *dateTipLabel;
@property (nonatomic ,strong) UILabel *joPayLabel;
@property (nonatomic ,strong) UIView *severTypeView;
@property (nonatomic ,strong) PayButton *button;


@end
@implementation CombOptionTableCell

-(NSMutableArray *)btnMutableArray
{
    if (!_btnMutableArray) {
        
        _btnMutableArray = [NSMutableArray new];
    }
    return _btnMutableArray;
}
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    CombOptionTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CombOptionTableCellIdentifier];
    if (cell == nil) {
        
        cell = [[CombOptionTableCell   alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CombOptionTableCellIdentifier];
    }
    return cell;
    
}



-(void)configUI
{
    self.severTypeView = [[UIView alloc]init];
    [self.contentView addSubview:self.severTypeView];
   
    self.dateTipLabel = [UILabel addLabelWithText:@"服务到期时间" AndFont: Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
 
    [self.contentView addSubview: self.dateTipLabel];
    
    self.timeLable = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    self.timeLable.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.timeLable];
    
    self.joPayLabel = [UILabel addLabelWithText:@"共需支付" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.joPayLabel];
    
    self.priceLable = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cGrayWord];
    self.priceLable.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.priceLable];
    
    
}
-(void)setSeverViceArray:(NSArray *)severViceArray
{
    _severViceArray = severViceArray;
    //列
    int totalloc = 2;
    CGFloat btnWidth = px(300)*kScreenWidthScale;
    CGFloat btnHeight = px(50);
   
    CGFloat btnX = 0;
    CGFloat btnY = px(44);
    
    
    NSArray *typeArray = @[@"一周",@"一个月",@"三个月"];
    
    for (int i = 0; i < severViceArray.count; i++) {
       
        // 行号
        int row = i / totalloc;
        // 列号
        int col = i % totalloc;
        
        btnX = px(50) + (px(50)+ btnWidth) * col;
        btnY = (px(50) + btnHeight) * row;
        UIButton *verButton = [UIButton addBtnWithTitle:  [NSString stringWithFormat:@"%@(%@元)",typeArray[i],severViceArray[i]] WithBGImg:nil WithFont:Font13 WithTitleColor:TITLE_COLOR Target:self Action:@selector(btnclick:)];
         [verButton setTitleColor:cHBColor forState:UIControlStateDisabled];
        verButton.layer.cornerRadius = 6;
        verButton.clipsToBounds = YES;
        verButton.layer.borderWidth = px(2);
        verButton.layer.borderColor =cGrayWord.CGColor;
        verButton.tag = i;
        verButton.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        [self.severTypeView addSubview: verButton];
        [self.btnMutableArray addObject: verButton];
        
        if (i == 0) {
            
        verButton.enabled = NO;
        self.selectButton = verButton;
        self.selectButton.layer.borderColor = cHBColor.CGColor;
        self.priceLable.text = severViceArray[0];
        self.timeLable.text = [NSString computeDateWithDays:7];
        }

        self.severTypeView.frame = CGRectMake(0, 0, kScreenWidth, CGRectGetMaxY(self.severTypeView.subviews.lastObject.frame));
        
        self.dateTipLabel.sd_layout.widthIs([NSString backSizeWithText: self.dateTipLabel.text andFont:font(Font13)].width).heightIs(13).topSpaceToView( self.severTypeView,px(60)).leftSpaceToView(self.contentView,px(20));
        self.timeLable.sd_layout.leftSpaceToView( self.dateTipLabel,0).rightSpaceToView(self.contentView,px(30)).heightIs(Font13).centerYEqualToView( self.dateTipLabel);
        
        self.joPayLabel.sd_layout.widthIs([NSString backSizeWithText:  self.joPayLabel.text andFont:font(Font13)].width).heightIs(13).topSpaceToView( self.dateTipLabel,px(50)).leftSpaceToView(self.contentView,px(20));
          self.priceLable.sd_layout.leftSpaceToView(self.joPayLabel,0).rightSpaceToView(self.contentView,px(30)).heightIs(Font13).centerYEqualToView(self.joPayLabel);
        
        
        CGFloat superMsgViewH = 0;
        superMsgViewH = CGRectGetMaxY(self.severTypeView.subviews.lastObject.frame)+px(160)+px(130);
        CGRect bounds = self.bounds;
        bounds.size.height = superMsgViewH;
        self.bounds=bounds;
    }

}
-(void)btnclick:(UIButton *)button
{
    self.selectButton.enabled = YES;
    button.enabled = NO;
    self.selectButton = button;
    for (UIButton *btn in self.btnMutableArray) {
        
        btn.layer.borderColor = cGrayWord.CGColor;
    }
    self.selectButton.layer.borderColor =cHBColor.CGColor;
    
    self.priceLable.text = _severViceArray[button.tag];
    
    switch (button.tag) {
        case 0:
            self.timeLable.text = [NSString computeDateWithDays:7];
            break;
        case 1:
            self.timeLable.text = [NSString computeDateWithDays:30];
            break;
        case 2:
            self.timeLable.text = [NSString computeDateWithDays:90];
            break;
            
        default:
            break;
    }
}

@end
