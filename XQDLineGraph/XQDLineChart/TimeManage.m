//
//  TimeManage.m
//  DVLineChart
//
//  Created by 徐其东 on 16/6/24.
//  Copyright © 2016年 Fire. All rights reserved.
//

#import "TimeManage.h"

@implementation TimeManage


+ (NSArray*)allPoint:(NSArray*)xarr{
    
    NSMutableArray *muArr = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<xarr.count; i++) {
        NSDictionary *dic = @{@"time":xarr[i],@"value":[NSString stringWithFormat:@"%d",arc4random()%4+5]};
        [muArr addObject:dic];
    }
    
    return muArr;
}


+ (NSArray*)XAllTimeAndStarTime:(NSString*)startTime andEndTime:(NSString*)endTime {
    
    if (startTime==nil) {
        startTime = endTime;
    }
    startTime =  [startTime stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    endTime =  [endTime stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    
    [[NSUserDefaults standardUserDefaults]setObject:startTime forKey:@"xStartTime"];
    
    //返回x轴的时间点
    //开始时间到结束时间，每三分钟一个点
    NSString *format = @"yyyy-MM-dd HH:mm:00";
    NSString *startSp = [TimeManage timeSp:startTime format:format];
    NSString *endSp = [TimeManage timeSp:endTime format:format];
    NSInteger addTimeSp = 3*60;
    NSInteger count = ([endSp integerValue]-[startSp integerValue])/addTimeSp+5;
    
    NSMutableArray *xAllArrMu = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<count; i++) {
        NSString *timeStr = [TimeManage getAfterTime:3*i nowTime:startTime format:format];
//        timeStr = [timeStr substringWithRange:NSMakeRange(10, 6)];
        [xAllArrMu addObject:timeStr];
    }
    
    return xAllArrMu;
}

+ (double)PointX:(NSString*)nowTime {
    NSString *startTime = [[NSUserDefaults standardUserDefaults] objectForKey:@"xStartTime"];
    
    NSString *format = @"yyyy-MM-dd HH:mm:00";
    NSString *startSp = [TimeManage timeSp:startTime format:format];
    NSString *nowSp = [TimeManage timeSp:nowTime format:format];
    NSInteger addTimeSp = 3*60;
    double yushu = ([nowSp integerValue]-[startSp integerValue])%addTimeSp;
    double count = ([nowSp integerValue]-[startSp integerValue])/addTimeSp+yushu/180;

    return count;
}





//返回时间戳
+(NSString*)timeSp:(NSString*)time format:(NSString*)format{
    NSString* string = time;
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:format];
    NSDate* inputDate = [inputFormatter dateFromString:string];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[inputDate timeIntervalSince1970]];
    return timeSp;
}

+(NSString*)getAfterTime:(int)minth nowTime:(NSString *)time format:(NSString*)format{
    
    //    NSLog(@"%@",time);
    //将字符串转时间格式
    NSString* string = time;
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:format];
    NSDate* inputDate = [inputFormatter dateFromString:string];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[inputDate timeIntervalSince1970]];
    //    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    
    //增加后的时间戳
    NSInteger addTimeSp = [timeSp integerValue]+minth*60;
    //    NSLog(@"addDate = %ld",addTimeSp);
    
    //将时间戳转时间格式
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:addTimeSp];
    //    NSLog(@"%ld  = %@",addTimeSp,confromTimesp);
    
    
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:format];
    NSString *str = [outputFormatter stringFromDate:confromTimesp];
    //    NSLog(@"testDate:%@", str);
    
    return str;
}

@end
