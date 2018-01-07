//
//  CJSlider.h
//  CJVideoPlayer
//
//  Created by YouChangJiang on 16/4/20.
//  Copyright © 2016年 YouChangJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJSlider;

typedef void (^SliderValueChangeBlock) (CJSlider *slider);
typedef void (^SliderFinishChangeBlock) (CJSlider *slider);
typedef void (^DraggingSliderBlock) (CJSlider *slider);

@interface CJSlider : UIView@property (nonatomic, assign) CGFloat value;        /* From 0 to 1 */
@property (nonatomic, assign) CGFloat middleValue;  /* From 0 to 1 */

@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat sliderDiameter;
@property (nonatomic, strong) UIColor *sliderColor;
@property (nonatomic, strong) UIColor *maxColor;
@property (nonatomic, strong) UIColor *middleColor;
@property (nonatomic, strong) UIColor *minColor;

@property (nonatomic, copy) SliderValueChangeBlock valueChangeBlock;
@property (nonatomic, copy) SliderFinishChangeBlock finishChangeBlock;
@property (nonatomic, strong) DraggingSliderBlock draggingSliderBlock;

@end
