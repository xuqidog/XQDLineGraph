//
//  XQDScrollView.m
//  XQDLineGraph
//
//  Created by 徐其东 on 16/7/15.
//  Copyright © 2016年 xuqidong. All rights reserved.
//

#import "XQDScrollView.h"
#import "XQDApi.h"


@interface XQDScrollView()
{
    XQDLineChart *_lineChart;
}

@end


@implementation XQDScrollView
//
//- (instancetype)initWithFrame:(CGRect)frame andSelf:(id)lineChart
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        _lineChart = (XQDLineChart*)lineChart;
//        self.backgroundColor = _lineChart.chartLine_Color;
//        
//    }
//    return self;
//}
//
//
//
//- (void)drawRect:(CGRect)rect
//{
//    NSLog(@"scrollview draw");
//    
//    [self drawX];
//    
//    
//}
//
//
////x轴
//- (void)drawX{
//    //x轴
//    CGFloat x_w = _lineChart.chartLine_Xarr.count*_lineChart.chartLine_pointAndPointX;
//    CGFloat x_h = _lineChart.chartLine_fream.size.height-20-CHARTLINE_FOOT_H+1;
//    
//    
//    // 创建layer并设置属性
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.fillColor = [UIColor clearColor].CGColor;
//    layer.lineWidth =  1.0f;
//    layer.lineCap = kCALineCapRound;
//    layer.lineJoin = kCALineJoinRound;
//    layer.strokeColor = _lineChart.chartLine_XYColor.CGColor;
//    [self.layer addSublayer:layer];
//    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(_lineChart.chartLine_yWith,x_h)];
//    [path addLineToPoint:CGPointMake(x_w, x_h)];
//    [path closePath];
//    
//    layer.path = path.CGPath;
//    
//    // 创建Animation
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    animation.fromValue = @(0.0);
//    animation.toValue = @(1.0);
//    layer.autoreverses = NO;
//    animation.duration = 1.0;
//    
//    [layer addAnimation:animation forKey:nil];
//    layer.strokeEnd = 1;
//    
//  
//    //x轴刻度
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色
//    for (int i=0; i<_lineChart.chartLine_Xarr.count; i++) {
//        
//        [_lineChart.chartLine_Xarr[i] drawInRect:CGRectMake(10+100*i, x_h, 100, 20) withAttributes:@{NSFontAttributeName:XQ_FONT(CHARTLINE_Y_FONT),NSForegroundColorAttributeName:_lineChart.chartLine_XYTextColor}];
//    }
//    
//    
//    for (NSString *y in _lineChart.chartLine_Xarr) {
//        [y drawInRect:CGRectMake(10, x_h, 200, 20) withAttributes:@{NSFontAttributeName:XQ_FONT(CHARTLINE_Y_FONT),NSForegroundColorAttributeName:_lineChart.chartLine_XYTextColor}];
//    }
//}


////x轴
//- (void)drawX{
//    
//    //y轴刻度
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色
//    [@"ssssss" drawInRect:CGRectMake(-10, 10, 50, 40) withAttributes:@{NSFontAttributeName:XQ_FONT(CHARTLINE_Y_FONT),NSForegroundColorAttributeName:[UIColor redColor]}];
//    
//}


@end
