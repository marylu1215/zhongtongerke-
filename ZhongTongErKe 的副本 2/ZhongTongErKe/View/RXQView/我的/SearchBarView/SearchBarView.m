//
//  SearchBarView.m
//  MagicFinger
//
//  Created by xufeng on 16/8/12.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "SearchBarView.h"

@interface SearchBarView ()

@end

@implementation SearchBarView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       
        self.backgroundColor = c255255255;
        //搜索条
        _searchTF = [[IWSearchBar alloc]init];
        _searchTF.backgroundColor = [UIColor clearColor];
        [self addSubview:_searchTF];
        _searchTF.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(self,0).bottomSpaceToView(self,0);//5是IWSearchBar内的边距
        
        // 监听文本框文字的改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:_searchTF];
        [_searchTF addTarget:self action:@selector(beginCellTFEdit:) forControlEvents:(UIControlEventAllEvents)];
        
    }
    return self;
}
-(void)setPlaceholder:(NSString *)placeholder{
    _searchTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: RGBColor(153, 153, 153, 1.0)}];
}
//键盘样式
-(void)beginCellTFEdit:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypeDefault;
    if (self.detailKeyboardType) {
        textField.keyboardType = self.detailKeyboardType;
    }
}
-(void)textFiledEditDidChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    if (self.limitMaxStrLength) {
        //限制字数
        [textField textField:textField maxStrLength:self.limitMaxStrLength];
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
