//
//  RaderMapCompleteView.h
//  RadarMap
//
//  Created by A053 on 16/9/22.
//  Copyright © 2016年 Yvan. All rights reserved.
//

/*
 
 ElementItem *item1 = [[ElementItem alloc]init];
 item1.itemPercent = @[@"0.5",@"0.6",@"0.8",@"0.4",@"0.2",@"0.1"];
 item1.itemColor = [UIColor greenColor];
 item1.itemName = @"基础综合";
 .
 .
 .
 
 RaderMapCompleteView *radar = [[RaderMapCompleteView alloc]initWithRadarElements:@[@"考试次数",@"考试难度",@"联系次数",@"平均得分",@"错误率",@"准确率"] lengthColor:[UIColor grayColor]];
 radar.content = @"能力测评能力测评能力测评能力测评能力测评能力测评能力测评能力测评";
 
 [radar addAbilitysWithElements:@[item1,item2,item3]];
 [self.view addSubview:radar];

 
 */


#import <UIKit/UIKit.h>
/**
 *  能力评估方向  基础评估、实践评估、专业评估、
 */
@interface ElementItem : NSObject
/**
 *  评估名字
 */
@property (copy, nonatomic) NSString *itemName;
/**
 *  评估ID 预留
 */
@property (copy, nonatomic) NSString *itemID;
/**
 *  代表该评估方向的颜色
 */
@property (strong, nonatomic) UIColor  *itemColor;
/**
 *  各项评估结果的百分比数组
 */
@property (strong, nonatomic) NSArray  *itemPercent;

@end

/**
 *  评估模型UI
 */
@interface Item : UIView
@property (strong, nonatomic) UIView *colorView;
@property (strong, nonatomic) UILabel *itemLabel;
@end

@interface RaderMapCompleteView : UIView

/**
 *  评估描述内容
 */
@property (copy, nonatomic) NSString *content;

/**
 *  实例化
 *
 *  @param elements    各项能力评估的名字数组
 *  @param lengthColor 主体颜色
 *
 */
- (instancetype)initWithRadarElements:(NSArray *)elements lengthColor:(UIColor *)lengthColor;

/**
 *  添加评估方向
 *
 *  @param elements 评估方向数组<ElementItem>
 */
- (void)addAbilitysWithElements:(NSArray <ElementItem*>*)elements;
@end
