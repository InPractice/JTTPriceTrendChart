//
//  JTTLineChartView.m
//  PriceTrendChart
//
//  Created by julius on 14-7-9.
//  Copyright (c) 2014年 julius. All rights reserved.
//

#import "JTTLineChartView.h"
#import "JTTCoordinateValuesView.h"
#import "JTTCoordinateSystemView.h"



@implementation JTTLineChartViewComponent

@end


@interface JTTLineChartView ()
{
    
    int x; //左上角坐标
    int y;
    
    int ox;//左下角坐标
    int oy;
    
    int ex;//右下角坐标
    int ey;

    
    JTTCoordinateSystemView *_coordinateSystemView;
    JTTCoordinateValuesView *_coordinateValuesView;
}
@end

@implementation JTTLineChartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _coordinateSystemView = [[JTTCoordinateSystemView alloc]init];
        _coordinateValuesView = [[JTTCoordinateValuesView alloc]init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [_coordinateSystemView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    [_coordinateSystemView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_coordinateSystemView];
    
    [_coordinateValuesView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    [_coordinateValuesView setFrame:CGRectMake(0, 0, 640, self.frame.size.height)];
    _coordinateValuesView.components = self.components;
    _coordinateValuesView.maxDatas = self.maxDatas;
    
    UIScrollView *_coordinateValuesScrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width-40, self.frame.size.height)];
    _coordinateValuesScrollView.contentSize = _coordinateValuesView.frame.size;
    [_coordinateValuesScrollView addSubview:_coordinateValuesView];
    [self addSubview:_coordinateValuesScrollView];
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
