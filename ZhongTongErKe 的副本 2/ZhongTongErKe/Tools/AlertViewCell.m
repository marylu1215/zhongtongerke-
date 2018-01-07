//
//  AlertViewCell.m
//  MagicFinger
//
//  Created by khj on 16/6/27.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "AlertViewCell.h"

@interface AlertViewCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewHConstraint;

@end

@implementation AlertViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lineViewHConstraint.constant = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
