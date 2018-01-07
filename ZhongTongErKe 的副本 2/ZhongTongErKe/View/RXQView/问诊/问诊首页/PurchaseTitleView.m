//
//  PurchaseTitleView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/7.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PurchaseTitleView.h"

@interface PurchaseTitleView ()<UITextFieldDelegate>

@property (nonatomic ,strong) UIView *typeView;
@property (nonatomic ,strong) UILabel *tyLabel;
@property (nonatomic ,strong) UILabel *doctorLabel;
@property (nonatomic ,strong) UILabel *priceLabel;

@property (nonatomic ,strong) UIView *purchaseNumView;
@property (nonatomic ,strong) UILabel *purchaseLabel;

@property (nonatomic ,strong) UIButton *couponButton;
@property (nonatomic ,strong) UILabel *couponLabel;
@property (nonatomic ,strong) UILabel *tipLabel;
@property (nonatomic ,strong) UIImageView *rightImageView;
@property (nonatomic ,strong) UIImageView *lineImageView;

@property (nonatomic ,strong) UIView *paymentView;
@property (nonatomic ,strong) UILabel *paymentLabel;
@property (nonatomic ,strong) UILabel *paymentPriceLabel;
@property (nonatomic ,strong) UITextField *priceTextField;

@end


@implementation PurchaseTitleView

-(id)initWithFrame:(CGRect)frame section:(BOOL)section
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithHexString:@"f1f0f0"];
        
        [self prepareUI];
        
        [self configueFrameWith:section];
        
    }
    
    return self;
}

-(void)prepareUI
{
    
    self.typeView = [[UIView alloc]init];
    self.typeView.backgroundColor = c255255255;
    [self addSubview:self.typeView];
    
    self.tyLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.typeView addSubview:self.tyLabel];
    
    self.doctorLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.typeView addSubview:self.doctorLabel];
    
    self.priceLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:S_COLOR];
    [self.typeView addSubview: self.priceLabel];
    
    self.purchaseNumView = [[UIView alloc]init];
    [self addSubview:self.purchaseNumView];
    
    self.purchaseLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.purchaseNumView addSubview:self.purchaseLabel];
    
    
    self.couponButton = [UIButton addBgBtnWithBGClor:c255255255 Target:self Action:@selector(puchAction)];
    [self addSubview:self.couponButton];
    
    self.couponLabel = [UILabel addLabelWithText:@"优惠券" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.couponButton addSubview:self.couponLabel];
    
    self.tipLabel = [UILabel labelWithText:@"未使用优惠券" Font:Font13 Color:REMARK_COLOR Alignment:NSTextAlignmentRight];
    [self.couponButton addSubview:self.tipLabel];
    
    self.rightImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:goImageName]];
    [self.couponButton addSubview:self.rightImageView];
    
    
    self.lineImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self addSubview: self.lineImageView];
    
    
    self.paymentView = [[UIView alloc]init];
    self.paymentView.backgroundColor = c255255255;
    [self addSubview:self.paymentView];
    
    self.paymentLabel = [UILabel addLabelWithText:@"支付金额" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.paymentView addSubview:self.paymentLabel];
    
    self.paymentPriceLabel = [UILabel labelWithText:@"" Font:Font13 Color:S_COLOR Alignment:NSTextAlignmentRight];
    [self.paymentView addSubview:self.paymentPriceLabel];
    
    self.priceTextField = [UITextField addTextFieldWithPlaceholder:@"请输入金额" Font:Font13 TextColor:REMARK_COLOR TextAlignment:(NSTextAlignmentRight)];
    self.priceTextField.keyboardType = UIKeyboardTypeDecimalPad;
    [self.paymentView addSubview: self.priceTextField];
     self.priceTextField.delegate = self;
    // 监听文本框文字的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object: self.priceTextField];

    
}
-(void)configueFrameWith:(BOOL)section
{
    self.typeView.sd_layout.widthIs(kScreenWidth).heightIs(px(82)).topSpaceToView(self,0);
    
    if (!section) {
        self.couponButton.sd_layout.widthIs(kScreenWidth).heightIs(px(82)).topSpaceToView(self.typeView,px(10));
        
        self.couponLabel.sd_layout.widthIs([NSString backSizeWithText: self.couponLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.couponButton,px(30)).centerYEqualToView(self.couponButton);
        
        self.rightImageView.sd_layout.widthIs( self.rightImageView.image.size.width).heightIs(self.rightImageView.image.size.height).centerYEqualToView(self.couponButton).rightSpaceToView(self.couponButton,px(30));
        self.rightImageView.hidden = NO;
        
        self.tipLabel.sd_layout.rightSpaceToView( self.rightImageView,px(10)).leftSpaceToView(self.couponLabel,px(10)).centerYEqualToView(self.couponButton).heightIs(Font13);
        
        self.lineImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(self.couponButton,0);
        
        self.paymentView.sd_layout.widthIs(kScreenWidth).heightIs(px(82)).topSpaceToView(self.lineImageView,0);
        
        self.paymentLabel.sd_layout.widthIs([NSString backSizeWithText: self.paymentLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.paymentView,px(30)).centerYEqualToView(self.paymentView);
        
        self.paymentPriceLabel.sd_layout.rightSpaceToView(self.paymentView,px(30)).leftSpaceToView(self.paymentLabel,px(10)).centerYEqualToView(self.paymentView).heightIs(Font13);
        
        self.priceLabel.hidden = NO;
    }
    
    else
    {
        self.paymentView.sd_layout.widthIs(kScreenWidth).heightIs(px(82)).topSpaceToView( self.typeView,0);
        
        self.paymentLabel.sd_layout.widthIs([NSString backSizeWithText: self.paymentLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.paymentView,px(30)).centerYEqualToView(self.paymentView);
         self.rightImageView.hidden = YES;
        self.priceTextField.sd_layout.rightSpaceToView(self.paymentView,px(30)).leftSpaceToView(self.paymentLabel,px(10)).topSpaceToView(self.paymentView,0).bottomSpaceToView(self.paymentView,0);
        
         self.priceLabel.hidden = YES;
    }
    
    
}


-(void)setPurchase:(Purchase *)purchase
{
    if ([purchase.type isEqualToString:@"voice"]) {
        
         self.tyLabel.text = @"语音急诊";
    }
    else if ([purchase.type isEqualToString:@"text"])
    {
          self.tyLabel.text = @"图文资讯";
    }
    
    else if ([purchase.type isEqualToString:@"tel"])
    {
        self.tyLabel.text = @"电话咨询";

    }
    else if ([purchase.type isEqualToString:@"guidance"])
    {
       self.tyLabel.text = @"院后指导";
    }
    else if ([purchase.type isEqualToString:@"activity"])
    {
         self.tyLabel.text = @"名医会诊";
    }
    else if ([purchase.type isEqualToString:@"gift"])
    {
        self.tyLabel.text = @"评价医生";
    }
    else
    {
         self.tyLabel.text = @"私人医生";
    }
    
    self.tyLabel.sd_layout.widthIs([NSString backSizeWithText:self.tyLabel.text andFont:font(Font13)].width).heightIs(Font13).centerYEqualToView(self.typeView).leftSpaceToView(self.typeView,px(30));
    
    self.doctorLabel.text = purchase.doName;
     self.doctorLabel.sd_layout.widthIs([NSString backSizeWithText:self.doctorLabel.text andFont:font(Font13)].width).heightIs(Font13).centerYEqualToView(self.typeView).leftSpaceToView(self.tyLabel,px(10));
    
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",purchase.price] ;
     self.priceLabel.sd_layout.widthIs([NSString backSizeWithText:self.priceLabel.text andFont:font(Font13)].width).heightIs(Font13).centerYEqualToView(self.typeView).rightSpaceToView(self.typeView,px(30));
    
    self.paymentPriceLabel.text = [NSString stringWithFormat:@"¥%@",purchase.price];
}

-(void)puchAction
{
    if (self.chooseBlock) {
        
        self.chooseBlock();
    }
}

#pragma mark -
//通知
-(void)textFiledEditDidChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    //限制字数
    [textField textField:textField maxStrLength:amountMaxLength];
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    

    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSCharacterSet *numbers;
    NSRange  pointRange = [textField.text rangeOfString:@"."];
    
    if ((pointRange.length > 0) && (pointRange.location < range.location  || pointRange.location > range.location + range.length) )
    {
        numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    }
    else
    {
        numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    }
    
    if ([textField.text isEqualToString:@""] && [string isEqualToString:@"."] )
    {
        return NO;
    }
    
    short remain = 2; //默认保留2位小数
    NSString *tempStr = [textField.text stringByAppendingString:string];
    NSUInteger strlen = [tempStr length];
    if(pointRange.length > 0 && pointRange.location > 0){ //判断输入框内是否含有“.”。
        if([string isEqualToString:@"."]){ //当输入框内已经含有“.”时，如果再输入“.”则被视为无效。
            return NO;
        }
        if(strlen > 0 && (strlen - pointRange.location) > remain+1){ //当输入框内已经含有“.”，当字符串长度减去小数点前面的字符串长度大于需要要保留的小数点位数，则视当次输入无效。
            return NO;
        }
    }
    
    NSRange zeroRange = [textField.text rangeOfString:@"0"];
    if(zeroRange.length == 1 && zeroRange.location == 0){ //判断输入框第一个字符是否为“0”
        if(![string isEqualToString:@"0"] && ![string isEqualToString:@"."] && [textField.text length] == 1){ //当输入框只有一个字符并且字符为“0”时，再输入不为“0”或者“.”的字符时，则将此输入替换输入框的这唯一字符。
            textField.text = string;
            return NO;
        }else{
            if(pointRange.length == 0 && pointRange.location > 0){ //当输入框第一个字符为“0”时，并且没有“.”字符时，如果当此输入的字符为“0”，则视当此输入无效。
                if([string isEqualToString:@"0"]){
                    return NO;
                }
            }
        }
    }
    
    NSString *buffer;
    if (![scanner scanCharactersFromSet:numbers intoString:&buffer] && ([string length] != 0) )
    {
        return NO;
    }
    return YES;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
