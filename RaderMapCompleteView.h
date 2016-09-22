//
//  RaderMapCompleteView.h
//  RadarMap
//
//  Created by A053 on 16/9/22.
//  Copyright © 2016年 Yvan. All rights reserved.
//
#define RADAR_WIDTH     [UIScreen mainScreen].bounds.size.width
#define RADAR_HEIGHT    [UIScreen mainScreen].bounds.size.width
#define FONT(x)         [UIFont systemFontOfSize:(x*([UIScreen mainScreen].bounds.size.width/375.0))]
#define LENGTH(x)       (x*([UIScreen mainScreen].bounds.size.width/375.0))
#define RGB_M(r,g,b)     [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1]









#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>
@interface RaderMapCompleteView : UIView

- (instancetype)initWithRadarElements:(NSArray *)elements lengthColor:(UIColor *)lengthColor;

@end
