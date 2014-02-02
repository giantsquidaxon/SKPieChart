//
//  PieChartDataSourceDelegate.h
//  SKPieChart
//
//  Created by Richard Smith on 23/01/2014.
//  Copyright (c) 2014 Richard Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SKGraphPieChart;

/** Data sources for SKGraphPieChart objects should implement this protocol. It specifies the number of wedges to plot, as well as the proportions and colors for each wedge. Optionally, nodes to use as labels and names for each sector can be specified. For simple static charts, consider using SKGraphPieChartSimple instead of implementing the delegate protocol. */
@protocol SKGraphPieChartDataSource <NSObject>
/// Return number of sectors to be plotted for a given chart
-(NSUInteger) numberOfSectorsForPieChart:(SKGraphPieChart *) chart;

/// Returns the proportion of a given sector for a given chart, with proportions being positive floats adding to a total of 1.0.
-(float) proportionForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;

/// Returns the color for a given sector of a given chart.
-(SKColor *) colorForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;

@optional

/// Returns a node to use as a label for a given sector of a given chart, or nil if there is to be no label for that sector.
-(SKNode *) labelNodeForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;

/// Returns a node to use as a label for a given sector of a given chart, so that it can be identified within the chart's "wedges" node.
-(NSString *) nameForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;

@end
