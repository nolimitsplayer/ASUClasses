//
//  iPhoneCampusSelectViewController.h
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 11/2/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface iPhoneCampusSelectViewController : UITableViewController

@property (nonatomic, retain) NSArray *iPhoneListOfCampusesArray;
@property (nonatomic, retain) MapViewController *mapView;
- (IBAction)dismissView:(id)sender;

@end
