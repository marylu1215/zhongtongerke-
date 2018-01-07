//
//  SSPersonFileListController.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FamilyGroup.h"
#import "User.h"

@interface SSPersonFileListController : XFWorkBaseController

@property (nonatomic ,strong) User *user;

@property (nonatomic ,strong) FamilyGroup *familyGroup;

@property (nonatomic ,copy) NSString *type;


@end
