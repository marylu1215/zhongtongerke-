////
////  XFStatusCollectionCell.m
////  MagicFinger
////
////  Created by xufeng on 16/6/30.
////  Copyright © 2016年 zeenc. All rights reserved.
////
//
//#import "XFStatusCollectionCell.h"
//
//@interface XFStatusCollectionCell ()
//{
//    CAShapeLayer *_shapeLayer;
//}
//@end
//@implementation XFStatusCollectionCell
//-(instancetype)initWithFrame:(CGRect)frame{
//    if (self = [super initWithFrame:frame]) {
//        [self prepareUI];
//        
//    }
//    return self;
//}
//-(void)prepareUI{
//    
//#if 1
//    _shapeLayer = [[CAShapeLayer alloc]init];
//    _shapeLayer.lineCap = kCALineCapButt;
//    _shapeLayer.lineWidth = pxLineHeight;
//    _shapeLayer.strokeStart = 0.f;
//    [self.layer addSublayer:_shapeLayer];
//    
//    UIBezierPath *bezierLine = [UIBezierPath bezierPath];
//    CGFloat radius = self.height/2;
//    CGFloat orginY = radius;
//    CGPoint startPoint = CGPointMake(0, orginY);
//    CGPoint arcCenter = CGPointMake(orginY, orginY);
//    
//    [bezierLine moveToPoint:startPoint];
//    /*
//     clockwise：YES为顺时针，No为逆时针
//     */
//    [bezierLine addArcWithCenter:arcCenter radius:orginY startAngle:M_PI endAngle:M_PI * 3 / 2 clockwise:YES];
//    [bezierLine addLineToPoint:CGPointMake(self.width, 0)];
//    [bezierLine addLineToPoint:CGPointMake(self.width, self.height)];
//    [bezierLine addLineToPoint:CGPointMake(0, self.height)];
//    [bezierLine closePath];
//    _shapeLayer.path = bezierLine.CGPath;
//    _shapeLayer.strokeEnd = 1.f;
//#endif
//    
//    _btn = [UIButton addBtnWithTitle:@"" WithFont:pxMain WithTitleColor:c255255255];
//    _btn.titleLabel.font =[UIFont systemFontOfSize:IPHONE6_OR_LATER ? pxMain : 13];
//    [self addSubview:_btn];
//    _btn.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
//    [_btn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
//}
//-(void)setPart:(Part *)part{
//    _part = part;
//    [self.btn setTitle:part.name forState:(UIControlStateNormal)];
//    [self.btn setTitleColor:c000 forState:(UIControlStateNormal)];
//    [self.btn setTitleColor:c255255255 forState:(UIControlStateHighlighted)];
//    _shapeLayer.fillColor = cNotStartColor.CGColor;
//    _shapeLayer.strokeColor = cGrayBorder.CGColor;
//}
//#if 1
//-(void)setBuild:(Build *)build{
//    _build = build;
//    
//    self.btn.enabled = NO;
//    [self.btn setTitle:build.name forState:(UIControlStateNormal)];
//    switch (build.buildState.integerValue) {
//        case StatusTypeFinish:
//        {
//            [self.btn setTitleColor:cFinishSelectColor forState:(UIControlStateHighlighted)];
//            _shapeLayer.fillColor = cFinishColor.CGColor;
//            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;
//            
//        }
//            break;
//        case StatusTypeDoing:
//        {
//            [self.btn setTitleColor:cDoingSelectColor forState:(UIControlStateHighlighted)];
//            _shapeLayer.fillColor = cDoingColor.CGColor;
//            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;
//        }
//            break;
//        case StatusTypeNotStart:
//        {
//            [self.btn setTitleColor:cNotStartSelectColor forState:(UIControlStateHighlighted)];
//            _shapeLayer.fillColor = cNotStartColor.CGColor;
//            _shapeLayer.strokeColor = cGrayBorder.CGColor;
//        }
//            break;
//            
//            
//        default:
//            break;
//    }
//}
//-(void)setFloor:(Floor *)floor{
//    _floor = floor;
//    if (!floor.cid) {
//        self.btn.enabled = NO;
//    }
//    switch (floor.states.integerValue) {
//        case StatusTypeFinish:
//        {
//            [self.btn setTitleColor:cFinishSelectColor forState:(UIControlStateHighlighted)];
//            _shapeLayer.fillColor = cFinishColor.CGColor;
//            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;
//        }
//            break;
//        case StatusTypeDoing:
//        {
//            [self.btn setTitleColor:cDoingSelectColor forState:(UIControlStateHighlighted)];
//            _shapeLayer.fillColor = cDoingColor.CGColor;
//            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;
//        }
//            break;
//        case StatusTypeNotStart:
//        {
//            [self.btn setTitleColor:cNotStartSelectColor forState:(UIControlStateHighlighted)];
//            _shapeLayer.fillColor = cNotStartColor.CGColor;
//            _shapeLayer.strokeColor = cGrayBorder.CGColor;
//        }
//            break;
//        case StatusTypeNull:
//        {
//            _shapeLayer.fillColor = [UIColor clearColor].CGColor;
//            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;
//        }
//            break;
//            
//            
//        default:
//            break;
//    }
//
//}
//
//- (void)setPartOtherType:(Part *)partOtherType{
//    _partOtherType = partOtherType;
//    if (!partOtherType.cid) {
//        self.btn.enabled = NO;
//    }
//    [self.btn setTitle:partOtherType.name forState:(UIControlStateNormal)];
//    // -----改----->状态：0未添加到生产任务、1未收盘、2已收盘
//    switch (partOtherType.states.integerValue) {
//        case 2:
//        {
//            [self.btn setTitleColor:cFinishSelectColor forState:(UIControlStateHighlighted)];
//            _shapeLayer.fillColor = cFinishColor.CGColor;
//            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;
//        }
//            break;
//        case 1:
//        {
//            [self.btn setTitleColor:cDoingSelectColor forState:(UIControlStateHighlighted)];
//            _shapeLayer.fillColor = cDoingColor.CGColor;
//            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;
//        }
//            break;
//        case 0:
//        {
//            [self.btn setTitleColor:cNotStartSelectColor forState:(UIControlStateHighlighted)];
//            _shapeLayer.fillColor = cNotStartColor.CGColor;
//            _shapeLayer.strokeColor = cGrayBorder.CGColor;
//        }
//            break;
//        case StatusTypeNull:
//        {
//            _shapeLayer.fillColor = [UIColor clearColor].CGColor;
//            _shapeLayer.strokeColor = [UIColor clearColor].CGColor;
//        }
//            break;
//            
//            
//        default:
//            break;
//    }
//
//}
//-(void)setBgfloor:(Floor *)bgfloor{
////    _bgfloor = bgfloor;
////    switch (bgfloor.states.integerValue) {
////        case StatusTypeFinish:
////        {
////            [self setBackgroundColor:cFinishColor];
////            self.layer.borderColor = [UIColor clearColor].CGColor;
////            self.layer.borderWidth = 1;
////        }
////            break;
////        case StatusTypeDoing:
////        {
////            [self setBackgroundColor:cDoingColor];
////            self.layer.borderColor = [UIColor clearColor].CGColor;
////            self.layer.borderWidth = 1;
////        }
////            break;
////        case StatusTypeNotStart:
////        {
////            [self setBackgroundColor:cNotStartColor];
////            self.layer.borderColor = cGrayBorder.CGColor;
////            self.layer.borderWidth = 1;
////        }
////            break;
////        case StatusTypeNull:
////        {
////            [self setBackgroundColor:[UIColor clearColor]];
////            self.layer.borderColor = [UIColor clearColor].CGColor;
////            self.layer.borderWidth = 1;
////        }
////            break;
////            
////            
////        default:
////            break;
////    }
//
//}
//#endif
//
//#pragma mark - Action
//
//-(void)btnClick{
//    if ([self.delegate respondsToSelector:@selector(buildBtnSelect:)]) {
//        [self.delegate buildBtnSelect:self.build];
//    }
//    if ([self.delegate respondsToSelector:@selector(floorBtnSelect:)]) {
//        [self.delegate floorBtnSelect:self.floor];
//    }
//    if ([self.delegate respondsToSelector:@selector(partBtnSelect:)]) {
//        [self.delegate partBtnSelect:self.part];
//    }
//}
//@end
