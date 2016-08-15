//
//  XQDScrollView.h
//  XQDLineGraph
//
//  Created by 徐其东 on 16/7/15.
//  Copyright © 2016年 xuqidong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XQDLineChart.h"


@interface XQDScrollView : UIScrollView


@property (nonatomic, strong) UIView *lineChart;
//重写
- (instancetype)initWithFrame:(CGRect)frame andSelf:(id)lineChart;

@end
