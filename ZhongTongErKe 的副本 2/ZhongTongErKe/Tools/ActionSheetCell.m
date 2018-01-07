//
//  ActionSheetCell.m
//  MagicFinger
//
//  Created by khj on 16/6/13.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "ActionSheetCell.h"

@interface ActionSheetCell ()
@property (nonatomic, weak) UILabel *numAndNameLabel;
@property (nonatomic, weak) UIView *lineView;
@end

@implementation ActionSheetCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *sheetCellID = @"actionSheetCell";
    
    ActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:sheetCellID];
    
    if (cell == nil) {
        cell = [[ActionSheetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sheetCellID];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //
        UILabel *numAndNameLabel = [[UILabel alloc] init];
        self.numAndNameLabel = numAndNameLabel;
        numAndNameLabel.textAlignment = NSTextAlignmentCenter;
        numAndNameLabel.font = font(15);
        [self.contentView addSubview:numAndNameLabel];
        
        UIView *lineView = [[UIView alloc] init];
        self.lineView = lineView;
        lineView.backgroundColor = REMARK_COLOR;
        [self.contentView addSubview:lineView];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.numAndNameLabel.width = self.width;
    self.numAndNameLabel.height = 43;
    
    self.lineView.width = self.width;
    self.lineView.height = 0.5;
    self.lineView.y = self.height - 1;
}


@end
