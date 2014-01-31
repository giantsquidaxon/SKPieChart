//
//  PieChart.h
//  SKPieChart
//
//  Created by Richard Smith on 23/01/2014.
//  Copyright (c) 2014 Richard Smith. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SKGraphPieChartDataSource.h"

@interface SKGraphPieChart : SKNode

/// Radius of pie chart
@property CGFloat outsideRadius;

/// Width of outline around pie chart
@property CGFloat outlineWidth;

/// Color of outline around pie chart
@property (strong) SKColor *lineColor;

/// Background color of outline around pie chart
@property (strong) SKColor *backgroundColor;

/// Radius of
@property CGFloat insideRadius;

@property CGFloat insideLineWidth;

/// Delegate conforming to <SKGraphPieChartDataSource> protocol
@property (assign) id<SKGraphPieChartDataSource> dataDelegate;

/// Make node containing the pie chart after pulling data from delegate
-(void) refreshPieChart;

/// Make node containing the background layer of the pie chart
-(SKNode *)drawBackground;

/// Make node containing the outline layer of the pie chart
-(SKNode *)drawOutline;

/**
 Draw a segment of the pie chart
 @param startAngle the starting angle of the sector
 @param endAngle the ending angle of the sector
 @param c the colour to fill the sector with
 @returns a newly initialized object
 */
-(SKNode *)drawSectorFromAngle:(CGFloat)startAngle toAngle:(CGFloat)endAngle withColor:(SKColor *)c;

@end
