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
/// Return number of sectors for a given chart
-(NSUInteger) numberOfSectorsForPieChart:(SKGraphPieChart *) chart;

/// Return proportion of a given sector for a given chart, with proportions being positive floats adding to a total of 1.0
-(float) proportionForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;

/// Return color for a given sector of a given chart
-(SKColor *) colorForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;

@optional

/// A node to use as a label for a section, or nil
-(SKNode *) labelNodeForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;

/// A name to use for the sprite representing a sector
-(NSString *) nameForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;

@end
