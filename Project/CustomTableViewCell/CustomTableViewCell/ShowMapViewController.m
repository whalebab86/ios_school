//
//  ShowMapViewController.m
//  TripDiary
//
//  Created by CLAY on 2017. 3. 7..
//  Copyright © 2017년 CLAY. All rights reserved.
//

#import "ShowMapViewController.h"

#import "DataCenter.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "ShowMapAnnotation.h"

@interface ShowMapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ShowMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *locationLongitude = [[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_location_longitude"];
    NSString *locationLatitude  = [[[DataCenter sharedInstance].resultArray objectAtIndex:self.indexPath.row] valueForKey:@"trip_location_latitude"];
    
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake([locationLatitude doubleValue], [locationLongitude doubleValue]);
    ShowMapAnnotation *annotation = [[ShowMapAnnotation alloc] initWithCoordinate:location];
    
    MKCoordinateSpan span =  MKCoordinateSpanMake(0.5, 0.5);
    
    [self.mapView setRegion:MKCoordinateRegionMake(location, span) animated:YES];
    [self.mapView addAnnotation:annotation];
}
- (IBAction)didClickBarItem:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
