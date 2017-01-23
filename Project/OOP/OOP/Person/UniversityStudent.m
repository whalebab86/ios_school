//
//  UniversityStudent.m
//  OOP
//
//  Created by BongKi Cho on 2017. 1. 19..
//  Copyright © 2017년 BongKi Cho. All rights reserved.
//

#import "UniversityStudent.h"

@interface UniversityStudent ()

@property NSInteger hp;

@end

@implementation UniversityStudent

- (void)goMT {
    NSLog(@"goMT");
}

- (void)eat {
    
    [super eat];
    
    NSLog(@"University Student Eat");
}

@end
