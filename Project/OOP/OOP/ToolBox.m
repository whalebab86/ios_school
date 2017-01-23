//
//  ToolBox.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 23..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "ToolBox.h"

@implementation ToolBox

+ (CGFloat)inchToCm: (CGFloat)inch {
    return inch * 2.54;
}

+ (CGFloat)cmToInch: (CGFloat)cm {
    return cm / 2.54;
}


+ (CGFloat)m2ToPyeong: (CGFloat)m2 {
    return m2 / 3.305785;
}
+ (CGFloat)pyeongTom2: (CGFloat)pyeong {
    return pyeong * 3.305785;
}

+ (CGFloat) fahrenheitToCelsius: (CGFloat)fahrenheit {
    return (fahrenheit - 32) / 1.8;
}
+ (CGFloat) celsiusToFahrenheit: (CGFloat)celsius {
    return celsius * 1.8 + 32;
}

@end
