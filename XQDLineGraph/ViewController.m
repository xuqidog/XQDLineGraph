//
//  ViewController.m
//  XQDLineGraph
//
//  Created by 徐其东 on 16/7/14.
//  Copyright © 2016年 xuqidong. All rights reserved.
//

#import "ViewController.h"
#import "XQDApi.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    XQDColor *xqd = [XQDColor new];
    xqd.chartLine_leftDistance = 0.0;
    xqd.chartLine_rightDistance = 0.0;
    xqd.chartLine_yWith = 35.0;
    xqd.chartLine_XYColor = CHARTLINE_Y_LINE_COLOR;
    xqd.chartLine_YMax = 20;//y轴最大值
    xqd.chartLine_Yarr = @[@"15",@"11.1",@"7.8",@"6.1",@"3.9",@"1.7",@"0"];
    xqd.chartLine_YLineArr = @[@"15",@"11.1",@"7.8",@"6.1",@"3.9",@"1.7"];
    xqd.chartLine_XYTextColor = RGB(74, 74, 74);
    xqd.chartLine_Xarr = [TimeManage XAllTimeAndStarTime:@"2016-07-14 18:50:00" andEndTime:@"2016-07-14 23:50:00"];
    xqd.chartLine_PointArr = @[[TimeManage allPoint:xqd.chartLine_Xarr]];
    xqd.chartLine_LineColorArr = @[RGB(67, 230, 250)];
    xqd.chartLine_pointAndPointX = 40.0;
    xqd.chartLine_isSetGraph = YES;
    xqd.chartLine_duration = 0;
    xqd.chartLine_tap = YES;
    xqd.chartLine_Color = [UIColor whiteColor];
    xqd.chartLine_bigPointArr = @[@{@"time":@"2016-07-14 18:59:00",@"value":@"7"},
                                  @{@"time":@"2016-07-14 19:10:00",@"value":@"6"},
                                  @{@"time":@"2016-07-14 19:19:00",@"value":@"10"},
                                  @{@"time":@"2016-07-14 19:30:00",@"value":@"6"}];
    
    xqd.chartLine_oneFloorArr = @[@{@"time":@"2016-07-14 18:59:00",@"long":@"10"},
                                  @{@"time":@"2016-07-14 19:59:00",@"long":@"15"}];
    
    xqd.chartLine_twoFloorArr = @[@{@"time":@"2016-07-14 18:59:00",@"long":@"10"},
                                  @{@"time":@"2016-07-14 19:20:00",@"long":@"9"}];
    
    xqd.chartLine_threeFloorArr = @[@{@"time":@"2016-07-14 18:59:00",@"long":@"10"},
                                  @{@"time":@"2016-07-14 19:20:00",@"long":@"9"}];
    
    xqd.chartLine_fourFloorArr = @[@{@"time":@"2016-07-14 18:59:00",@"long":@"10"},
                                   @{@"time":@"2016-07-14 19:20:00",@"long":@"9"}];
    
    
    XQDLineChart *XQD = [[XQDLineChart alloc] initWithFrame:CCR(0, 64, SCREEN_WIDTH, 300) andXQDColor:xqd];
    [self.view addSubview:XQD];
    [XQD initLineChart];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
