//
//  FigurePerimeter.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "FigurePerimeter.h"


@implementation FigurePerimeter

- (instancetype)initWithSquarePerimeterWithS: (CGFloat)figureS {
    self = [super init];
    
    [self setFigureValueS:figureS];
    
    return self;
}
- (instancetype)initWithRectanglePerimeterWithL: (CGFloat)figureL withW: (CGFloat)figureW {
    self = [super init];
    
    [self setFigureValueL:figureL];
    [self setFigureValueW:figureW];
    
    return self;
}

- (CGFloat)squarePerimeterWithS {
    return self.figureS * self.figureS * self.figureS * self.figureS;
}

- (CGFloat)RectanglePerimeterWithL {
    return (2*self.figureL) + (2*self.figureW);
}

@end
