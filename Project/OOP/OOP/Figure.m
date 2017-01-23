//
//  Figure.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "Figure.h"

@interface Figure()

@property CGFloat figureS;
@property CGFloat figureL;
@property CGFloat figureW;
@property CGFloat figureR;
@property CGFloat figureA;
@property CGFloat figureB;
@property CGFloat figureH;

@end

@implementation Figure

static CGFloat figurePie = 3.14;

- (CGFloat)getFigurePie {
    
    return figurePie;
}

-(instancetype)init {
    self = [super init];
    
    if( self ) {
        self.figureS = 5;
        self.figureL = 5;
        self.figureW = 5;
        self.figureR = 5;
        self.figureA = 5;
        self.figureB = 5;
        self.figureH = 5;
    }
    
    return self;
}


- (void) setFigureValueS: (CGFloat)value {
    self.figureS = value;
}
- (void) setFigureValueL: (CGFloat)value {
    self.figureL = value;
}
- (void) setFigureValueW: (CGFloat)value {
    self.figureW = value;
}
- (void) setFigureValueR: (CGFloat)value {
    self.figureR = value;
}
- (void) setFigureValueA: (CGFloat)value {
    self.figureA = value;
}
- (void) setFigureValueB: (CGFloat)value {
    self.figureB = value;
}
- (void) setFigureValueH: (CGFloat)value {
    self.figureH = value;
}
@end
