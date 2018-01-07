//
//  SSHomeMemberTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHomeMemberTableCell.h"

@interface SSHomeMemberTableCell ()

@property (nonatomic,strong) UIImageView *sexImageView;
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UIImageView *line1;
@property (nonatomic,strong) UIImageView *line2;
@property (nonatomic,strong) UILabel *memberLabel;
@property (nonatomic,strong) UILabel *percentLabel;

@end

@implementation SSHomeMemberTableCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubViews];
        [self makeConstaits];
    }
    return self;
}
- (void)addSubViews{
 
    
    [self.contentView addSubview:self.sexImageView];
    [self.sexImageView addSubview:self.numLabel];
    [self.sexImageView addSubview:self.line1];
    [self.sexImageView addSubview:self.line2];
    [self.sexImageView addSubview:self.memberLabel];
    [self.sexImageView addSubview:self.percentLabel];
}

- (void)makeConstaits{

    self.sexImageView.sd_layout.leftSpaceToView(self.contentView,px(30)).rightSpaceToView(self.contentView,px(30)).topSpaceToView(self.contentView,px(10)).bottomSpaceToView(self.contentView,px(10));
    
}

- (UIImageView *)sexImageView{
    if (!_sexImageView) {
        _sexImageView = [[UIImageView alloc]init];
    }
    return _sexImageView;
}
- (UILabel *)numLabel{
    if (!_numLabel) {
        
        _numLabel = [UILabel labelWithText:@"" Font:Font13 Color:TITLE_COLOR Alignment:NSTextAlignmentCenter];
   
        
    }
    return _numLabel;
}
- (UIImageView *)line1{
    if (!_line1) {
        _line1 = [[UIImageView alloc]init];
        _line1.image = [UIImage imageNamed: healthTask_line];
    }
    return _line1;
}
- (UIImageView *)line2{
    if (!_line2) {
        _line2 = [[UIImageView alloc]init];
        _line2.image = [UIImage imageNamed:healthTask_line];
    }
    return _line2;
}
- (UILabel *)memberLabel{
    if (!_memberLabel) {
        _memberLabel = [UILabel labelWithText:@"" Font:Font13 Color:TITLE_COLOR Alignment:NSTextAlignmentCenter];
    }
    return _memberLabel;
}
- (UILabel *)percentLabel{
    if (!_percentLabel) {
        _percentLabel = [UILabel labelWithText:@"" Font:Font13 Color:REMARK_COLOR Alignment:NSTextAlignmentCenter];
    }
    return _percentLabel;
}

-(void)setGroup:(FamilyGroup *)group
{
    _group = group;
    
  
    
    if ([group.sex isEqualToString:@"女"]) {
       self.sexImageView.image = [UIImage imageNamed:basicFile_femalebg];
    }
    else
    {
        self.sexImageView.image = [UIImage imageNamed:basicFile_malebg]; 
    }
    
  self.numLabel.text = [NSString stringWithFormat:@"成员%@",[NSString translationArabicNum:group.sortNum]];
  
    self.memberLabel.text = group.nikename;
    self.percentLabel.text = @"已完善100%";
    
     self.numLabel.sd_layout.leftSpaceToView(self.sexImageView,px(60)).heightIs(Font13).centerYEqualToView(self.contentView).widthIs([NSString backSizeWithText: self.numLabel.text andFont:font(Font13)].width);
    
     self.percentLabel.sd_layout.rightSpaceToView(self.sexImageView,px(24)).widthIs([NSString backSizeWithText: self.percentLabel.text andFont:font(Font13)].width).topSpaceToView(self.sexImageView,0).bottomSpaceToView(self.sexImageView,0);
    
    self.memberLabel.sd_layout.leftSpaceToView(self.line1,0).rightSpaceToView(self.line2,0).topSpaceToView(self.sexImageView,0).bottomSpaceToView(self.sexImageView,0);
    
      self.line1.sd_layout.widthIs(px(2)).topSpaceToView(self.sexImageView,0).bottomSpaceToView(self.sexImageView,0).leftSpaceToView(self.numLabel,px(30));
    
       self.line2.sd_layout.widthIs(px(2)).rightSpaceToView(self.percentLabel,px(30)).topSpaceToView(self.sexImageView,0).bottomSpaceToView(self.sexImageView,0);
    
}





@end
