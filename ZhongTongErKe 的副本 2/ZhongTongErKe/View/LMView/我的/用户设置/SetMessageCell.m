//
//  SetMessageCell.m
//  MagicFinger
//
//  Created by khj on 2016/12/5.
//  Copyright © 2016年 zeenc. All rights reserved.
//


#import "SetMessageCell.h"

@interface SetMessageCell ()

@end

@implementation SetMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.rightSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    
    if (self.switchActionBlock) {
        self.switchActionBlock(isButtonOn,switchButton);
    }

}
@end
