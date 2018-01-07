//
//  SearchNoBtnBar.m
//  MagicFinger
//
//  Created by xufeng on 16/9/13.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "SearchNoBtnBar.h"

@interface SearchNoBtnBar ()<UITextFieldDelegate>
@property (nonatomic, strong) NSString *kWords;
@property (nonatomic, assign,getter=isCanSearch) BOOL canSearch;

@end

@implementation SearchNoBtnBar

- (instancetype)initWithSearchBarEditDidChange:(SearchBarEditBlock)searchBarEditBlock SearchBegin:(SearchBeginBlock)searchBeginBlock{
    if (self = [super init]) {
        _searchBarEditBlock = searchBarEditBlock;
        _searchBeginBlock = searchBeginBlock;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = c255255255;
        self.sd_cornerRadius = @(6);
        self.layer.borderColor = cGrayBorder.CGColor;
        self.layer.borderWidth = pxLineHeight;
        //搜索条
        _searchTF = [[IWSearchBar alloc]init];
        _searchTF.backgroundColor = [UIColor clearColor];
        [self addSubview:_searchTF];
        _searchTF.sd_layout.leftSpaceToView(self,LMargin - 5).rightSpaceToView(self,0).topSpaceToView(self,0).bottomSpaceToView(self,0);//5是IWSearchBar内的边距
        
        _searchTF.delegate = self;
        _searchTF.textColor = cGrayWord;
        
        // 监听文本框文字的改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:_searchTF];//限制字数
        [_searchTF addTarget:self action:@selector(beginCellTFEdit:) forControlEvents:(UIControlEventAllEvents)];
        [_searchTF addTarget:self action:@selector(searchOnKeyboardClick) forControlEvents:(UIControlEventEditingDidEndOnExit)];
        [_searchTF addTarget:self action:@selector(searchEdit:) forControlEvents:(UIControlEventEditingChanged)];
        
    }
    return self;
}

-(void)setPlaceholder:(NSString *)placeholder{
    _searchTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: RGBColor(153, 153, 153, 1.0)}];
}

#pragma mark - TextField
-(void)searchEdit:(IWSearchBar *)search{
    self.canSearch = NO;
    if (search.text.length == 0) {
        return;
    }else{
        self.kWords = search.text;
        
        [NSRunLoop cancelPreviousPerformRequestsWithTarget:self selector:@selector(searchText) object:nil];
        [self performSelector:@selector(searchText) withObject:nil afterDelay:0.5];
    }
}

- (void)searchText{
    if (_searchBarEditBlock) {
        if (self.limitMaxStrLength && self.kWords.length <= self.limitMaxStrLength) {
            _searchBarEditBlock(self.kWords);
        }
        else if (!self.limitMaxStrLength){
            _searchBarEditBlock(self.kWords);
        }
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.text = self.kWords;//保留搜索字
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
//限制表情
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    if (![NSString  stringContainsEmoji:string]) {
        return NO;
    }
    return YES;
    
}
//键盘点击 完成
-(void)searchOnKeyboardClick{
    //改变关键字
    self.kWords = self.searchTF.text;
    [self searchBegin];
}

//开始搜索-回调
-(void)searchBegin{
    if (_searchBeginBlock) {
        _searchBeginBlock(self.kWords);
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
