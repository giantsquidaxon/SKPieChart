//
//  PieChartDataSourceDelegate.h
//  SKPieChart
//
//  Created by Richard Smith on 23/01/2014.
//  Copyright (c) 2014 Richard Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PieChart;

@protocol PieChartDataSource <NSObject>
-(NSUInteger) numberOfSectorsForPieChart:(PieChart *) chart;
-(float) proportionForPieChart:(PieChart *) chart sectorIndex:(NSUInteger) i;
-(SKColor *) colorForPieChart:(PieChart *) chart sectorIndex:(NSUInteger) i;


@end
