//
//  SSTaskDetailView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSTaskDetailView.h"

@implementation SSTaskDetailView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstraits];
    }
    return self;
}

- (void)addSubviews{
    [self addSubview:self.bgImageView];
    [self addSubview:self.middleImageView];
    [self.middleImageView addSubview:self.midDataImageView];
    [self.middleImageView addSubview:self.midPersonImageView];
    [self.middleImageView addSubview:self.midDataLabel];
    [self.middleImageView addSubview:self.midPeopleLabel];
    [self addSubview:self.taskTaget];
    [self addSubview:self.taskPecent];
    [self addSubview:self.taskDescription];
    [self addSubview:self.taskDetail];
    [self addSubview:self.taskPrice];
    [self addSubview:self.goToTaskButton];
}
- (void)makeConstraits{
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, kScreenHeight));
        make.left.mas_equalTo(0);
    }];
    [self.middleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(256*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(299*kScreenWidthScale, 55*kScreenHeightScale));
        make.left.mas_equalTo(38*kScreenWidthScale);
    }];
    [self.midDataImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(40*kScreenWidthScale, 40*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.midPersonImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(14*kScreenWidthScale, 16*kScreenHeightScale));
        make.left.mas_equalTo(190*kScreenWidthScale);
    }];
    [self.midDataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(95*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(70*kScreenWidthScale);
    }];
    [self.midPeopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(22*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(80*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(209*kScreenWidthScale);
    }];
    [self.taskTaget mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(353*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(300*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(42*kScreenWidthScale);
    }];
    [self.taskPecent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(374*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(300*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(42*kScreenWidthScale);

    }];
    [self.taskDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(401*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(300*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(42*kScreenWidthScale);

    }];
    [self.taskDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(422*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(300*kScreenWidthScale, 30*kScreenHeightScale));
        make.left.mas_equalTo(42*kScreenWidthScale);

    }];
    [self.taskPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(471*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(300*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(42*kScreenWidthScale);

    }];
    [self.goToTaskButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(540*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(193*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(96*kScreenWidthScale);

    }];
    
}


- (LMImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[LMImageView alloc]init];
    }
    return _bgImageView;
}
- (UIImageView *)middleImageView{
    if (!_middleImageView) {
        _middleImageView = [[UIImageView alloc]init];
    }
    return  _middleImageView;
}
- (UIImageView *)midDataImageView{
    if (!_midDataImageView) {
        _midDataImageView = [[UIImageView alloc]init];
    }
    return _midDataImageView;
}
- (UIImageView *)midPersonImageView{
    if (!_midPersonImageView) {
        _midPersonImageView = [[UIImageView alloc]init];
    }
    return _midPersonImageView;
}
- (UILabel *)midDataLabel{
    if (!_midDataLabel) {
        _midDataLabel = [[UILabel alloc]init];
        _midDataLabel.font = [UIFont boldSystemFontOfSize:15*kScreenHeightScale];
        _midDataLabel.textColor = TITLE_COLOR;
    }
    return _midDataLabel;
}
- (UILabel *)midPeopleLabel{
    if (!_midPeopleLabel) {
        _midPeopleLabel = [[UILabel alloc]init];
        _midPeopleLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _midPeopleLabel.textColor = REMARK_COLOR;
    }
    return _midPeopleLabel;
}
- (UILabel *)taskTaget{
    if (!_taskTaget) {
        _taskTaget = [[UILabel alloc]init];
        _taskTaget.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _taskTaget.textColor = [UIColor whiteColor];
        
    }
    return _taskTaget;
}
- (UILabel *)taskPecent{
    if (!_taskPecent) {
        _taskPecent = [[UILabel alloc]init];
        _taskPecent.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _taskPecent.textColor = [UIColor whiteColor];
    }
    return _taskPecent;
}
-(UILabel *)taskDescription{
    if (!_taskDescription) {
        _taskDescription = [[UILabel alloc]init];
        _taskDescription.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _taskDescription.textColor = [UIColor whiteColor];
    }
    return _taskDescription;
}
- (UILabel *)taskDetail{
    if (!_taskDetail) {
        _taskDetail = [[UILabel alloc]init];
        _taskDetail.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _taskDetail.textColor = [UIColor whiteColor];
        _taskDetail.numberOfLines = 0;
    }
    return _taskDetail;
}
- (UILabel *)taskPrice{
    if (!_taskPrice) {
        _taskPrice = [[UILabel alloc]init];
        _taskPrice.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _taskPrice.textColor = S_COLOR;
    }
    return _taskPrice;
}
- (UIButton *)goToTaskButton{
    if (!_goToTaskButton) {
        _goToTaskButton = [[UIButton alloc]init];
    }
    return _goToTaskButton;
}















/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
