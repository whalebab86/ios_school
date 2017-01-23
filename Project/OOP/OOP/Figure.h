//
//  Figure.h
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Figure : NSObject

@property (readonly) CGFloat figureS;
@property (readonly) CGFloat figureL;
@property (readonly) CGFloat figureW;
@property (readonly) CGFloat figureR;
@property (readonly) CGFloat figureA;
@property (readonly) CGFloat figureB;
@property (readonly) CGFloat figureH;

-(CGFloat)getFigurePie;

-(instancetype)init;

- (void) setFigureValueS: (CGFloat)value;
- (void) setFigureValueL: (CGFloat)value;
- (void) setFigureValueW: (CGFloat)value;
- (void) setFigureValueR: (CGFloat)value;
- (void) setFigureValueA: (CGFloat)value;
- (void) setFigureValueB: (CGFloat)value;
- (void) setFigureValueH: (CGFloat)value;

@end
