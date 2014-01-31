//
//  MyScene.m
//  SKPieChart
//
//  Created by Richard Smith on 23/01/2014.
//  Copyright (c) 2014 Richard Smith. All rights reserved.
//

#import "MyScene.h"
#import "SKGraphPieChart.h"
#import "SKGraphPieChartSimple.h"


@implementation MyScene
{
    SKGraphPieChart *pie;
    bool chartIsUpdating;
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        chartIsUpdating = NO;
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        CGPoint location = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        
        pie = [[SKGraphPieChart alloc] init];
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
        
        SKAction *shrinkMove = [SKAction sequence:@[[SKAction group:@[[SKAction moveByX:-300 y:220 duration:0.5],
                                                                      [SKAction scaleTo:0.35 duration:0.5]]],
                                                    [SKAction scaleTo:0.4 duration:0.1]]];
        
        [pie runAction:[SKAction sequence:@[[SKAction waitForDuration:5],
                                            shrinkMove,
                                            [SKAction waitForDuration:1],
                                            [SKAction performSelector:@selector(beginUpdatingChart) onTarget:self]]]];
        
        
        [self runAction:[SKAction repeatActionForever:[SKAction sequence:@[[SKAction waitForDuration:2.0],
                                                                           [SKAction performSelector:@selector(addChart) onTarget:self]]]]];

        SKNode *edge = [[SKNode alloc] init];
        edge.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(-self.size.width, 0) toPoint:CGPointMake(self.size.width, 0)];
        [self addChild:edge];
        
    }
    
    return self;
}

-(void)mouseDown:(NSEvent *)theEvent {
     /* Called when a mouse click occurs */
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if (chartIsUpdating) [pie refreshPieChart];
}

-(void)beginUpdatingChart
{
    chartIsUpdating = YES;
}

-(void)addChart
{
    CGPoint location = CGPointMake(CGRectGetMidX(self.frame) + (50 - arc4random() % 100),
                                   CGRectGetMidY(self.frame));
    
    SKGraphPieChartSimple *simplePie = [[SKGraphPieChartSimple alloc] init];
    simplePie.numberOfWedges = 3;
    simplePie.wedgeProportions = @[@(0.03 + (arc4random() % 30) / 100.0), @(0.03 + (arc4random() % 30) / 100.0), @(0.03 + (arc4random() % 30) / 100.0)];
    simplePie.wedgeColors = @[[SKColor redColor], [SKColor greenColor], [SKColor blueColor]];
    
    NSMutableArray *labels = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i<simplePie.numberOfWedges; i++) {
        SKLabelNode *l = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        l.color = simplePie.wedgeColors[i];
        l.colorBlendFactor = 1.0;
        l.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        l.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        l.text = [NSString stringWithFormat:@"%.0f%%", [simplePie.wedgeProportions[i] floatValue] * 100];
        [labels addObject:l];
    }
    
    simplePie.wedgeLabels = labels;
    
    simplePie.labelDistance = 130;
    simplePie.backgroundColor = [SKColor clearColor];
    simplePie.outlineWidth = 5;
    simplePie.lineColor = [SKColor blackColor];
    simplePie.zPosition = -100;
    simplePie.position = location;
    [simplePie refreshPieChart];
    simplePie.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:100];
    [self addChild:simplePie];
    [simplePie runAction:[SKAction sequence:@[[SKAction waitForDuration:5],
                                              [SKAction fadeAlphaTo:0 duration:1],
                                              [SKAction removeFromParent]]]];
}


#pragma mark Pie Chart Data Source delegate methods
-(NSUInteger) numberOfSectorsForPieChart:(SKGraphPieChart *) chart
{
    return 4;
}

-(float) proportionForPieChart:(SKGraphPieChart *) chart sectorIndex:(NSUInteger) i
{
    static CGFloat red = 0.2;
    static CGFloat blue = 0.4;
    static CGFloat green = 0.1;
    
    static CGFloat dred = 0.0001;
    static CGFloat dblue = 0.0003;
    static CGFloat dgreen = 0.0002;
    
    switch (i) {
        case 0:
            if (red < 0.1 || red > 0.3) dred = -dred;
            red -= dred;
            return red;
            break;
        case 1:
            if (blue < 0.1 || blue > 0.4) dblue = -dblue;
            blue  -= dblue;
            return blue;
            break;
        case 2:
            if (green < 0.1 || green > 0.25) dgreen = -dgreen;
            green  -= dgreen;
            return green;
            break;
        case 3:
            return 1.0 - (red + blue + green);
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
