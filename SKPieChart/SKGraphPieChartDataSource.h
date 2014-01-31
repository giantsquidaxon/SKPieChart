//
//  PieChartDataSourceDelegate.h
//  SKPieChart
//
//  Created by Richard Smith on 23/01/2014.
//  Copyright (c) 2014 Richard Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SKGraphPieChart;

@protocol SKGraphPieChartDataSource <NSObject>
-(NSUInteger) numberOfSectorsForPieChart:(SKGraphPieChart *) chart;
-(float) proportionForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;
-(SKColor *) colorForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;


@end
