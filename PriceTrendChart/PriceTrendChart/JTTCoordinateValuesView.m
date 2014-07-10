//
//  JTTCoordinateValuesView.m
//  PriceTrendChart
//
//  Created by julius on 14-7-9.
//  Copyright (c) 2014年 julius. All rights reserved.
//

#import "JTTCoordinateValuesView.h"
#import "JTTLineChartView.h"

@interface JTTCoordinateValuesView ()
{
    int x;
    int y;
    
    int ox;
    int oy;
    
    int ex;
    int ey;
    
    
}
@end

@implementation JTTCoordinateValuesView

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
    [self drawLineChart];
}

- (void)drawLineChart
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    float circle_diameter = 10;//小圈直径
    float circle_stroke_width = 3;//小圈的边缘宽度
    float line_width = 4;//线的宽度
    float scale_max = 5;//纵坐标 最大值
    
    for (JTTLineChartViewComponent *component in self.components)
    {
        int last_x = 0;
        int last_y = 0;
        
        if (!component.colour)
        {
            component.colour = PCColorBlue;
        }
		
		for (int x_axis_index=0; x_axis_index<[component.points count]; x_axis_index++)
        {
            id object = [component.points objectAtIndex:x_axis_index];
			
			
            if (object!=[NSNull null] && object)
            {
                float value = [object floatValue];
				
				CGContextSetStrokeColorWithColor(context, [component.colour CGColor]);
                CGContextSetLineWidth(context, circle_stroke_width);
                
                int theX =   ex - (int)([component.points count]-1-x_axis_index)*40;
                int theY = ey - (value/scale_max)*200;
                
                if (last_x!=0 && last_y!=0)
                {
                    float last_x1 = last_x;
                    float last_y1 = last_y ;
                    float x1 = theX ;
                    float y1 = theY ;
                    
                    CGContextSetLineWidth(context, line_width);
                    CGContextMoveToPoint(context, last_x1, last_y1);
                    CGContextAddLineToPoint(context, x1, y1);
                    CGContextStrokePath(context);
                    
                    
                    CGRect circleRect = CGRectMake(last_x-circle_diameter/2, last_y-circle_diameter/2, circle_diameter,circle_diameter);
                    CGContextStrokeEllipseInRect(context, circleRect);
                    
                    CGContextSetFillColorWithColor(context, [component.colour CGColor]);
                    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
                    CGContextFillEllipseInRect(context, circleRect);
                }
                
				
                
                last_x = theX;
                last_y = theY;
            }
            CGRect circleRect = CGRectMake(last_x-circle_diameter/2, last_y-circle_diameter/2, circle_diameter,circle_diameter);
            CGContextStrokeEllipseInRect(context, circleRect);
            
            CGContextSetFillColorWithColor(context, [component.colour CGColor]);
            CGContextSetRGBFillColor(context, 1, 1, 1, 1);
            CGContextFillEllipseInRect(context, circleRect);
            
        }
        
    }
    
}


- (void)initData
{
    
    x = 0;
    y = 0;
    
    ox = x;
    oy = y + self.bounds.size.height-40;
    
    ex = x + self.bounds.size.width-20;
    ey = oy;
    
    
    
}



- (void)drawCoordinate
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    
    
    
    for (int i=1 ; i<self.maxDatas.count+1; i++) {
        NSString *avgStr = [NSString stringWithFormat:@"%u月",(self.maxDatas.count-i)%12+self.maxDatas.count/12];
        
        [avgStr drawInRect:CGRectMake(ex-(i-1)*40-5, oy + 10, 25, 20) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10.0f],NSForegroundColorAttributeName:[UIColor redColor]}];
    }
    
    
    
    //    for (int j=1 ; j<6; j++) {
    //        NSString *avgStr = [NSString stringWithFormat:@"%d万",j];
    //
    //        [avgStr drawInRect:CGRectMake(ex+5, ey -j*40, 40, 20) withAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f],NSForegroundColorAttributeName:[UIColor redColor]}];
    //    }
    
    
    //画同时间值 直线
    
    
    for (int i = 0; i<self.maxDatas.count; i++) {
        
        CGContextSetRGBStrokeColor(context, 0.7, 0.7, 0.7, 1.0);
        
        CGContextBeginPath(context);
        
        CGContextMoveToPoint(context, ex-i*40, oy);
        CGContextAddLineToPoint(context, ex-i*40 ,ey - ([[self.maxDatas objectAtIndex:self.maxDatas.count-1-i] floatValue]/5)*200);
        
        CGContextStrokePath(context);
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
