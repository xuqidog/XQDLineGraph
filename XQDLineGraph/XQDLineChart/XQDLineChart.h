//
//  XQDLineChart.h
//  XQDLineGraph
//
//  Created by 徐其东 on 16/7/14.
//  Copyright © 2016年 xuqidong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XQDApi.h"
#import "XQDScrollView.h"
#import "XQDColor.h"

@interface XQDLineChart : UIView


@property (nonatomic, strong)  XQDColor *xqdColor;/*线和点的颜色*/


@property (nonatomic, strong) UIScrollView *mainScroll;/**/

@property (nonatomic, assign) CGRect chartLine_fream;

////坐标点数组
//@property (nonatomic, strong) NSArray *chartLine_Xarr;/*图表的 x轴 坐标点*/
//@property (nonatomic, strong) NSArray *chartLine_Yarr;/*图表的 y轴 坐标点*/
//@property (nonatomic, strong) NSArray *chartLine_PointArr;/*图表的 折线坐标点 数组*/
//@property (nonatomic, strong) NSArray *chartLine_bigPointArr;/*特殊点数组*/
//
////距离
//@property (nonatomic, assign) CGFloat chartLine_YMax;/*y轴的最大值*/
//@property (nonatomic, assign) CGFloat chartLine_leftDistance;/*左侧边缘的距离*/
//@property (nonatomic, assign) CGFloat chartLine_rightDistance;/*右侧边缘的距离*/
//@property (nonatomic, assign) CGFloat chartLine_yWith;/*y轴的宽度*/
//@property (nonatomic, assign) CGFloat chartLine_pointAndPointX;/*点与点的距离*/
//@property (nonatomic, assign) CGFloat chartLine_pointAndPointX1;/*点与点的距离*/
//@property (nonatomic, assign) CGFloat chartLine_duration;/*动画时间*/
//@property (nonatomic, assign) BOOL chartLine_isSetGraph;/*曲线和折线的切换 默认折线NO*/
//@property (nonatomic, assign) BOOL chartLine_isHaveFoot;/*是否有底部展示*/
//@property (nonatomic, assign) BOOL chartLine_tap;/*手势 放大缩小*/
//
//
////颜色
//@property (nonatomic, strong) UIColor *chartLine_Color;/*图表背景 的颜色*/
//@property (nonatomic, strong) UIColor *chartLine_XYColor;/*图表 x轴 y轴 的颜色*/
//@property (nonatomic, strong) UIColor *chartLine_XYTextColor;/*图表 x轴 y轴 字 的颜色*/
//@property (nonatomic, strong) NSArray *chartLine_LineColorArr;/*图表 x轴 y轴 的颜色*/
//@property (nonatomic, strong) NSArray *chartLine_PointColorArr;/*图表 曲线上点的 的颜色*/



/*初始化图表*/
- (void)initLineChart;
//重写init
- (instancetype)initWithFrame:(CGRect)frame andXQDColor:(XQDColor*)xqdColor;

@end
