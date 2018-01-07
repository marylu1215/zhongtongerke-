//
//  SetMessageCell.h
//  MagicFinger
//
//  Created by khj on 2016/12/5.
//  Copyright © 2016年 zeenc. All rights reserved.
//

typedef NS_ENUM(NSInteger, SwitchTag) {
    SwitchTagZero,
    SwitchTagOne,
    SwitchTagTwo
};

#import <UIKit/UIKit.h>

@interface SetMessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *leftTitleLable;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;

@property (nonatomic, copy) void(^switchActionBlock)(BOOL isButtonOn,UISwitch *rightSwitch);
@end
