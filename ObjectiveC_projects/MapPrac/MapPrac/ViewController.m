//
//  ViewController.m
//  MapPrac
//
//  Created by 박종찬 on 2017. 3. 7..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Annotation.h"

static const CGFloat BASE_LAT =  40.763849;
static const CGFloat BASE_LON = -73.972946;

@interface ViewController ()
<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property CLLocationManager *locationManager;
@property CLLocation *userLocation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake(BASE_LAT, BASE_LON), MKCoordinateSpanMake(0.005, 0.005)) animated:YES];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    self.locationManager.delegate = self;
    
    [self.mapView setShowsUserLocation:YES];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    self.userLocation = [locations lastObject];
    
    [self.mapView setRegion:MKCoordinateRegionMake(self.mapView.userLocation.coordinate, MKCoordinateSpanMake(0.01, 0.01)) animated:YES];

    [manager stopUpdatingLocation];
    
}

- (IBAction)startUpdateLocation:(id)sender {
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingLocation];
    } else {
        [self.locationManager requestWhenInUseAuthorization];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
