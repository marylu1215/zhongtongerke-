//
//  SSPersonalFileHeaderView.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMImageView.h"
#import "User.h"

@interface SSPersonalFileHeaderView : UIView

@property (nonatomic ,strong) LMImageView *bgImageView;

@property (nonatomic ,strong) User *user;

@end
