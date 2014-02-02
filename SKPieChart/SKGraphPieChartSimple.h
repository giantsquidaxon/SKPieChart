//
//  SKGraphPieChartSimple.h
//  SKPieChart
//
//  Created by Richard Smith on 31/01/2014.
//  Copyright (c) 2014 Richard Smith. All rights reserved.
//

#import "SKGraphPieChart.h"
/** A simplified subclass of SKGraphPieChart intended for drawing static sprites. The proportions and colors for each wedge that'd usually be handled via a class implementing the <SKGRaphPieChartDataSource> protocol are set by passing in arrays, making it suitable for very quick unchanging graphics.*/

@interface SKGraphPieChartSimple : SKGraphPieChart <SKGraphPieChartDataSource>

/// Array containing the proportions of each slice as NSNumbers
@property (retain) NSArray *wedgeProportions;

/// Array containing the color of each slice as SKColors
@property (retain) NSArray *wedgeColors;

/// Array containing optional labels in the form of NSNodes, or NSNulls.
@property (retain) NSArray *wedgeLabels;

/// Number of wedges to plot
@property NSUInteger numberOfWedges;

@end
