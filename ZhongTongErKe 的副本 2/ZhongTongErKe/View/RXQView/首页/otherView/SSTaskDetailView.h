//
//  SSTaskDetailView.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMImageView.h"
@interface SSTaskDetailView : UIView

@property (nonatomic,strong) LMImageView *bgImageView;

@property (nonatomic,strong) UIImageView *middleImageView;
@property (nonatomic,strong) UIImageView *midDataImageView;
@property (nonatomic,strong) UIImageView *midPersonImageView;
@property (nonatomic,strong) UILabel *midDataLabel;
@property (nonatomic,strong) UILabel *midPeopleLabel;

@property (nonatomic,strong) UILabel *taskTaget;
@property (nonatomic ,strong) UILabel *taskPecent;
@property (nonatomic,strong) UILabel *taskDescription;
@property (nonatomic,strong) UILabel *taskDetail;
@property (nonatomic,strong) UILabel *taskPrice;

@property (nonatomic,strong)UIButton *goToTaskButton;








@end
