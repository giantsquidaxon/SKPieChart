//
//  SKGraphPieChartSimple.m
//  SKPieChart
//
//  Created by Richard Smith on 31/01/2014.
//  Copyright (c) 2014 Richard Smith. All rights reserved.
//

#import "SKGraphPieChartSimple.h"

@implementation SKGraphPieChartSimple

-(id)init
{
    if (self = [super init]) {
        self.dataDelegate = self;
    }
    return self;
}

-(NSUInteger) numberOfSectorsForPieChart:(SKGraphPieChart *) chart
{
    return _numberOfWedges;
}

-(float) proportionForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i
{
    return [_wedgeProportions[i] floatValue];
}

-(SKColor *) colorForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i
{
    return _wedgeColors[i];
}

-(SKNode *) labelNodeForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;
{
    if (_wedgeLabels == Nil) return nil;
    if (_wedgeLabels[i] == [NSNull null]) return nil;
    return _wedgeLabels[i];
}

@end
