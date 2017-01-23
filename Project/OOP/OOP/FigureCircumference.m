//
//  FigureCircumference.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "FigureCircumference.h"

@implementation FigureCircumference

- (instancetype)initWithCircleCirumferenceWithR: (CGFloat)flureR {
    self = [super init];
    
    [self setFigureValueR:flureR];
    
    return self;
}

- (CGFloat)circleCirumferenceWithR {
    return 2 * [super getFigurePie] * self.figureR;
}

@end
