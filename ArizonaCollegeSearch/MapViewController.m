//
//  MapViewController.m
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 10/30/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

@synthesize mapView = _mapView;
@synthesize locationManager = _locationManager;
@synthesize locationOfCampus = _locationOfCampus;
@synthesize typeOfMap = _typeOfMap;
@synthesize currentLocation = _currentLocation;

- (void)viewDidLoad {
    [super viewDidLoad];
	UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
	lpgr.minimumPressDuration = 2.0;
	[self.mapView addGestureRecognizer:lpgr];
	self.locationOfCampus.selectedSegmentIndex = 0;
	self.typeOfMap.selectedSegmentIndex = 1;
    CLLocationCoordinate2D zoomLocation;
	NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ListOfMapLications" ofType:@"plist"];
	NSArray *array;
	if (!array) {
		array = [[NSArray alloc] initWithContentsOfFile:plistPath];
	} else {
		array = [NSArray arrayWithContentsOfFile:plistPath];
	}
	NSLog(@"%@", array);
	
	
	self.locationManager = [[CLLocationManager alloc] init];
	self.locationManager.delegate = self;
	[self.locationManager startUpdatingLocation];
	zoomLocation.latitude = self.locationManager.location.coordinate.latitude;
	zoomLocation.longitude = self.locationManager.location.coordinate.longitude;
	MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
	MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
	[self.mapView setRegion:adjustedRegion animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
	[self.locationManager stopUpdatingLocation];
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer {
	//Add pin to map
	if (gestureRecognizer.state != UIGestureRecognizerStateBegan) return;
	CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
	CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
	MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
	pin.coordinate = touchMapCoordinate;
	[self.mapView addAnnotation:pin];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
	CLLocation *newLocation = [locations lastObject];
	self.currentLocation = newLocation;
	if (newLocation.horizontalAccuracy <= 100.0f) {
		[self.locationManager stopUpdatingLocation];
	}
	CLLocationCoordinate2D zoomLocation;
	zoomLocation.latitude = self.currentLocation.coordinate.latitude;
	zoomLocation.longitude = self.currentLocation.coordinate.longitude;
	MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
	MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
	[self.mapView setRegion:adjustedRegion animated:YES];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
	return UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationMaskLandscape;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	if (error.code == kCLErrorDenied) {
		[self.locationManager stopUpdatingLocation];
	} else if (error.code == kCLErrorLocationUnknown) {
		//retry
	} else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error retrieving location"
														message:[error description]
													   delegate:nil
											  cancelButtonTitle:@"Ok"
											  otherButtonTitles:nil];
		[alert show];
	}
}

- (IBAction)setMapType:(id)sender {
	switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
		case 0: {
			self.mapView.mapType = MKMapTypeStandard;
			break;
		} case 1: {
			self.mapView.mapType = MKMapTypeSatellite;
			break;
		} default: {
			self.mapView.mapType = MKMapTypeHybrid;
			break;
		}
	}
}

- (IBAction)setCampusLocation:(id)sender {
	CLLocationCoordinate2D zoomLocation;
	switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
		case 0: {
			//tempe
			NSLog(@"Tempe");
			zoomLocation.latitude = 33.415869;
			zoomLocation.longitude = -111.932702;
			break;
		} case 1: {
			//west
			NSLog(@"West");
			zoomLocation.latitude = 33.608753;
			zoomLocation.longitude = -112.159606;
			break;
		} case 2: {
			//Polytechnic
			NSLog(@"Poly");
			zoomLocation.latitude = 33.300105;
			zoomLocation.longitude = -111.680978;
			break;
		} default: {
			//downtown
			NSLog(@"Downtown");
			zoomLocation.latitude = 33.453591;
			zoomLocation.longitude = -112.073346;
			break;
		}
	}
	MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
	MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
	[self.mapView setRegion:adjustedRegion animated:YES];
}
@end
