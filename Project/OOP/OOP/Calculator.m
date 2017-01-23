//
//  Calculator.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(instancetype)initWithScore:(NSUInteger)mathScore withHistory:(NSUInteger)historyScore withScience:(NSUInteger)scienceScore withKorean:(NSUInteger)koreanScor {
    
    self = [super init];
    
    if( self ) {
        self.mathClass = mathScore;
        self.historyClass = historyScore;
        self.scienceClass = scienceScore;
        self.koreanClass = koreanScor;
    }
    
    return self;
    
}

- (NSUInteger)addClassScore {
    
    return self.mathClass + self.historyClass + self.scienceClass + self.koreanClass;
}

- (NSUInteger)avgClassScore {
    
    return (self.mathClass + self.historyClass + self.scienceClass + self.koreanClass) / 4;
}

@end
