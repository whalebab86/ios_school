//
//  FigurePerimeter.h
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Figure.h"

@interface FigurePerimeter : Figure

- (instancetype)initWithSquarePerimeterWithS: (CGFloat)figureS;
- (instancetype)initWithRectanglePerimeterWithL: (CGFloat)figureL withW: (CGFloat)figureW;

- (CGFloat)squarePerimeterWithS;
- (CGFloat)RectanglePerimeterWithL;

@end
