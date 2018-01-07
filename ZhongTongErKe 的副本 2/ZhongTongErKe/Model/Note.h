//
//  Note.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"



@interface Note : NSObject

@property (nonatomic ,copy) NSString *title;

@property (nonatomic ,strong) User *user;

@property (nonatomic ,copy) NSString *updaTime;

@property (nonatomic ,copy) NSString *content;

@property (nonatomic ,copy) NSString *repNum;

@property (nonatomic ,copy) NSString *pointCount;
//**子帖子 */
@property (nonatomic ,strong) Note *subNote;
@property (nonatomic ,strong) NSArray *subNoteArray;

@property (nonatomic,assign,getter=isfirstClick) BOOL seeMore;

+(NSArray *)getAllNoteArray;


@end
