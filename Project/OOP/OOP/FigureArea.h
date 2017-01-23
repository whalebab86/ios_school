//
//  FigureArea.h
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Figure.h"

@interface FigureArea : Figure

-(instancetype)initWithSquareWithS: (CGFloat)figureS;
-(instancetype)initWithRectangleWithL: (CGFloat)figureL WithW: (CGFloat)figureW;
-(instancetype)initWithCircleAreaWithR: (CGFloat)figureR;
-(instancetype)initWithRectangleWithB: (CGFloat)figureB WithH: (CGFloat)figureH;
-(instancetype)initWithTrapezoidAreaWithH: (CGFloat)figureH WithA: (CGFloat)figureA WithB: (CGFloat)figureB;

- (CGFloat)squareAreaWithS;
- (CGFloat)rectangleAreaWithS;
- (CGFloat)circleAreaWithR;
- (CGFloat)triangleAreaWithB;
- (CGFloat)trapezoidAreaWithA;

@end
