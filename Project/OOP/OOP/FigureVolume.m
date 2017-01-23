//
//  FigureVolume.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "FigureVolume.h"

@implementation FigureVolume

- (instancetype)initWithCubeVolumeWithS: (CGFloat)figureS {
    self = [super init];
    
    [self setFigureValueS:figureS];
    
    return self;
}
- (instancetype)initWithRectangulrSolidVolumeWithL: (CGFloat)figureL withW: (CGFloat)figureW withH: (CGFloat)figureH {
    self = [super init];
    
    [self setFigureValueL:figureL];
    [self setFigureValueW:figureW];
    [self setFigureValueH:figureH];
    
    return self;
}
- (instancetype)initWithCircularVolumeWithR: (CGFloat)figureR withH: (CGFloat)figureH {
    self = [super init];
    
    [self setFigureValueR:figureR];
    [self setFigureValueH:figureH];
    
    return self;
}
- (instancetype)initWithSphereVolumeWithR: (CGFloat)figureR {
    self = [super init];
    
    [self setFigureValueR:figureR];
    
    return self;
}
- (instancetype)initWithConeVolumeWithR: (CGFloat)figureR withH: (CGFloat)figureH {
    self = [super init];
    
    [self setFigureValueR:figureR];
    [self setFigureValueH:figureH];
    
    return self;
}


- (CGFloat)cubeVolumeWithS {
    return self.figureS * self.figureS * self.figureS;
}

- (CGFloat)RectangulrSolidVolumeWithL {
    return self.figureL * self.figureW * self.figureH;
}

- (CGFloat)circularVolumeWithR {
    return [super getFigurePie] * self.figureR * self.figureR * self.figureH;
}

- (CGFloat)sphereVolumeWithR {
    return (CGFloat)3/4 * [super getFigurePie] * self.figureR * self.figureR * self.figureR;
}

- (CGFloat)coneVolumeWithR {
    return (CGFloat)1/3 * [super getFigurePie] * self.figureR * self.figureR * self.figureH;
}

@end
