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
        
        
        SKGraphPieChart *pie = [[SKGraphPieChart alloc] init];
        pie.dataDelegate = self;
        
        pie.position = location;
        pie.outsideRadius = 300.0;
        pie.insideRadius = 200.0;
        pie.labelDistance = 370.0;
        pie.backgroundColor = [SKColor clearColor];
        [pie refreshPieChart];
        
        [self addChild:pie];
        
        SKNode *strawberry = [pie.wedges childNodeWithName:@"Strawberry"];
        [strawberry runAction:[SKAction repeatActionForever:[SKAction sequence:@[[SKAction fadeAlphaTo:0.0 duration:0.5],
                                                                                 [SKAction fadeAlphaTo:1.0 duration:0.1]]]]];
        
    }
    
    return self;
}

-(void)mouseDown:(NSEvent *)theEvent {
     /* Called when a mouse click occurs */
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

-(SKNode *) labelNodeForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;
{
    SKSpriteNode *label;
    switch (i) {
        case 0:
            label = [SKSpriteNode spriteNodeWithImageNamed:@"Strawberry"];
            break;
        case 1:
            label = [SKSpriteNode spriteNodeWithImageNamed:@"Umbrella"];
            break;
        case 2:
            label = [SKSpriteNode spriteNodeWithImageNamed:@"Apple"];
            break;
        case 3:
            label = [SKSpriteNode spriteNodeWithImageNamed:@"Banana"];
            break;
        default:
            break;
    }
    label.xScale = 5.0;
    label.yScale = 5.0;
    label.anchorPoint = CGPointMake(0.5, 0.5);
    [label runAction:[SKAction repeatActionForever:[SKAction sequence:@[[SKAction rotateByAngle:0.4 duration:0.5],
                                          [SKAction rotateByAngle:-0.4 duration:0.5]]]]];
    return label;
}

-(NSString *) nameForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i;
{
    if (i == 0) {
        return @"Strawberry";
    }else{
        return nil;
    }
}

@end
