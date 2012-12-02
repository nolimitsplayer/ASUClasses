//
//  HTMLClassesViewController.m
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 11/24/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "HTMLClassesViewController.h"

@implementation HTMLClassesViewController

@synthesize url = _url;
@synthesize arrayOfClassNumbersOfficial = _arrayOfClassNumbersOfficial;
@synthesize arrayOfCourseNamesOfficial = _arrayOfCourseNamesOfficial;
@synthesize arrayOfCourseTitlesOfficial = _arrayOfCourseTitlesOfficial;
@synthesize arrayOfNumberOfUnitsOfficial = _arrayOfNumberOfUnitsOfficial;
@synthesize arrayOfDatesOfficial = _arrayOfDatesOfficial;
@synthesize arrayOfStartTimesOfficial = _arrayOfStartTimesOfficial;
@synthesize arrayOfEndTimesOfficial	= _arrayOfEndTimesOfficial;
@synthesize arrayOfLocationsOfficial = _arrayOfLocationsOfficial;

- (void)viewDidLoad {
    [super viewDidLoad];
	if (self.arrayOfClassNumbersOfficial == nil) {
		self.arrayOfClassNumbersOfficial = [[NSMutableArray alloc] init];
	} if (self.arrayOfCourseNamesOfficial == nil) {
		self.arrayOfCourseNamesOfficial = [[NSMutableArray alloc] init];
	} if (self.arrayOfCourseTitlesOfficial == nil) {
		self.arrayOfCourseTitlesOfficial = [[NSMutableArray alloc] init];
	} if (self.arrayOfCourseNamesOfficial == nil) {
		self.arrayOfClassNumbersOfficial = [[NSMutableArray alloc] init];
	} if (self.arrayOfNumberOfUnitsOfficial == nil) {
		self.arrayOfNumberOfUnitsOfficial = [[NSMutableArray alloc] init];
	} if (self.arrayOfStartTimesOfficial == nil) {
		self.arrayOfStartTimesOfficial = [[NSMutableArray alloc] init];
	} if (self.arrayOfEndTimesOfficial == nil) {
		self.arrayOfEndTimesOfficial = [[NSMutableArray alloc] init];
	} if (self.arrayOfLocationsOfficial == nil) {
		self.arrayOfLocationsOfficial = [[NSMutableArray alloc] init];
	}
	NSMutableArray *arrayOfClassNumbers = [[NSMutableArray alloc] init];
	NSMutableArray *arrayOfCourseNames = [[NSMutableArray alloc] init];
	NSMutableArray *arrayOfCourseTitles = [[NSMutableArray alloc] init];
	NSMutableArray *arrayOfNumberOfUnits = [[NSMutableArray alloc] init];
	NSMutableArray *arrayOfDates = [[NSMutableArray alloc] init];
	NSMutableArray *arrayOfStartTimes = [[NSMutableArray alloc] init];
	NSMutableArray *arrayOfEndTimes = [[NSMutableArray alloc] init];
	NSMutableArray *arrayOfLocations = [[NSMutableArray alloc] init];
	NSData *htmlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.url]];
	NSLog(@"%@", self.url);
	TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
	NSArray *classNumberElements = [xpathParser searchWithXPathQuery:@"//td[@class='classNbrColumnValue']//a"];	//class #
	NSArray *courseNameElements = [xpathParser searchWithXPathQuery:@"//td[@class='subjectNumberColumnValue']"];	//course names
	NSArray *courseTitleElements = [xpathParser searchWithXPathQuery:@"//td[@class='titleColumnValue']"];			//class title
	NSArray *numberOfUnitsElements = [xpathParser searchWithXPathQuery:@"//td[@class='hoursColumnValue']"];			//number of units
	NSArray *datesElements = [xpathParser searchWithXPathQuery:@"//td[@class='dayListColumnValue']"];				//days of class
	NSArray *startTimeElements = [xpathParser searchWithXPathQuery:@"//td[@class='startTimeDateColumnValue']"];		//start time
	NSArray *endTimeElements = [xpathParser searchWithXPathQuery:@"//td[@class='endTimeDateColumnValue']"];			//end time
	NSArray *locationElements = [xpathParser searchWithXPathQuery:@"//a[@class='locationtip']"];					//location
	for (int i=0; i < 2; i++) {
		TFHppleElement *classNumberElement = [classNumberElements objectAtIndex:i];
		TFHppleElement *courseNameElement = [courseNameElements objectAtIndex:i];
		TFHppleElement *courseTitleElement = [courseTitleElements objectAtIndex:i];
		TFHppleElement *numberOfUnitsElement = [numberOfUnitsElements objectAtIndex:i];
		TFHppleElement *datesElement = [datesElements objectAtIndex:i];
		TFHppleElement *startTimeElement = [startTimeElements objectAtIndex:i];
		TFHppleElement *endTimeElement = [endTimeElements objectAtIndex:i];
		TFHppleElement *locationElement = [locationElements objectAtIndex:i];
		NSString *trimmedClassNumber = [[[classNumberElement firstChild] content] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		NSString *trimmedCourseName = [[[courseNameElement firstChild] content] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		NSString *trimmedCourseTitle = [[[courseTitleElement firstChild] content] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		NSString *trimmedNumberOfHours = [[[numberOfUnitsElement firstChild] content] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		NSString *trimmedDates = [[[datesElement firstChild] content] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		NSString *trimmedStartTime = [[[startTimeElement firstChild] content] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		NSString *trimmedEndTime = [[[endTimeElement firstChild] content] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		NSString *trimmedLocation = [[[locationElement firstChild] content] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		[arrayOfClassNumbers addObject:trimmedClassNumber];
		[arrayOfCourseNames addObject:trimmedCourseName];
		[arrayOfCourseTitles addObject:trimmedCourseTitle];
		[arrayOfNumberOfUnits addObject:trimmedNumberOfHours];
		[arrayOfDates addObject:trimmedDates];
		[arrayOfStartTimes addObject:trimmedStartTime];
		[arrayOfEndTimes addObject:trimmedEndTime];
		[arrayOfLocations addObject:trimmedLocation];
		NSLog(@"%@", [arrayOfClassNumbers objectAtIndex:i]);
		NSLog(@"%@", [arrayOfCourseNames objectAtIndex:i]);
		NSLog(@"%@", [arrayOfCourseTitles objectAtIndex:i]);
		NSLog(@"%@", [arrayOfNumberOfUnits objectAtIndex:i]);
		NSLog(@"%@", [arrayOfDates objectAtIndex:i]);
		NSLog(@"%@", [arrayOfStartTimes objectAtIndex:i]);
		NSLog(@"%@", [arrayOfEndTimes objectAtIndex:i]);
		NSLog(@"%@", [arrayOfLocations objectAtIndex:i]);
	}
	
	self.arrayOfClassNumbersOfficial = arrayOfClassNumbers;
	self.arrayOfCourseNamesOfficial = arrayOfCourseNames;
	self.arrayOfCourseTitlesOfficial = arrayOfCourseTitles;
	self.arrayOfDatesOfficial = arrayOfDates;
	self.arrayOfEndTimesOfficial = arrayOfEndTimes;
	self.arrayOfLocationsOfficial = arrayOfLocations;
	self.arrayOfNumberOfUnitsOfficial = arrayOfNumberOfUnits;
	self.arrayOfStartTimesOfficial = arrayOfStartTimes;
	self.navigationItem.title = [self.arrayOfCourseNamesOfficial objectAtIndex:0];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayOfClassNumbersOfficial count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"WebCollegeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //cell.textLabel.text = [self.arrayOfClassNumbersOfficial objectAtIndex:indexPath.row];
	NSString *string = [NSString stringWithFormat:@"%@ %@-%@",
                                                                        //[self.arrayOfClassNumbersOfficial objectAtIndex:indexPath.row],
																		//[self.arrayOfCourseNamesOfficial objectAtIndex:indexPath.row],
																		//[self.arrayOfCourseTitlesOfficial objectAtIndex:indexPath.row],
																		[self.arrayOfDatesOfficial objectAtIndex:indexPath.row],
																		//[self.arrayOfNumberOfUnitsOfficial objectAtIndex:indexPath.row],
																		[self.arrayOfStartTimesOfficial objectAtIndex:indexPath.row],
																		[self.arrayOfEndTimesOfficial objectAtIndex:indexPath.row]];
	cell.textLabel.text = string;
	NSLog(@"%@", cell.textLabel.text);
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
