

        ---------------------使用说明---------------------
    #import "RadarMapView.h"    
 
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


