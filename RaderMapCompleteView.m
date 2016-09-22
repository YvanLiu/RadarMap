//
//  RaderMapCompleteView.m
//  RadarMap
//
//  Created by A053 on 16/9/22.
//  Copyright © 2016年 Yvan. All rights reserved.
//

#import "RaderMapCompleteView.h"

@interface RaderMapCompleteView()

@property (strong, nonatomic) NSArray *elements;
@property (strong, nonatomic) UIColor *lengthColor;
@end

static float radar_l  = 0;
static float center_w = 0;
static float center_h = 0;
@implementation RaderMapCompleteView

#pragma mark - 画雷达图主题部分

- (void)drawBody {
    
    // 获取画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 划线颜色
    if (self.lengthColor)
        CGContextSetStrokeColorWithColor(context, self.lengthColor.CGColor);
    else
        CGContextSetStrokeColorWithColor(context, RGB_M(148, 148, 148).CGColor);
    
    CGContextSetLineWidth(context, 1);
    // 起点坐标
    CGContextMoveToPoint(context, center_w, center_h);
    // 第一条线
    CGContextAddLineToPoint(context, center_w, center_h - radar_l);
    // 添加元素名称
    UILabel *bodyLabel = [self buildElementLabelWithText:self.elements[0] Frame:CGRectMake(center_w-LENGTH(30), center_h-radar_l-LENGTH(20), LENGTH(60), LENGTH(13)) Alignment:NSTextAlignmentCenter];
    [self addSubview:bodyLabel];
    
    //画元素主干
    for (int i = 1; i <self.elements.count; i++) {
        float x   = 0;
        float y   = 0;
        double pi = (M_PI*2.0/(self.elements.count))*i;
        // 计算主干落点坐标
        Coordinate_2(pi, radar_l, center_w, center_h,&x, &y);
        CGRect frame;
        if (x > center_w) {
            if (y > center_h) {
                frame = CGRectMake(x+LENGTH(5), y-LENGTH(7.5), LENGTH(60), LENGTH(13));
            } else if(y == center_h) {
                frame = CGRectMake(x+LENGTH(5), y-LENGTH(7.5), LENGTH(60), LENGTH(13));
            } else {
                frame = CGRectMake(x+LENGTH(5), y-LENGTH(7.5), LENGTH(60), LENGTH(13));
            }
        } else if (x == center_w) {
            if (y > center_h) {
                
            } else if(y == center_h) {
                
            } else {
                
            }
        } else {
            if (y > center_h) {
                
            } else if(y == center_h) {
                
            } else {
                
            }
        }
        
        // 设置每次的初始点坐标
        CGContextMoveToPoint(context, center_w, center_h);
        // 设置终点坐标
        CGContextAddLineToPoint(context, x, y);
    }
    CGContextStrokePath(context);

}

#pragma mark - 画雷达分等分图

- (void)buildPart {
    
    float r = 5.0f;
    
    // 获取画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 划线颜色
    if (self.lengthColor)
        CGContextSetStrokeColorWithColor(context, self.lengthColor.CGColor);
    else
        CGContextSetStrokeColorWithColor(context, RGB_M(148, 148, 148).CGColor);
    
    // 划线宽度
    CGContextSetLineWidth(context, 1);
    // 添加百分比
    UILabel *partLabel = [self buildPartLabelWithText:@"0" Frame:CGRectMake(center_w-LENGTH(25), center_h-LENGTH(3), LENGTH(20), LENGTH(6))];
    [self addSubview:partLabel];
    // 话分割线
    for (int j = 0; j<r; j++) {
        // 设置每次的初始点坐标
        CGContextMoveToPoint(context, center_w,center_h -radar_l);
        // 添加百分比
        UILabel *partLabels = [self buildPartLabelWithText:[NSString stringWithFormat:@"%.f",100*((r-j)/r)] Frame:CGRectMake(center_w-LENGTH(30), center_h -radar_l + radar_l*j/r-LENGTH(4), LENGTH(25), LENGTH(6))];
        [self addSubview:partLabels];
        
        // 画百分比分部
        for (int i = 1; i<=self.elements.count; i++) {
            float x   = 0;
            float y   = 0;
            double pi = (M_PI*2.0/(self.elements.count))*i;
            Coordinate_2(pi,radar_l*(r-j)/r, center_w, center_h,&x, &y);
            
            if (i == 1) {
                CGContextMoveToPoint(context, center_w, center_h -radar_l + radar_l*j/r);
            }
            if (i == self.elements.count) {
                CGContextAddLineToPoint(context, center_w, center_h -radar_l + radar_l*j/r);
            } else {
                CGContextAddLineToPoint(context, x, y);
            }
        }
        
    }
    CGContextStrokePath(context);
}


#pragma mark - 算落点坐标

void Coordinate_2 (double pi, float l, float c_w , float c_h, float *x, float *y) {
    *x = c_w + sin(pi)*l;
    *y = c_h - cos(pi)*l;
}

- (UILabel *)buildPartLabelWithText:(NSString *)text Frame:(CGRect)frame{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = NSTextAlignmentRight;
    label.font = [UIFont systemFontOfSize:frame.size.height];
    label.text = text;
    return label;
}

- (UILabel *)buildElementLabelWithText:(NSString *)text Frame:(CGRect)frame Alignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.textAlignment = alignment;
    label.font = [UIFont systemFontOfSize:frame.size.height];
    label.text = text;
    return label;
}

- (instancetype)initWithRadarElements:(NSArray *)elements lengthColor:(UIColor *)lengthColor{
    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 0, RADAR_WIDTH, RADAR_HEIGHT);
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        self.elements = elements;
        self.lengthColor = lengthColor;
        
        radar_l  = LENGTH(88);
        center_w = RADAR_WIDTH/2;
        center_h = RADAR_HEIGHT/2 - LENGTH(15);
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self drawBody];
    [self buildPart];
}




@end
