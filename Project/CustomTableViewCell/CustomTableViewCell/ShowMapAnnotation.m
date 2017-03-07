//
//  ShowMapAnnotation.m
//  TripDiary
//
//  Created by CLAY on 2017. 3. 7..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "ShowMapAnnotation.h"

@implementation ShowMapAnnotation

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self) {
        _coordinate = coordinate;
    }
    
    return self;
}

@end
