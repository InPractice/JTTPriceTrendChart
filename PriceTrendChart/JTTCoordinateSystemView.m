//
//  JTTCoordinateSystemView.m
//  PriceTrendChart
//
//  Created by julius on 14-7-9.
//  Copyright (c) 2014年 julius. All rights reserved.
//

#import "JTTCoordinateSystemView.h"

@interface JTTCoordinateSystemView ()
{
    int x;
    int y;
    
    int ox;
    int oy;
    
    int ex;
    int ey;
}
@end

@implementation JTTCoordinateSystemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self initData];
    [self drawCoordinate];
}
- (void)initData
{
    
    x = 0;
    y = 0;
    
    ox = x;
    oy = y + self.frame.size.height-40 ;
    
    ex = x + self.frame.size.width-40;
    ey = oy;
    
    
    
}


- (void)drawCoordinate
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //开始画坐标轴
    
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    //直线宽度
    
    CGContextSetLineWidth(context,1.0);
    
    //设置颜色
    
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1.0);
    
    //开始绘制
    
    CGContextBeginPath(context);
    
    //左下角点
    CGContextMoveToPoint(context, ox, oy);
    
    //右下角点
    CGContextAddLineToPoint(context, ex, ey);
    //右上角点
    
    CGContextAddLineToPoint(context, ex, y);
    
    
    //绘制完成
    
    CGContextStrokePath(context);
    
    
    for (int j=1 ; j<8; j++) {
        NSString *avgStr = [NSString stringWithFormat:@"%d万",j];
        
        [avgStr drawInRect:CGRectMake(ex+5, ey -j*40, 40, 20) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f],NSForegroundColorAttributeName:[UIColor redColor]}];
    }
    
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
