//
//  SearchBarView.h
//  MagicFinger
//
//  Created by xufeng on 16/8/12.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IWSearchBar.h"

@protocol SearchBarViewDelegate;
@interface SearchBarView : UIView

@property (nonatomic,strong) IWSearchBar *searchTF;
@property (nonatomic,strong) UIButton *searchBtn;
@property (nonatomic,strong) NSString *placeholder;

@property(nonatomic) UIKeyboardType detailKeyboardType;//detailTF键盘样式
@property (nonatomic,assign) NSInteger limitMaxStrLength;//detailTF限制的字数

@property (nonatomic,weak) id<SearchBarViewDelegate> delegate;

@end

@protocol SearchBarViewDelegate <NSObject>

@optional
-(void)searchBegin:(NSString *)searchText;

@end
