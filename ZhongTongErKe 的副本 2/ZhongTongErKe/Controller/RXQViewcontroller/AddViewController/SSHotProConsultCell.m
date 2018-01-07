//
//  SSHotProConsultCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHotProConsultCell.h"
#import <AVFoundation/AVFoundation.h>

@interface SSHotProConsultCell ()

@property (nonatomic,strong)UIView *bottomLine;

@end

@implementation SSHotProConsultCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubviews{
    
    [self addSubview:self.headLabel];
    [self addSubview:self.headImageView];
    [self addSubview:self.listenButton];
    [self addSubview:self.listenLabel];
    [self addSubview:self.goodImageView];
    [self addSubview:self.goodLabel];
    [self addSubview:self.clockImageView];
    [self addSubview:self.clockLabel];
    [self addSubview:self.bottomLine];
}
- (void)makeConstaits{
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(42*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(31*kScreenWidthScale, 31*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.listenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(45*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(131*kScreenWidthScale, 27*kScreenHeightScale));
        make.left.mas_equalTo(48*kScreenWidthScale);
    }];
    [self.listenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(53*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(70*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(67*kScreenWidthScale);
    }];
    [self.goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(54*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(13*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(249*kScreenWidthScale);
    }];
    [self.goodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(58*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(12*kScreenWidthScale, 9*kScreenHeightScale));
        make.left.mas_equalTo(265*kScreenWidthScale);
    }];
    [self.clockImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(54*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(14*kScreenWidthScale, 14*kScreenHeightScale));
        make.left.mas_equalTo(288*kScreenWidthScale);
    }];
    [self.clockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(58*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 9*kScreenHeightScale));
        make.left.mas_equalTo(306*kScreenWidthScale);
    }];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    
}



- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.numberOfLines = 0;
        _headLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
    }
    return _headLabel;
}
- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        
    }
    return _headImageView;
}
- (UIButton*)listenButton{
    if (!_listenButton) {
        _listenButton = [UIButton addBtnImage:index_listenImageName  WithTarget:self action:@selector(listenAction:)];
        
    }
    return _listenButton;
}
- (UILabel *)listenLabel{
    if (!_listenLabel) {
        _listenLabel = [[UILabel alloc]init];
        _listenLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _listenLabel.textColor = [UIColor whiteColor];
    }
    return _listenLabel;
}
- (UIImageView *)goodImageView{
    if (!_goodImageView) {
        _goodImageView = [[UIImageView alloc]init];
    }
    return _goodImageView;
}
- (UILabel *)goodLabel{
    if (!_goodLabel) {
        _goodLabel = [[UILabel alloc]init];
        _goodLabel.font = [UIFont systemFontOfSize:9*kScreenHeightScale];
        _goodLabel.textColor = TITLE_COLOR;
    }
    return _goodLabel;
}
- (UIImageView *)clockImageView{
    if (!_clockImageView) {
        _clockImageView = [[UIImageView alloc]init];
    }
    return _clockImageView;
}
- (UILabel *)clockLabel{
    if (!_clockLabel) {
        _clockLabel = [[UILabel alloc]init];
        _clockLabel.font = [UIFont systemFontOfSize:9*kScreenHeightScale];
        _clockLabel.textColor = TITLE_COLOR;
    }
    return _clockLabel;
}
- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc]init];
        _bottomLine.backgroundColor = LINE_COLOR;
    }
    return _bottomLine;
}

-(void)listenAction:(UIButton *)btn
{
    AVSpeechSynthesizer  *av= [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance*utterance = [[AVSpeechUtterance alloc]initWithString:btn.titleLabel.text];//需要转换的文字
    utterance.rate=0.5;
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];//设置发音，这是中文普通话
    utterance.voice= voice;
    [av speakUtterance:utterance];//开始
}
@end
