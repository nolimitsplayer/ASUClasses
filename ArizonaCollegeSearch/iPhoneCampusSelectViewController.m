//
//  iPhoneCampusSelectViewController.m
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 11/2/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "iPhoneCampusSelectViewController.h"

@implementation iPhoneCampusSelectViewController

@synthesize iPhoneListOfCampusesArray = _iPhoneListOfCampusesArray;
@synthesize mapView = _mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
	self.iPhoneListOfCampusesArray = [NSArray arrayWithObjects:@"Tempe", @"Downtown Phoenix", @"West", @"Polytechnic", nil];
    NSArray *list = [self.iPhoneListOfCampusesArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    self.iPhoneListOfCampusesArray = list;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.iPhoneListOfCampusesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"iPhoneCampusCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.iPhoneListOfCampusesArray objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)dismissView:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
	//set map view to location
}

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *text = [self.iPhoneListOfCampusesArray objectAtIndex:indexPath.row];
	CLLocationCoordinate2D zoomLocation;
	if ([text isEqualToString:@"Tempe"]) {
		NSLog(@"Tempe");
		zoomLocation.latitude = 33.415869;
		zoomLocation.longitude = -111.932702;
	} else if ([text isEqualToString:@"West"]) {
		NSLog(@"West");
		zoomLocation.latitude = 33.608753;
		zoomLocation.longitude = -112.159606;
	} else if ([text isEqualToString:@"Polytechnic"]) {
		NSLog(@"Poly");
		zoomLocation.latitude = 33.300105;
		zoomLocation.longitude = -111.680978;
	} else {
		NSLog(@"Downtown");
		zoomLocation.latitude = 33.453591;
		zoomLocation.longitude = -112.073346;
	}
	MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
	MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
	self.mapView.currentLocation = (CLLocationCoordinate2D)zoomLocation;
	[self dismissViewControllerAnimated:YES completion:nil];
}*/
@end
