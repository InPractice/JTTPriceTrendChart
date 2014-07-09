//
//  JTTLineChartView.h
//  PriceTrendChart
//
//  Created by julius on 14-7-9.
//  Copyright (c) 2014年 julius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTTLineChartViewComponent : NSObject
{
}

@property (nonatomic, assign) BOOL shouldLabelValues;
@property (nonatomic, retain) NSArray *points;
@property (nonatomic, retain) UIColor *colour;
@property (nonatomic, retain) NSString *title, *labelFormat;

@end


@interface JTTLineChartView : UIView

@property (nonatomic,strong) NSArray *maxDatas;
@property (nonatomic,strong) NSMutableArray *components;


@end
