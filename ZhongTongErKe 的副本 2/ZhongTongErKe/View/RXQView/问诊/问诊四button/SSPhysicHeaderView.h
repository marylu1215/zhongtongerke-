//
//  SSPhysicHeaderView.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSPhysicTransparentView.h"
#import "SSPhysicMiddleView.h"
@interface SSPhysicHeaderView : UIView

@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)SSPhysicTransparentView *transparentView;
@property (nonatomic,strong) SSPhysicMiddleView *middleView;

@end
