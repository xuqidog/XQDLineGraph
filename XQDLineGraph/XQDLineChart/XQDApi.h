//
//  XQDApi.h
//  XQDLineGraph
//
//  Created by 徐其东 on 16/7/14.
//  Copyright © 2016年 xuqidong. All rights reserved.
//

#ifndef XQDApi_h
#define XQDApi_h


#define CHARTLINE_Y_LEFT -100 /*y轴左侧的距离，超出部分*/
#define CHARTLINE_FOOT_H 75 /*底部的注释高度*/
#define CHARTLINE_Y_FONT 14 /*y轴的字体大小*/
#define CHARTLINE_FLOOR_H 15 /*floor 的高度*/
#define CHARTLINE_Y_LINE_COLOR RGB(208, 233, 255) /*y轴的颜色*/
#define CHARTLINE_Y_FILL_COLOR RGB(227, 242, 255) /*填充颜色*/






#define CCR(__A__,__B__,__C__,__D__) CGRectMake(__A__, __B__, __C__, __D__)


#define KS_C_RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green: g / 255.0f blue:b / 255.0f alpha:a]
#define RGBA(r,g,b,a) KS_C_RGBA(r,g,b,a)
#define RGB(r,g,b)    KS_C_RGBA(r,g,b,1)

#define XQ_FONT_B(s)          [UIFont boldSystemFontOfSize:s]
#define XQ_FONT(s)            [UIFont systemFontOfSize:s]
#define XQ_AddImg(s)          [UIImage imageNamed:s]

//deBug
#define DLog(format, ...) do {                                               \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "-------\n");                                               \
} while (0)

//Frame
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)



#import "TimeManage.h"
#import "XQDLineChart.h"
#import "XQDColor.h"



#endif /* XQDApi_h */
