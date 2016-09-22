//
//  RadarMapView.h
//  RadarMap
//
//  Created by A053 on 16/9/13.
//  Copyright © 2016年 Yvan. All rights reserved.
//

/*
        ---------------------使用说明---------------------
    
 
    NSMutableArray *elements = [NSMutableArray new];
    
    // 雷达元素模型 至少3个，不然没法画~
    NSMutableArray *datas = [NSMutableArray new];
    Element *ele1 = [[Element alloc]init];
    ele1.percent = 0.45;
    [elements addObject:ele1];
    .
    .
    .
 
    // 初始化雷达图
    RadarMapView *radarMap = [[RadarMapView alloc]initWithFrame:CGRectMake(200, 200, 100, 100) Elements:elements];
    // 设置分成几等分 默认1等分（最外面一圈的框框）
    radarMap.part = 5;
    // 设置雷达元素主干颜色 默认黑色
    radarMap.trunkLineColor = [UIColor greenColor];
    // 设置分等分的线颜色 默认黑色
    radarMap.partLineColor = [UIColor greenColor];
    // 设置百分比占比的颜色 默认黑色
    radarMap.percentLineColor = [UIColor redColor];
    // add
    [self.view addSubview:radarMap];

 
 
 */
#import <UIKit/UIKit.h>

// 元素模型
@interface Element : NSObject
/**
 *  元素名字 预留
 */
@property (copy, nonatomic) NSString *element;
/**
 *  元素id 预留
 */
@property (copy, nonatomic) NSString *elementID;
/**
 *  百分比占比
 */
@property (assign, nonatomic) float percent;
@end

@interface RadarMapView : UIView

/**
 *  雷达图分成几等份 默认1等份（最外面一圈的框框）
 */
@property (assign, nonatomic) float part;

/**
 *  雷达线的宽度 默认1
 */
@property (assign, nonatomic) float lineWidth;

/**
 *  主干线颜色 默认黑色
 */
@property (strong, nonatomic) UIColor *trunkLineColor;

/**
 *  分等份线颜色 默认黑色
 */
@property (strong, nonatomic) UIColor *partLineColor;

/**
 *  比例线颜色 默认绿色
 */
@property (strong, nonatomic) UIColor *percentLineColor;

/**
 *  初始化方法
 *
 *  @param elements Element模型的数组
 *
 */
- (instancetype)initWithFrame:(CGRect)frame Elements:(NSArray <Element *>*)elements;

@end
