//
//  MapViewController.h
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 10/30/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#define METERS_PER_MILE 1609.344

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *currentLocation;
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeOfMap;
@property (weak, nonatomic) IBOutlet UISegmentedControl *locationOfCampus;
- (IBAction)setMapType:(id)sender;
- (IBAction)setCampusLocation:(id)sender;


@end
