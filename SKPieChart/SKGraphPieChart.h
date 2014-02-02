//
//  PieChart.h
//  SKPieChart
//
//  Created by Richard Smith on 23/01/2014.
//  Copyright (c) 2014 Richard Smith. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SKGraphPieChartDataSource.h"

/** A class for producing pie charts in SpriteKit. The proportions and colors for each wedge are fetched from a delegate object conforming to the <SKGRaphPieChartDataSource> protocol. */

@interface SKGraphPieChart : SKNode

/// Radius of pie chart
@property CGFloat outsideRadius;

/// Width of outline around pie chart
@property CGFloat outlineWidth;

/// Color of outline around pie chart
@property (strong) SKColor *lineColor;

/// Background color of outline around pie chart
@property (strong) SKColor *backgroundColor;

/// Radius of center region of pie chart, if any.
@property CGFloat insideRadius;

/// Distance of labels from center of chart
@property CGFloat labelDistance;

/// Root node for chart's wedges
@property (readonly, strong) SKNode *wedges;

/// Delegate conforming to <SKGraphPieChartDataSource> protocol
@property (assign) id<SKGraphPieChartDataSource> dataDelegate;

/** Redraw the pie chart.
 Should be called when changes have been made to drawing properties, when the data being plotted has changed, and when the graph is first drawn. */
-(void) refreshPieChart;

/** Make node containing the background layer of the pie chart. */
-(SKNode *)drawBackground;

/** Make node containing the outline layer of the pie chart */
-(SKNode *)drawOutline;

/**
 Draw a segment of the pie chart.
 @param startAngle the starting angle of the sector
 @param endAngle the ending angle of the sector
 @param c the colour to fill the sector with
 @returns SKNode of slice.
 
 Will also add any node labels for this segment to the labels node. This should probably be moved somewhere else.
 */
-(SKNode *)drawSectorFromAngle:(CGFloat)startAngle toAngle:(CGFloat)endAngle withColor:(SKColor *)c;

@end
