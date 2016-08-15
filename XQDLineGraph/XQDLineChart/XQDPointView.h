//
//  XQDPointView.h
//  XQDLineGraph
//
//  Created by 徐其东 on 16/7/15.
//  Copyright © 2016年 xuqidong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XQDColor.h"
#import "XQDApi.h"

@interface XQDPointView : UIView


@property (nonatomic, strong)  XQDColor *xqdColor;/*线和点的颜色*/


//重写init
-(instancetype)initWithFrame:(CGRect)frame andXQDColor:(XQDColor *)xqdColor;


//刷新
- (void)refreshView:(CGRect)frame;

@end
