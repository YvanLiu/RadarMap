//
//  ViewController.m
//  RadarMap
//
//  Created by A053 on 16/9/13.
//  Copyright © 2016年 Yvan. All rights reserved.
//

#import "ViewController.h"

#import "RadarMapView.h"
#import "RaderMapCompleteView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    // 雷达元素模型
    NSMutableArray *elements = [NSMutableArray new];
    Element *ele1 = [[Element alloc]init];
    ele1.percent = 0.45;
    [elements addObject:ele1];
    Element *ele2 = [[Element alloc]init];
    ele2.percent = 0.65;
    [elements addObject:ele2];
    Element *ele3 = [[Element alloc]init];
    ele3.percent = 0.8;
    [elements addObject:ele3];
    Element *ele4 = [[Element alloc]init];
    ele4.percent = 0.6;
    [elements addObject:ele4];
    Element *ele5 = [[Element alloc]init];
    ele5.percent = 0.5;
    [elements addObject:ele5];
    
    // 雷达图
    RadarMapView *radarMap = [[RadarMapView alloc]initWithFrame:CGRectMake(100, 200, 200, 200) Elements:elements];
    radarMap.part = 5;
    radarMap.trunkLineColor = [UIColor greenColor];
    radarMap.partLineColor = [UIColor greenColor];
    radarMap.percentLineColor = [UIColor redColor];
    [self.view addSubview:radarMap];
     */
    
    ElementItem *item1 = [[ElementItem alloc]init];
    item1.itemPercent = @[@"0.5",@"0.6",@"0.8",@"0.4",@"0.2",@"0.1"];
    item1.itemColor = [UIColor greenColor];
    item1.itemName = @"基础综合";
    ElementItem *item2 = [[ElementItem alloc]init];
    item2.itemPercent = @[@"0.3",@"0.4",@"0.5",@"0.7",@"0.6",@"0.2"];
    item2.itemColor = [UIColor redColor];
    item2.itemName = @"专业综合";
    ElementItem *item3 = [[ElementItem alloc]init];
    item3.itemPercent = @[@"0.7",@"0.4",@"0.6",@"0.2",@"0.4",@"0.7"];
    item3.itemColor = [UIColor yellowColor];
    item3.itemName = @"实践综合";

    RaderMapCompleteView *radar = [[RaderMapCompleteView alloc]initWithRadarElements:@[@"考试次数",@"考试难度",@"联系次数",@"平均得分",@"错误率",@"准确率"] lengthColor:[UIColor colorWithRed:168.0/255.0 green:168.0/255.0 blue:168.0/255.0 alpha:1]];
    radar.content = @"能力测评能力测评能力测评能力测评能力测评能力测评能力测评能力测评";
    
    [radar addAbilitysWithElements:@[item1,item2,item3]];
    [self.view addSubview:radar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
