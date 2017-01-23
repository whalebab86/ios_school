//
//  FigureVolume.h
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Figure.h"

@interface FigureVolume : Figure

- (instancetype)initWithCubeVolumeWithS: (CGFloat)figureS;
- (instancetype)initWithRectangulrSolidVolumeWithL: (CGFloat)figureL withW: (CGFloat)figureW withH: (CGFloat)figureH;
- (instancetype)initWithCircularVolumeWithR: (CGFloat)figurR withH: (CGFloat)figureH;
- (instancetype)initWithSphereVolumeWithR: (CGFloat)figureR;
- (instancetype)initWithConeVolumeWithR: (CGFloat)figureR withH: (CGFloat)figureH;

- (CGFloat)cubeVolumeWithS;
- (CGFloat)RectangulrSolidVolumeWithL;
- (CGFloat)circularVolumeWithR;
- (CGFloat)sphereVolumeWithR;
- (CGFloat)coneVolumeWithR;

@end
