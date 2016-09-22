//
//  RadarMapView.m
//  RadarMap
//
//  Created by A053 on 16/9/13.
//  Copyright © 2016年 Yvan. All rights reserved.
//

#import "RadarMapView.h"

@implementation Element

- (void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key {}
@end

@interface RadarMapView ()

// 元素数组
@property (strong, nonatomic) NSArray <Element *>*elements;

@end

// 每一个主干的长度
static float element_w = 0;
// 主干到View预留的空白部分宽度
static float border_w  = 5;
// 中心点的横坐标
static float center_w  = 0;
// 中心点的纵坐标
static float center_h  = 0;

@implementation RadarMapView

#pragma mark - 画雷达主干图

- (void)buildRadarMap {
    if (self.elements.count<3) return;
    
    // 获取画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 划线颜色
    if (self.trunkLineColor)
        CGContextSetStrokeColorWithColor(context, self.trunkLineColor.CGColor);
    else
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    // 划线宽度
    if (self.lineWidth)
        CGContextSetLineWidth(context, self.lineWidth);
    else
        CGContextSetLineWidth(context, 1);
    // 起点坐标
    CGContextMoveToPoint(context, center_w, center_h);
    // 第一条线
    CGContextAddLineToPoint(context, center_w, center_h - element_w);
    
    //画元素主干
    for (int i = 1; i <self.elements.count; i++) {
        float x   = 0;
        float y   = 0;
        double pi = (M_PI*2.0/(self.elements.count))*i;
        
        // 计算主干落点坐标
        Coordinate(pi, element_w, center_w, center_h,&x, &y);
        // 设置每次的初始点坐标
        CGContextMoveToPoint(context, center_w, center_h);
        // 设置终点坐标
        CGContextAddLineToPoint(context, x, y);
    }
    CGContextStrokePath(context);
}

#pragma mark - 画雷达分等分图

- (void)buildPart {
    
    float r = self.part<=1?1:self.part;

    // 获取画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 划线颜色
    if (self.partLineColor)
        CGContextSetStrokeColorWithColor(context, self.partLineColor.CGColor);
    else
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    // 划线宽度
    if (self.lineWidth)
        CGContextSetLineWidth(context, self.lineWidth);
    else
        CGContextSetLineWidth(context, 1);
    // 话分割线
    for (int j = 0; j<r; j++) {
        // 设置每次的初始点坐标
        CGContextMoveToPoint(context, center_w, border_w);
        // 画百分比分部
        for (int i = 1; i<=self.elements.count; i++) {
            float x   = 0;
            float y   = 0;
            double pi = (M_PI*2.0/(self.elements.count))*i;
            Coordinate(pi,element_w*(r-j)/r, center_w, center_h,&x, &y);
            
            if (i == 1) {
                CGContextMoveToPoint(context, center_w, border_w + element_w*j/r);
            }
            if (i == self.elements.count) {
                CGContextAddLineToPoint(context, center_w, border_w + element_w*j/r);
            } else {
                CGContextAddLineToPoint(context, x, y);
            }
        }

    }
    CGContextStrokePath(context);
}

#pragma mark - 画百分比占比线

- (void)buildPercent {

    // 获取画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 划线颜色
    if (self.percentLineColor)
        CGContextSetStrokeColorWithColor(context, self.percentLineColor.CGColor);
    else
        CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    // 划线宽度
    if (self.lineWidth)
        CGContextSetLineWidth(context, self.lineWidth);
    else
        CGContextSetLineWidth(context, 1);

    Element *ele = self.elements[0];
    CGContextMoveToPoint(context, center_w, border_w +element_w*(1-ele.percent));
    for (int i = 1; i<=self.elements.count; i++) {
        float x   = 0;
        float y   = 0;
       
        if (i == self.elements.count) {
            //终点，最终回到开始点坐标
            Element *ele = self.elements[0];
            CGContextAddLineToPoint(context, center_w, border_w +element_w*(1-ele.percent));
        } else {
            Element *ele = self.elements[i];
            double pi = (M_PI*2.0/(self.elements.count))*i;
            Coordinate(pi,element_w*ele.percent, center_w, center_h,&x, &y);
            CGContextAddLineToPoint(context, x, y);
        }
    }
    CGContextStrokePath(context);
}


#pragma mark - 算落点坐标

void Coordinate (double pi, float l, float c_w , float c_h, float *x, float *y) {
    
    *x = c_w + sin(pi)*l;
    *y = c_h - cos(pi)*l;
}


- (void)setPart:(float)part {
    _part = part;
    [self setNeedsDisplay];
}

- (void)setTrunkLineColor:(UIColor *)trunkLineColor {
    _trunkLineColor =trunkLineColor;
    [self setNeedsDisplay];
}

- (void)setPartLineColor:(UIColor *)partLineColor {
    _partLineColor = partLineColor;
    [self setNeedsDisplay];
}

- (void)setPercentLineColor:(UIColor *)percentLineColor {
    _percentLineColor = percentLineColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (self.elements.count<3) return;
    [self buildRadarMap];
    [self buildPart];
    [self buildPercent];
}

- (instancetype)initWithFrame:(CGRect)frame Elements:(NSArray <Element *>*)elements {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.elements = elements;
        if (self.frame.size.width>self.frame.size.height)
            element_w = (self.frame.size.height-border_w*2)/2;
        else
            element_w = (self.frame.size.width-border_w*2)/2;
        
        center_w = self.frame.size.width/2;
        center_h = self.frame.size.height/2;

    }
    return self;
}


@end
