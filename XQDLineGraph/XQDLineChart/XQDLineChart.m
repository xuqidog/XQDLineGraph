//
//  XQDLineChart.m
//  XQDLineGraph
//
//  Created by 徐其东 on 16/7/14.
//  Copyright © 2016年 xuqidong. All rights reserved.
//

#import "XQDLineChart.h"
#import "TimeManage.h"
#import "XQDPointView.h"

@interface XQDLineChart()
{
    NSMutableArray *layer_lineArr;
    NSMutableArray *path_lineArr;
//    CAShapeLayer *layer_line;
//    UIBezierPath *path_line;
    CAShapeLayer *layer_x;
    UIBezierPath *path_x;
    UIBezierPath *path_Y;
    XQDPointView *point;
}

@end


@implementation XQDLineChart

- (instancetype)initWithFrame:(CGRect)frame andXQDColor:(XQDColor*)xqdColor
{
    self = [super initWithFrame:frame];
    if (self) {
        _xqdColor = xqdColor;
        
        self.backgroundColor = _xqdColor.chartLine_Color;
        _chartLine_fream = frame;
        _xqdColor.chartLine_fream = frame;
        _xqdColor.chartLine_pointAndPointX1 = _xqdColor.chartLine_pointAndPointX;
        _xqdColor.chartLine_pointAndPointX = _xqdColor.chartLine_pointAndPointX;
        
        layer_x = [CAShapeLayer layer];
        path_x = [UIBezierPath bezierPath];
        path_Y = [UIBezierPath bezierPath];
    
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    DLog(@"drawRect");
    [self drawY];
}

- (void)initLineChart{
    _mainScroll = [[UIScrollView alloc] initWithFrame:CCR(_xqdColor.chartLine_leftDistance+_xqdColor.chartLine_yWith,
                                                          0, _chartLine_fream.size.width-_xqdColor.chartLine_leftDistance-_xqdColor.chartLine_rightDistance-_xqdColor.chartLine_yWith,
                                                          _chartLine_fream.size.height)];
    _mainScroll.backgroundColor = _xqdColor.chartLine_Color;
    _mainScroll.backgroundColor = [UIColor clearColor];
    [self addSubview:_mainScroll];
    _mainScroll.contentSize = CGSizeMake(_xqdColor.chartLine_Xarr.count*_xqdColor.chartLine_pointAndPointX, _chartLine_fream.size.height);
    
    point = [[XQDPointView alloc] initWithFrame:CCR(0, 0, _mainScroll.contentSize.width, _mainScroll.contentSize.height) andXQDColor:_xqdColor];
    [_mainScroll addSubview:point];

    
    if (_xqdColor.chartLine_tap) {
        // 1. 创建一个"轻触手势对象"
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        
        // 点击几次
        tap.numberOfTapsRequired = 2;
        [_mainScroll addGestureRecognizer:tap];
        
        // 2. 捏合手势
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
        [_mainScroll addGestureRecognizer:pinch];
    }
}

//y轴
- (void)drawY{
    NSString *str = @"(mmol/L)";
    [str drawInRect:CGRectMake(5, 0, 100, 20) withAttributes:@{NSFontAttributeName:XQ_FONT(10),NSForegroundColorAttributeName:_xqdColor.chartLine_XYTextColor}];
    
    NSString *str1 = @"蓝色区域为正常范围";
    [str1 drawInRect:CGRectMake(SCREEN_WIDTH-130, 0, 130, 20) withAttributes:@{NSFontAttributeName:XQ_FONT(12),NSForegroundColorAttributeName:RGB(168, 168, 168)}];
    
    
    //y轴
    CGFloat x_h = _chartLine_fream.size.height-20-CHARTLINE_FOOT_H;
    
//    UIBezierPath *path = [UIBezierPath bezierPath];
    [path_Y removeAllPoints];
    [path_Y moveToPoint:CGPointMake(_xqdColor.chartLine_yWith-1,20)];
    [path_Y addLineToPoint:CGPointMake(_xqdColor.chartLine_yWith-1, x_h)];
    [path_Y closePath];
    
    path_Y.lineWidth = 1.0f;
    UIColor *strokeColor = _xqdColor.chartLine_XYColor;
    [strokeColor set];
    [path_Y stroke];
    
    //y轴刻度
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色
    for (NSString *y in _xqdColor.chartLine_Yarr) {
        CGFloat top = (x_h - (x_h/_xqdColor.chartLine_YMax)*[y floatValue])-10;
        [y drawInRect:CGRectMake(10, top, _xqdColor.chartLine_yWith, 20) withAttributes:@{NSFontAttributeName:XQ_FONT(CHARTLINE_Y_FONT),NSForegroundColorAttributeName:_xqdColor.chartLine_XYTextColor}];
    }
    
}

// 轻触手势监听方法
- (void)tapGesture:(UITapGestureRecognizer *)tap {
    DLog(@"轻触手势");
    if (_mainScroll.contentSize.width == _mainScroll.frame.size.width) {//需要放大
        _xqdColor.chartLine_pointAndPointX = _xqdColor.chartLine_pointAndPointX1;
        _mainScroll.contentSize = CGSizeMake(_xqdColor.chartLine_Xarr.count*_xqdColor.chartLine_pointAndPointX, _mainScroll.frame.size.height);
    }else{//需要缩小
        _xqdColor.chartLine_pointAndPointX = _mainScroll.frame.size.width/_xqdColor.chartLine_Xarr.count;
        _mainScroll.contentSize = CGSizeMake(_mainScroll.frame.size.width, _mainScroll.frame.size.height);
    }
//    [self setNeedsDisplay];
    [self setRefresh];
}

// 捏合手势监听方法
- (void)pinchGesture:(UIPinchGestureRecognizer *)recognizer
{
    DLog(@"捏合手势");
    CGFloat S_w =  _mainScroll.contentSize.width * recognizer.scale;//缩小后的scrollview的容积宽
    CGFloat max_w =  _xqdColor.chartLine_pointAndPointX1*_xqdColor.chartLine_Xarr.count;
    if (S_w>_mainScroll.frame.size.width && S_w<max_w) {
        [UIView animateWithDuration:0.25 animations:^{
            _mainScroll.contentSize = CGSizeMake(S_w, _mainScroll.contentSize.height);
        }];
        _xqdColor.chartLine_pointAndPointX = S_w/_xqdColor.chartLine_Xarr.count;
//        [self setNeedsDisplay];
        [self setRefresh];
    }else if (S_w>max_w){
        [UIView animateWithDuration:0.25 animations:^{
            _mainScroll.contentSize = CGSizeMake(max_w, _mainScroll.contentSize.height);
        }];
        _xqdColor.chartLine_pointAndPointX = _xqdColor.chartLine_pointAndPointX1;
//        [self setNeedsDisplay];
        [self setRefresh];
    }else if (S_w<_mainScroll.frame.size.width){
        [UIView animateWithDuration:0.25 animations:^{
            _mainScroll.contentSize = CGSizeMake(_mainScroll.frame.size.width, _mainScroll.contentSize.height);
        }];
        _xqdColor.chartLine_pointAndPointX = _mainScroll.frame.size.width/_xqdColor.chartLine_Xarr.count;
//        [self setNeedsDisplay];
        [self setRefresh];
    }
}


- (void)setRefresh{
    [point refreshView:CCR(0, 0, _mainScroll.contentSize.width, _mainScroll.contentSize.height)];
}
@end
