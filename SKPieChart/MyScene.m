//
//  MyScene.m
//  SKPieChart
//
//  Created by Richard Smith on 23/01/2014.
//  Copyright (c) 2014 Richard Smith. All rights reserved.
//

#import "MyScene.h"
#import "SKGraphPieChart.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        CGPoint location = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        
        SKGraphPieChart *sprite = [[SKGraphPieChart alloc] init];
        sprite.dataDelegate = self;
        
        sprite.position = location;
        sprite.outsideRadius = 300.0;
        sprite.insideRadius = 200.0;
        [sprite refreshPieChart];
        
        [self addChild:sprite];
        
    }
    return self;
}

-(void)mouseDown:(NSEvent *)theEvent {
     /* Called when a mouse click occurs */
    
    CGPoint location = [theEvent locationInNode:self];
    
    SKGraphPieChart *sprite = [[SKGraphPieChart alloc] init];
    sprite.dataDelegate = self;
    
    sprite.position = location;
    sprite.outsideRadius = 300.0;
    [sprite refreshPieChart];
    
    [self addChild:sprite];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


#pragma mark Pie Chart Data Source delegate methods
-(NSUInteger) numberOfSectorsForPieChart:(SKGraphPieChart *) chart
{
    return 4;
}

-(float) proportionForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i
{
    switch (i) {
        case 0:
            return 0.2;
            break;
        case 1:
            return 0.4;
            break;
        case 2:
            return 0.1;
            break;
        case 3:
            return 0.3;
            break;
        default:
            break;
    }
    return 0.0;
}

-(SKColor *) colorForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i
{
    switch (i) {
        case 0:
            return [SKColor redColor];
            break;
        case 1:
            return [SKColor blueColor];
            break;
        case 2:
            return [SKColor greenColor];
            break;
        case 3:
            return [SKColor yellowColor];
            break;
        default:
            break;
    }
    return [SKColor clearColor];
}

@end
