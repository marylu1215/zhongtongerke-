//
//  CodeTimerButton.h
//  Cannel
//
//  Created by kouhanjin on 16/4/3.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CodeTimerButton;
typedef NSString* (^DidChangeBlock)(CodeTimerButton *codeTimerButton,NSInteger second);
typedef NSString* (^DidFinishedBlock)(CodeTimerButton *codeTimerButton,NSInteger second);

@interface CodeTimerButton : UIButton
{
    NSInteger _second;
    NSInteger _totalSecond;
    
    NSTimer *_timer;
    NSDate *_startDate;
    
    DidChangeBlock _didChangeBlock;
    DidFinishedBlock _didFinishedBlock;
    
}

-(void)didChange:(DidChangeBlock)didChangeBlock;
-(void)didFinished:(DidFinishedBlock)didFinishedBlock;
-(void)startWithSecond:(NSInteger)second;
- (void)stop;

@end
