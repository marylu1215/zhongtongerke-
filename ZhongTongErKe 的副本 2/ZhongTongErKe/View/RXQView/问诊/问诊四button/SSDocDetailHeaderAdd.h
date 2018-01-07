//
//  SSDocDetailHeaderAdd.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/17.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"
#import "SSDocDeailHeader.h"
#import "SSDocDetailHeader2.h"


@interface SSDocDetailHeaderAdd : UIView

@property (nonatomic,strong) SSDocDeailHeader *topView;
@property (nonatomic,strong) SSDocDetailHeader2 *bottomView;
@property (nonatomic ,strong) Doctor *doctor;


@end
