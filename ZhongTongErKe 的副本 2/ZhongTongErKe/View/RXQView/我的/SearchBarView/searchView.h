//
//  searchView.h
//  MagicFinger
//
//  Created by xufeng on 16/8/12.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchBarView.h"

typedef void (^SearchBarEditBlock)(NSString *text);
/**
 *  搜索回调
 *
 *  @param kWords            关键字
 *  @param index             pop提示列表下标（如果是从列表中选择）
 *  @param isSeletedPopTable 是否从列表中选择
 */
typedef void (^SearchBeginBlock)(NSString *kWords,BOOL isSeletedPopTable,NSUInteger index);
@interface searchView : UIView
{
    SearchBarEditBlock _searchBarEditBlock;
    SearchBeginBlock _searchBeginBlock;
}

@property (nonatomic,strong) SearchBarView *searchBar;
@property (nonatomic,strong) NSString *placeholder;
@property(nonatomic) UIKeyboardType detailKeyboardType;//detailTF键盘样式
@property (nonatomic,assign) NSInteger limitMaxStrLength;//detailTF限制的字数

/**
 *  要显示的提示的关键词数组
 */
@property (nonatomic,strong) NSArray *keyWordsArr;


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
