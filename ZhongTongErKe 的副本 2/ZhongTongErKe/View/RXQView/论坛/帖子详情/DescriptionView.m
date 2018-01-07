//
//  DescriptionView.m
//  MagicFinger
//
//  Created by xufeng on 16/10/14.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "DescriptionView.h"
#import "UITextView+XFExtension.h"

@interface DescriptionView ()<UITextViewDelegate>
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, assign) BOOL isTrue;

@end

@implementation DescriptionView
- (instancetype)initWithPlaceholder:(NSString *)placeholder maxLength:(NSInteger)length{
    if (self = [super init]) {
        _length = length;
        
        _descriptionTV.myPlaceholder = placeholder;
        _countLabel.text = [NSString stringWithFormat:@"0/%ld",length];;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        //** 填写描述 */
        
        self.backgroundColor = c255255255;
        
//        _countLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
//        [self addSubview:_countLabel];
        
        _descriptionTV = [[XFWBTextView alloc]init];
        _descriptionTV.font = font(Font13);
        _descriptionTV.placeholderLabel.y = 8;
        _descriptionTV.textContainerInset = UIEdgeInsetsMake(8, 15 - 5, 0, 0);
        _descriptionTV.placeholderLabel.x=15;
        _descriptionTV.delegate = self;
        [self addSubview:_descriptionTV];
        
        __weak typeof(self)weakSelf = self;
        _descriptionTV.textLengthBlock = ^(NSUInteger count){
            ICLog(@"%zd",count);
            if (weakSelf.countLabel) {
                weakSelf.countLabel.text = [NSString stringWithFormat:@"%ld/%ld",count,weakSelf.length];
            }
        };
        
        // 监听文本框文字的改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewEditDidChanged:) name:UITextViewTextDidChangeNotification object:_descriptionTV];
        [self.descriptionTV addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        
//        [_countLabel setSingleLineAutoResizeWithMaxWidth:200];
//        _countLabel.sd_layout.bottomSpaceToView(self,5).rightSpaceToView(self,15).autoHeightRatio(0);//原height ： 13;
        
        _descriptionTV.sd_layout.topSpaceToView(self,1).leftSpaceToView(self,0).bottomSpaceToView(self,0).rightSpaceToView(self,0);
        
    }
    return self;
}

#pragma mark - textView Delegate
//限制表情
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@""]) {
        return YES;
    }
    
    if (![NSString  stringContainsEmoji:text]) {
        return NO;
    }
    return YES;
}
#pragma mark - textView Noti
-(void)textViewEditDidChanged:(NSNotification *)obj{
    UITextView *textView = (UITextView *)obj.object;
    //限制字数
    [textView textView:textView maxStrLength:self.length];
}

- (void)textViewCount:(NSUInteger)count{
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString: @"text"]) {
        self.countLabel.text = [NSString stringWithFormat:@"%ld/%ld",self.descriptionTV.text.length,self.length];
    }
}

- (void)dealloc
{
    [self.descriptionTV removeObserver:self forKeyPath:@"text"];
    [[NSNotificationCenter defaultCenter ]removeObserver:self];
}
@end
