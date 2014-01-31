//
//  SKGraphPieChartSimple.h
//  SKPieChart
//
//  Created by Richard Smith on 31/01/2014.
//  Copyright (c) 2014 Richard Smith. All rights reserved.
//

#import "SKGraphPieChart.h"

@interface SKGraphPieChartSimple : SKGraphPieChart <SKGraphPieChartDataSource>

@property (retain) NSArray *wedgeProportions;
@property (retain) NSArray *wedgeColors;
@property (retain) NSArray *wedgeLabels;
@property NSUInteger numberOfWedges;

@end
