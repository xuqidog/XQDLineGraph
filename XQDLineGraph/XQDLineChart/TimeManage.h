//
//  TimeManage.h
//  DVLineChart
//
//  Created by 徐其东 on 16/6/24.
//  Copyright © 2016年 Fire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeManage : NSObject


+ (NSArray*)allPoint:(NSArray*)xarr;


/**
 *  @author 徐其东（http://www.xuqidong.com）, 16-06-24 10:06:41
 *
 *  返回x轴的坐标
 *
 *  @param startTime 开始时间
 *  @param endTime   结束时间
 *
 *  @return 返回x轴的坐标arr
 */
+ (NSArray*)XAllTimeAndStarTime:(NSString*)startTime andEndTime:(NSString*)endTime;



/**
 *  @author 徐其东（http://www.xuqidong.com）, 16-06-24 13:06:12
 *
 *  返回在x轴的下标
 *
 *  @param nowTime 当前点的时间
 *
 *  @return 返回在x轴的下标
 */
+ (double)PointX:(NSString*)nowTime;



+(NSString*)getAfterTime:(int)minth nowTime:(NSString *)time format:(NSString*)format;
@end
