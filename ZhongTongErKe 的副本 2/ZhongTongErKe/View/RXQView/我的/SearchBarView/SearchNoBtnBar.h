//
//  SearchNoBtnBar.h
//  MagicFinger
//
//  Created by xufeng on 16/9/13.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IWSearchBar.h"

typedef void (^SearchBarEditBlock)(NSString *text);
/**
 *  搜索回调
 *
 *  @param kWords            关键字
 */
typedef void (^SearchBeginBlock)(NSString *kWords);

@interface SearchNoBtnBar : UIView
{
    SearchBarEditBlock _searchBarEditBlock;
    SearchBeginBlock _searchBeginBlock;
}

@property (nonatomic, strong) IWSearchBar *searchTF;
@property (nonatomic, strong) NSString *placeholder;
@property(nonatomic)          UIKeyboardType detailKeyboardType;//detailTF键盘样式
@property (nonatomic, assign) NSInteger limitMaxStrLength;//detailTF限制的字数

/**
 *  搜索栏 带搜索提示table
 *
 *  @param searchBarEditBlock 搜索栏编辑时Block-返回输入的text
 *  @param searchBeginBlock   开始搜索时Block-返回要搜索的关键词
 *
 *  @return SearchBarView
 */
- (instancetype)initWithSearchBarEditDidChange:(SearchBarEditBlock)searchBarEditBlock SearchBegin:(SearchBeginBlock)searchBeginBlock;

@end
