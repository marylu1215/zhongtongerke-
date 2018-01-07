//
//  EditContentsView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/7/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoImageView.h"
#import "TouchScrollView.h"
#import "DescriptionView.h"
#import "XFTopBottomLineView.h"

@interface EditContentsView : UIView

//** 照相背景图 */
@property (nonatomic,strong) TouchScrollView *PhotoBgView;
//** 添加图片 */
@property (nonatomic,strong) PhotoImageView *addPhotoIV;
//** 图片数组 */
@property (nonatomic,strong) NSMutableArray *photos;
;
//** 问题描述 */
@property (nonatomic, strong) DescriptionView *descView;

@property (nonatomic ,strong) UITextField *titleTextField;

@property (nonatomic ,copy) void (^selectBlock)();

@end
