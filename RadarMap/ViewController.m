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
//    RadarMapView *radarMap = [[RadarMapView alloc]initWithFrame:CGRectMake(100, 200, 200, 200) Elements:elements];
//    radarMap.part = 5;
//    radarMap.trunkLineColor = [UIColor greenColor];
//    radarMap.partLineColor = [UIColor greenColor];
//    radarMap.percentLineColor = [UIColor redColor];
//    [self.view addSubview:radarMap];
//     
    RaderMapCompleteView *radar = [[RaderMapCompleteView alloc]initWithRadarElements:@[@"考试次数",@"考试难度",@"联系次数",@"平均得分",@"错误率",@"准确率"] lengthColor:[UIColor grayColor]];
    [self.view addSubview:radar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
