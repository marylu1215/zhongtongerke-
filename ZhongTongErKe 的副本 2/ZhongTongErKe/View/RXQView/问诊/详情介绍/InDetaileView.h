//
//  InDetaileView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ExConsult.h"

@interface InDetaileView : UIView

@property (nonatomic ,strong) ExConsult *exConsult;
@property (nonatomic ,copy) void(^priseBlcok)();

@end
