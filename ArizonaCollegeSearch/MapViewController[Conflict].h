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
	BOOL doneInitialZoom;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) NSString *userChoiceForLocation;
- (IBAction)setMapType:(id)sender;


@end
