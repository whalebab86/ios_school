//
//  ShowMapAnnotation.h
//  TripDiary
//
//  Created by CLAY on 2017. 3. 7..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ShowMapAnnotation : NSObject
<MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
