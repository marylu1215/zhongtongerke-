//
//  beizierx.m
//  ZhongTongErKe
//
//  Created by 研发部 on 2017/9/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "beizierx.h"
static CGRect myFrame;

@interface beizierx ()
@end



@implementation beizierx
//初始化画布
+(instancetype)initWithFrame:(CGRect)frame{
    
    beizierx *bezierCurveView = [[NSBundle mainBundle]loadNibNamed:@"beizierx" owner:self options:nil].lastObject;
    
    bezierCurveView.frame = frame;
    
    //背景视图
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
   // backView.backgroundColor = XYQColor(255, 229, 239);
    //backView.backgroundColor = [UIColor redColor];
    
    backView.backgroundColor = [UIColor whiteColor];
    [bezierCurveView addSubview:backView];
    
    myFrame = frame;
    return bezierCurveView;
    
}

///**
// *  画坐标轴
// */
-(void)drawXYLine:(NSMutableArray *)x_names{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //1.Y轴、X轴的直线
    [path moveToPoint:CGPointMake(MARGIN, CGRectGetHeight(myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN, MARGIN)];
    
    [path moveToPoint:CGPointMake(MARGIN, CGRectGetHeight(myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+CGRectGetWidth(myFrame)-2*MARGIN, CGRectGetHeight(myFrame)-MARGIN)];
    
    
    //右左边框
    [path moveToPoint:CGPointMake(CGRectGetWidth(myFrame)-MARGIN, CGRectGetHeight(myFrame)-MARGIN-Y_EVERY_MARGIN*10)];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(myFrame)-MARGIN, CGRectGetHeight(myFrame)-MARGIN)];
    
    
    
    
    //3.添加索引格
    //X轴
    for (int i=0; i<x_names.count; i++) {
        CGFloat X = MARGIN + MARGIN*(i+1);
        
        //CGFloat X = MARGIN + MARGIN*(i+1)+15;
        CGPoint point = CGPointMake(X,CGRectGetHeight(myFrame)-MARGIN);
        [path moveToPoint:point];
        [path addLineToPoint:CGPointMake(point.x, point.y)];
        
        //[path addLineToPoint:CGPointMake(point.x, 20)];
    }
    //Y轴（实际长度为200,此处比例缩小一倍使用）
    for (int i=0; i<11; i++) {
        CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        CGPoint point = CGPointMake(MARGIN,Y);
        [path moveToPoint:point];
        [path addLineToPoint:CGPointMake(point.x-3, point.y)];
        //[path addLineToPoint:CGPointMake(CGRectGetWidth(myFrame)-MARGIN, point.y)];
        
    }
    
    for (int i=2; i<3; i++) {
        CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        CGPoint point = CGPointMake(MARGIN,Y);
        [path moveToPoint:point];
        //[path addLineToPoint:CGPointMake(point.x+3, point.y)];
        [path addLineToPoint:CGPointMake(CGRectGetWidth(myFrame)-MARGIN, point.y)];
    }
    
    
    for (int i=5; i<6; i++) {
        CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        CGPoint point = CGPointMake(MARGIN,Y);
        [path moveToPoint:point];
        //[path addLineToPoint:CGPointMake(point.x+3, point.y)];
        [path addLineToPoint:CGPointMake(CGRectGetWidth(myFrame)-MARGIN, point.y)];
    }
    
    for (int i=8; i<9; i++) {
        CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        CGPoint point = CGPointMake(MARGIN,Y);
        [path moveToPoint:point];
        //[path addLineToPoint:CGPointMake(point.x+3, point.y)];
        [path addLineToPoint:CGPointMake(CGRectGetWidth(myFrame)-MARGIN, point.y)];
    }
    
    for (int i=10; i<11; i++) {
        CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        CGPoint point = CGPointMake(MARGIN,Y);
        [path moveToPoint:point];
        //[path addLineToPoint:CGPointMake(point.x+3, point.y)];
        [path addLineToPoint:CGPointMake(CGRectGetWidth(myFrame)-MARGIN, point.y)];
    }
    
    
    
    
    //4.添加索引格文字
    //X轴
    for (int i=0; i<x_names.count; i++) {
        //CGFloat X = MARGIN + 15 + MARGIN*i;
        
        CGFloat X = MARGIN + MARGIN+ (MARGIN+27)*i;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(X, CGRectGetHeight(myFrame)-MARGIN, MARGIN+20, 20)];
        //textLabel.backgroundColor = [UIColor redColor];
        textLabel.text = x_names[i];
        textLabel.font = [UIFont systemFontOfSize:10];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = [UIColor blackColor];
        
        [self addSubview:textLabel];
    }
    
    
    //Y轴
    for (int i=0; i<11; i++) {
        CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, Y-5, MARGIN, 10)];
        textLabel.text = [NSString stringWithFormat:@"%d",10*i];
        textLabel.font = [UIFont systemFontOfSize:10];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = [UIColor blackColor];
        [self addSubview:textLabel];
    }
    
    //低标准label
    
    CGFloat Y = CGRectGetHeight(myFrame);
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(myFrame)-MARGIN+10, Y-MARGIN-MARGIN-10, MARGIN-15, MARGIN+15)];
    //textLabel.text = [NSString stringWithFormat:@"%d",10*i];
    textLabel.text = @"低标准";
    textLabel.font = [UIFont systemFontOfSize:10];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.numberOfLines = 3;
    textLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:textLabel];
    
    
    //中下
    
    CGFloat Y2 = CGRectGetHeight(myFrame);
    UILabel *textLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(myFrame)-MARGIN+10, Y2 -4 *MARGIN, MARGIN-15, MARGIN+15)];
    //textLabel.text = [NSString stringWithFormat:@"%d",10*i];
    textLabel2.text = @"中下";
    textLabel2.font = [UIFont systemFontOfSize:10];
    textLabel2.textAlignment = NSTextAlignmentCenter;
    textLabel2.numberOfLines = 2;
    textLabel2.textColor = [UIColor lightGrayColor];
    [self addSubview:textLabel2];
    
    
    
    CGFloat Y3 = CGRectGetHeight(myFrame);
    UILabel *textLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(myFrame)-MARGIN+10, Y3 -6 *MARGIN, MARGIN-15, MARGIN+15)];
    //textLabel.text = [NSString stringWithFormat:@"%d",10*i];
    textLabel3.text = @"中上";
    textLabel3.font = [UIFont systemFontOfSize:10];
    textLabel3.textAlignment = NSTextAlignmentCenter;
    textLabel3.numberOfLines = 2;
    textLabel3.textColor = [UIColor lightGrayColor];
    [self addSubview:textLabel3];
    
    
    CGFloat Y4 = CGRectGetHeight(myFrame);
    UILabel *textLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(myFrame)-MARGIN+10, Y4 -7.6 *MARGIN, MARGIN-15, MARGIN+15)];
    //textLabel.text = [NSString stringWithFormat:@"%d",10*i];
    textLabel4.text = @"高标准";
    textLabel4.font = [UIFont systemFontOfSize:10];
    textLabel4.textAlignment = NSTextAlignmentCenter;
    textLabel4.numberOfLines = 3;
    textLabel4.textColor = [UIColor lightGrayColor];
    [self addSubview:textLabel4];
    
    
    // CGFloat Y5 = CGRectGetHeight(myFrame);
    UILabel *textLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 80, 10)];
    //textLabel.text = [NSString stringWithFormat:@"%d",10*i];
    textLabel5.text = @"百分位(%)";
    textLabel5.font = [UIFont systemFontOfSize:10];
    textLabel5.textAlignment = NSTextAlignmentLeft;
    textLabel5.numberOfLines = 0;
    textLabel5.textColor = [UIColor blackColor];
    [self addSubview:textLabel5];
    
    
    //5.渲染路径
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    //shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.borderWidth = 2.0;
    [self.subviews[0].layer addSublayer:shapeLayer];
}


-(void)drawBarChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues{
    
    //1.画坐标轴
    [self drawXYLine:x_names];
    
    //2.每一个目标值点坐标
    for (int i=0; i<targetValues.count; i++) {
        CGFloat doubleValue = 2*[targetValues[i] floatValue]; //目标值放大两倍
        //CGFloat X = MARGIN + MARGIN*(i+1)+5;
        CGFloat X = MARGIN + (MARGIN+25)*(i+1)+5;
        CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-doubleValue;
        //        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(X-MARGIN/2, Y, MARGIN-10, doubleValue)];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(X-MARGIN/2, Y, MARGIN, doubleValue)];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.strokeColor = [UIColor clearColor].CGColor;
        shapeLayer.fillColor = XYQRandomColor.CGColor;
        shapeLayer.borderWidth = 2.0;
        [self.subviews[0].layer addSublayer:shapeLayer];
        
        //3.添加文字
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(X-MARGIN/2, Y-20, MARGIN-10, 20)];
        label.text = [NSString stringWithFormat:@"%.0lf",(CGRectGetHeight(myFrame)-Y-MARGIN)/2];
        label.textColor = [UIColor grayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        [self.subviews[0] addSubview:label];
    }
}

@end
