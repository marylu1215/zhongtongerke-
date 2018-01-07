//
//  SSHotDoctorButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHotDoctorButton.h"

@interface SSHotDoctorButton ()

@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *levelLabel;
@property (nonatomic,strong) UILabel *kindLabel;

@end
@implementation SSHotDoctorButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
    [self addSubview:self.headImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.levelLabel];
    [self addSubview:self.kindLabel];
}
- (void)makeConstaits{
   
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(65, 65));
        make.left.mas_equalTo(0);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70);
        make.size.mas_equalTo(CGSizeMake(65, 12));
        make.left.mas_equalTo(0);
    }];
    
    [self.levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(86);
        make.size.mas_equalTo(CGSizeMake(65, 12));
        make.left.mas_equalTo(0);
    }];
    
    [self.kindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(102);
        make.size.mas_equalTo(CGSizeMake(65, 12));
        make.left.mas_equalTo(0);
    }];
}


- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.layer.cornerRadius =px(130)/2;
        _headImageView.clipsToBounds =YES;
    }
    return _headImageView;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textColor = TITLE_COLOR;
        _nameLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}
- (UILabel *)levelLabel{
    if (!_levelLabel) {
        _levelLabel = [[UILabel alloc]init];
        _levelLabel.textColor = REMARK_COLOR;
        _levelLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _levelLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _levelLabel;
}
- (UILabel *)kindLabel{
    if (!_kindLabel) {
        _kindLabel = [[UILabel alloc]init];
        _kindLabel.textColor = REMARK_COLOR;
        _kindLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _kindLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _kindLabel;
}

-(void)setDoctor:(Doctor *)doctor
{
    _doctor = doctor;
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString: [doctor.head containsString:@"http"]?doctor.head:[NSString stringWithFormat:@"%@%@",ImageBaseURL, doctor.head]] placeholderImage:[UIImage imageNamed:@"1"]];
    
    self.nameLabel.text = doctor.name;
    
    self.levelLabel.text = doctor.title;
    
    self.kindLabel.text = doctor.department;
}
@end
