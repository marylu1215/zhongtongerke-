//
//  SSDocDeailHeader.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/13.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSDocDeailHeader.h"


@interface SSDocDeailHeader ()

@property (nonatomic,strong) UIImageView *headImageview;
@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UILabel *describeLabel;
@property (nonatomic,strong) UILabel *hospitalLel;
@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic,strong) UILabel *tagLabel1;
@property (nonatomic,strong) UILabel *tagLabel2;
@property (nonatomic,strong) UILabel *tagLabel3;
@property (nonatomic,strong) UILabel *medicalEduLabel;
@property (nonatomic,strong) UILabel *collegeLabel;
@property (nonatomic,strong) UILabel *MALabel;
@property (nonatomic,strong) UILabel *academicLabel;
@property (nonatomic,strong) UILabel *academicDetailLabel;
@property (nonatomic,strong)  UIView *line1;
@property (nonatomic,strong)  UIView *line2;
@property (nonatomic,strong)  UIView *bottomSeparator;
@property (nonatomic ,strong) UIView *tagView;

@end

@implementation SSDocDeailHeader

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
    
    [self addSubview:self.bgImageview];
    
    self.headImageview = [[UIImageView alloc]init];
    self.headImageview.layer.cornerRadius = px(120)/6;
    self.bgImageview.clipsToBounds = YES;
    [self.bgImageview addSubview:self.headImageview];
    
    self.headLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.bgImageview addSubview: self.headLabel];
    
    self.describeLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.bgImageview addSubview: self.describeLabel];
    
    self.hospitalLel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.bgImageview addSubview:self.hospitalLel];
    
    self.detailLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    self.detailLabel.numberOfLines =0;
    [self.bgImageview addSubview:self.detailLabel];
    
    
    [self addSubview:self.detailLabel];
    [self addSubview:self.tagLabel1];
    [self addSubview:self.tagLabel2];
    [self addSubview:self.tagLabel3];
    [self addSubview:self.medicalEduLabel];
    [self addSubview:self.line1];
    [self addSubview:self.collegeLabel];
    [self addSubview:self.MALabel];
    [self addSubview:self.academicLabel];
    [self addSubview:self.line2];
    [self addSubview:self.academicDetailLabel];
    [self addSubview:self.bottomSeparator];
}

- (void)makeConstaits{
    __weak typeof(self) myself = self;
    [self.bgImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 351*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.headImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(74*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 60*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(74*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(80*kScreenWidthScale, 14*kScreenHeightScale));
        make.left.mas_equalTo(72*kScreenWidthScale);
        
    }];
    [self.describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(95*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(72*kScreenWidthScale);
        
    }];
    [self.hospitalLel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(112*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(72*kScreenWidthScale);
        
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.hospitalLel.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(290*kScreenWidthScale, 40*kScreenHeightScale));
        make.left.mas_equalTo(72*kScreenWidthScale);
        
    }];
    [self.tagLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.detailLabel.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(73*kScreenWidthScale);
    }];
    [self.tagLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.detailLabel.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(138*kScreenWidthScale);
    }];
    [self.tagLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.detailLabel.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(203*kScreenWidthScale);
    }];
    [self.medicalEduLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.tagLabel3.mas_bottom).with.offset(17*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(9*kScreenWidthScale);
    }];
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.medicalEduLabel.mas_bottom).with.offset(6*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.collegeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.line1.mas_bottom).with.offset(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.MALabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.collegeLabel.mas_bottom).with.offset(6*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.academicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.MALabel.mas_bottom).with.offset(9*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.academicLabel.mas_bottom).with.offset(6*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.academicDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.line2.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(352*kScreenWidthScale, 68*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.bottomSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.academicDetailLabel.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    
}


- (LMImageView *)bgImageview{
    if (!_bgImageview) {
        
        UIImage *bgImage = [UIImage imageNamed:docDetail_bg];
        _bgImageview = [[LMImageView alloc]initWithFrame:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
        
        _bgImageview.image = bgImage;
        
    }
    return _bgImageview;
}
- (UIImageView *)headImageview{
    if (!_headImageview) {
        _headImageview = [[UIImageView alloc]init];
        
    }
    return _headImageview;
}
- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.textColor = TITLE_COLOR;
        _headLabel.font = [UIFont systemFontOfSize:14*kScreenHeightScale];
    }
    return _headLabel;
}
- (UILabel *)describeLabel{
    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc]init];
        _describeLabel.textColor = TITLE_COLOR;
        _describeLabel.font = [UIFont systemFontOfSize:11*kScreenHeightScale];
    }
    return _describeLabel;
}
- (UILabel *)hospitalLel{
    if (!_hospitalLel) {
        _hospitalLel = [[UILabel alloc]init];
        _hospitalLel.textColor = TITLE_COLOR;
        _hospitalLel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
    }
    return _hospitalLel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _detailLabel.textColor = TITLE_COLOR;
        _detailLabel.numberOfLines = 2;
    }
    return _detailLabel;
}
- (UILabel *)tagLabel1{
    if (!_tagLabel1) {
        _tagLabel1 = [[UILabel alloc]init];
        _tagLabel1.textColor = MAIN_COLOR;
        _tagLabel1.font = [UIFont systemFontOfSize:11*kScreenHeightScale];
        _tagLabel1.textAlignment = NSTextAlignmentCenter;
        _tagLabel1.backgroundColor = [UIColor whiteColor];
    }
    return _tagLabel1;
}- (UILabel *)tagLabel2{
    if (!_tagLabel2) {
        _tagLabel2 = [[UILabel alloc]init];
        _tagLabel2.textColor = MAIN_COLOR;
        _tagLabel2.font = [UIFont systemFontOfSize:11*kScreenHeightScale];
        _tagLabel2.textAlignment = NSTextAlignmentCenter;
        _tagLabel2.backgroundColor = [UIColor whiteColor];
    }
    return _tagLabel2;
}
- (UILabel *)tagLabel3{
    if (!_tagLabel3) {
        _tagLabel3 = [[UILabel alloc]init];
        _tagLabel3.textColor = MAIN_COLOR;
        _tagLabel3.font = [UIFont systemFontOfSize:11*kScreenHeightScale];
        _tagLabel3.textAlignment = NSTextAlignmentCenter;
        _tagLabel3.backgroundColor = [UIColor whiteColor];
    }
    return _tagLabel3;
}
- (UILabel *)medicalEduLabel{
    if (!_medicalEduLabel) {
        _medicalEduLabel = [[UILabel alloc]init];
        _medicalEduLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _medicalEduLabel.textColor = [UIColor whiteColor];
    }
    return _medicalEduLabel;
}
- (UIView *)line1{
    if (!_line1) {
        _line1 = [[UIView alloc]init];
        _line1.backgroundColor = [UIColor whiteColor];
    }
    return _line1;
}
- (UIView *)line2{
    if (!_line2) {
        _line2 = [[UIView alloc]init];
        _line2.backgroundColor = [UIColor whiteColor];
    }
    return _line2;
}
- (UILabel *)collegeLabel{
    if (!_collegeLabel) {
        _collegeLabel = [[UILabel alloc]init];
        _collegeLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _collegeLabel.textColor = TITLE_COLOR;
    }
    return _collegeLabel;
}
- (UILabel *)MALabel{
    if (!_MALabel) {
        _MALabel = [[UILabel alloc]init];
        _MALabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _MALabel.textColor = TITLE_COLOR;
    }
    return _MALabel;
}
- (UILabel *)academicLabel{
    if (!_academicLabel) {
        _academicLabel = [[UILabel alloc]init];
        _academicLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _academicLabel.textColor = [UIColor whiteColor];
    }
    return _academicLabel;
}
- (UILabel *)academicDetailLabel{
    if (!_academicDetailLabel) {
        _academicDetailLabel = [[UILabel alloc]init];
        _academicDetailLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _academicDetailLabel.textColor = TITLE_COLOR;
        _academicDetailLabel.numberOfLines = 0;
    }
    return _academicDetailLabel;
}
- (UIView *)bottomSeparator{
    if (!_bottomSeparator) {
        _bottomSeparator = [[UIView alloc]init];
        _bottomSeparator.backgroundColor = BACKGROUND_COLOR;
    }
    return _bottomSeparator;
}

-(void)setDoctor:(Doctor *)doctor

{
    [self.headImageview sd_setImageWithURL:[NSURL URLWithString: [doctor.head containsString:@"http"]?doctor.head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,doctor.head]] placeholderImage:[UIImage imageNamed:@"1"]];
    self.headImageview.layer.cornerRadius = px(120)/2;
    self.headImageview.clipsToBounds = YES;
    
    self.headLabel.text = doctor.name;
    self.describeLabel.text = [NSString stringWithFormat:@"%@ %@",doctor.department,doctor.title];
    self.hospitalLel.text = doctor.ssyy;
    self.detailLabel.text = [NSString stringWithFormat:@"擅长:%@",doctor.specialty];
    self.tagLabel1.text = [NSString stringWithFormat:@"%@经验",doctor.experience] ;
    
    self.tagLabel2.text = @"三甲医院";
    self.tagLabel3.text = @"回复及时";
    self.medicalEduLabel.text = @"医学教育背景";
    
    self.collegeLabel.text = doctor.university;
    self.MALabel.text = doctor.master;
    self.academicLabel.text = @"学术研究成果及荣获情况";
    self.academicDetailLabel.text = doctor.research;
}

@end
