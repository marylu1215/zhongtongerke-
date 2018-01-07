//
//  SSTableCellButton.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/3.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SSTableCellButton : UIButton

@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *headlabel;
- (instancetype)initWithImageName:(NSString *)imageName;

@end
