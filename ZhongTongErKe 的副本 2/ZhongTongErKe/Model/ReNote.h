//
//  ReNote.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Note.h"

@interface ReNote : NSObject

@property (nonatomic ,copy) NSString *type;

@property (nonatomic ,strong) NSArray *stateArray;

@property (nonatomic ,strong) Note *note;



@end
