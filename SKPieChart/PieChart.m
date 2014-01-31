//
//  PieChart.m
//  SKPieChart
//
//  Created by Richard Smith on 23/01/2014.
//  Copyright (c) 2014 Richard Smith. All rights reserved.
//

#import "PieChart.h"

@implementation PieChart{
    SKNode *backgroundShape;
    SKNode *outlineShape;
    SKNode *pieSlices;
}

-(id)init
{
    if (self = [super init])
    {
        // Set up some sensible defaults
        _outsideRadius = 100.0;
        _outlineWidth = 1.0;
        _lineColor = [SKColor whiteColor];
        _backgroundColor = [SKColor blackColor];
        _insideLineWidth = 20.0;
        _insideRadius = 50.0;
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(outsideRadius)) options:0 context:Nil];
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(outlineWidth)) options:0 context:Nil];
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(lineColor)) options:0 context:Nil];
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(backgroundColor)) options:0 context:Nil];
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(insideLineWidth)) options:0 context:Nil];
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(zPosition)) options:0 context:Nil];
    }
    return self;
}

-(void) refreshPieChart
{
    [self removeAllChildren];
    backgroundShape = [self drawBackground];
    outlineShape = [self drawOutline];
    pieSlices = [self drawAllSectors];
    
    [self addChild:pieSlices];
    [self addChild:outlineShape];
    [self addChild:backgroundShape];
}

-(SKNode *)drawBackground
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, nil, 0, 0, _outsideRadius, 0, 2 * M_PI, YES);
    SKShapeNode *shape = [[SKShapeNode alloc] init];
    shape.path = path;
    shape.fillColor = _backgroundColor;
    shape.lineWidth = 0;
    shape.zPosition = self.zPosition;

    return shape;
}

-(SKNode *)drawOutline
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, nil, 0, 0, _outsideRadius + _outlineWidth / 2.0, 0, 2 * M_PI, YES);
    SKShapeNode *shape = [[SKShapeNode alloc] init];
    shape.path = path;
    shape.fillColor = [SKColor clearColor];
    shape.strokeColor = _lineColor;
    //shape.glowWidth = 5;
    shape.lineWidth = _outlineWidth;
    shape.zPosition = self.zPosition + 0.2;
    return shape;
}

-(SKNode *)drawAllSectors
{
    SKNode *node = [[SKNode alloc] init];
    NSUInteger n = [_dataDelegate numberOfSectorsForPieChart:self];
    CGFloat startAngle = 0.0;
    for (NSUInteger i = 0; i < n; i++){
        SKColor *wedgeColor = [_dataDelegate colorForPieChart:self sectorIndex:i];
        CGFloat wedgeAngle = [_dataDelegate proportionForPieChart:self sectorIndex:i] * 2 * M_PI;
        SKNode *wedge = [self drawSectorFromAngle:startAngle toAngle:startAngle + wedgeAngle withColor:wedgeColor];
        startAngle += wedgeAngle;
        [node addChild:wedge];
    }
    node.zPosition = self.zPosition + 0.1;
    return node;
}

-(SKNode *)drawSectorFromAngle:(CGFloat)startAngle toAngle:(CGFloat)endAngle withColor:(SKColor *)c
{
    CGAffineTransform mirror = CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, &mirror, 0, 0);
    //CGPathAddLineToPoint(path, nil, 0, pieRadius);
    CGPathAddArc(path, &mirror, 0, 0, _outsideRadius - 2, startAngle, endAngle, NO);
    CGPathAddLineToPoint(path, &mirror, 0, 0);
    
    SKShapeNode *shape = [[SKShapeNode alloc] init];
    shape.path = path;
    
    shape.fillColor = c;
    shape.strokeColor = c;
    shape.lineWidth = 0.1;
    shape.zRotation =  M_PI / 2.0;
    shape.zPosition = 102;
    shape.position = CGPointMake(0,0);

    return shape;
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(outsideRadius))];
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(outlineWidth))];
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(lineColor)) ];
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(backgroundColor))];
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(insideLineWidth))];
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(zPosition))];
}

#pragma mark KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self refreshPieChart];
}



@end
