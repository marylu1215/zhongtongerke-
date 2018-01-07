//
//  searchView.m
//  MagicFinger
//
//  Created by xufeng on 16/8/12.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "searchView.h"

#define barInset UIEdgeInsetsZero

@interface searchView ()<UITextFieldDelegate>

@end

@implementation searchView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        self.backgroundColor = [UIColor clearColor];
        
        _searchBar = [[SearchBarView alloc]init];
        [self addSubview:_searchBar];
        _searchBar.sd_layout.spaceToSuperView(barInset);
        _searchBar.sd_cornerRadius = @6;
        _searchBar.layer.borderColor = cGrayBorder.CGColor;
        _searchBar.layer.borderWidth = pxLineHeight;
        
        [_searchBar.searchBtn addTarget:self action:@selector(rightBarBtnClick)
                       forControlEvents:UIControlEventTouchUpInside];
        _searchBar.searchBtn.enabled = NO;//一开始没有内容不可点击
        
        _searchBar.searchTF.delegate = self;
        _searchBar.searchTF.textColor = cGrayWord;
        //
        [_searchBar.searchTF addTarget:self action:@selector(searchOnKeyboardClick) forControlEvents:(UIControlEventEditingDidEndOnExit)];
        [_searchBar.searchTF addTarget:self action:@selector(searchEdit:) forControlEvents:(UIControlEventEditingChanged)];

    }
    return self;
}
- (instancetype)initWithSearchBarEditDidChange:(SearchBarEditBlock)searchBarEditBlock SearchBegin:(SearchBeginBlock)searchBeginBlock{
    if (self = [super init]) {
        _searchBarEditBlock = searchBarEditBlock;
        _searchBeginBlock = searchBeginBlock;
    }
    return self;
}
#pragma mark - 设置
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    _searchBar.placeholder = placeholder;
}
-(void)setLimitMaxStrLength:(NSInteger)limitMaxStrLength{
    _limitMaxStrLength = limitMaxStrLength;
    _searchBar.limitMaxStrLength = limitMaxStrLength;
}
-(void)setDetailKeyboardType:(UIKeyboardType)detailKeyboardType{
    _detailKeyboardType = detailKeyboardType;
    _searchBar.detailKeyboardType = detailKeyboardType;
}

#pragma mark - TextField
-(void)searchEdit:(IWSearchBar *)search{
 
 
    if (search.text.length == 0) {
            //没有内容不可点击，不可搜索
        self.searchBar.searchBtn.enabled = NO;
        
        return;
    }else{
      
    self.searchBar.searchBtn.enabled = YES;
  
        if (_searchBarEditBlock) {
            if (self.limitMaxStrLength && search.text.length <= self.limitMaxStrLength) {
                _searchBarEditBlock(search.text);
            }
            else if (!self.limitMaxStrLength){
                _searchBarEditBlock(search.text);
            }
        }
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
  
        if (textField.text.length == 0) {
            //没有内容不可点击，不可搜索
            self.searchBar.searchBtn.enabled = NO;
        }else{
            self.searchBar.searchBtn.enabled = YES;
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

#pragma mark - 搜索

//键盘点击 完成
-(void)searchOnKeyboardClick{
   
    [self searchBegin:NO index:0];
}
//右边搜索
-(void)rightBarBtnClick{
    //改变关键字
    [self endEditing:YES];
    
    [self searchBegin:NO index:0];
}

//开始搜索-回调
-(void)searchBegin:(BOOL)isSelectedTable index:(NSUInteger)index{
    if (_searchBeginBlock) {
      
    }
}

@end
