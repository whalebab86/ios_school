//
//  Calculator.h
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property NSUInteger mathClass;
@property NSUInteger historyClass;
@property NSUInteger scienceClass;
@property NSUInteger koreanClass;

- (instancetype)initWithScore: (NSUInteger)mathScore   withHistory: (NSUInteger)historyScore
                  withScience: (NSUInteger)scienceScore withKorean: (NSUInteger)koreanScor;

- (NSUInteger)addClassScore;

- (NSUInteger)avgClassScore;

@end
