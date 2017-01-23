//
//  FigureArea.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "FigureArea.h"

@implementation FigureArea

-(instancetype)initWithSquareWithS: (CGFloat)figureS {
    self = [super init];
    
    [self setFigureValueS:figureS];
    
    return self;
}
-(instancetype)initWithRectangleWithL: (CGFloat)figureL WithW: (CGFloat)figureW {
    self = [super init];
    
    [self setFigureValueL:figureL];
    [self setFigureValueW:figureW];
    
    return self;
}
-(instancetype)initWithCircleAreaWithR: (CGFloat)figureR {
    self = [super init];
    
    [self setFigureValueR:figureR];
    
    return self;
}
-(instancetype)initWithRectangleWithB: (CGFloat)figureB WithH: (CGFloat)figureH {
    self = [super init];
    
    [self setFigureValueB:figureB];
    [self setFigureValueH:figureH];
    
    return self;
}
-(instancetype)initWithTrapezoidAreaWithH: (CGFloat)figureH WithA: (CGFloat)figureA WithB: (CGFloat)figureB {
    self = [super init];
    
    [self setFigureValueH:figureH];
    [self setFigureValueA:figureA];
    [self setFigureValueB:figureB];
    
    return self;
}


- (CGFloat)squareAreaWithS {
    return self.figureS * self.figureS;
}

- (CGFloat)rectangleAreaWithS {
    return self.figureS * self.figureL;
}

- (CGFloat)circleAreaWithR {
    return 2 * [super getFigurePie] * self.figureR;
}

- (CGFloat)triangleAreaWithB {
    return (CGFloat)1/2 * self.figureB * self.figureH;
}

- (CGFloat)trapezoidAreaWithA {
    return (CGFloat)1/2 * self.figureH * (self.figureA + self.figureB);
}

@end
