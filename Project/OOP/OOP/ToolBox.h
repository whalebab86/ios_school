//
//  ToolBox.h
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolBox : NSObject

@property NSInteger sum;

+ (CGFloat)inchToCm: (CGFloat)inch;
+ (CGFloat)cmToInch: (CGFloat)cm;

+ (CGFloat)m2ToPyeong: (CGFloat)m2;
+ (CGFloat)pyeongTom2: (CGFloat)pyeong;

+ (CGFloat) fahrenheitToCelsius: (CGFloat)fahrenheit;
+ (CGFloat) celsiusToFahrenheit: (CGFloat)celsius;
@end
