//
//  ArizonaViewController.m
//  ASUClasses
//
//  Created by Ryan Dougherty on 10/28/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "ListOfCollegesTableViewController.h"
#import "ASUViewController.h"
#import "UofAViewController.h"

@implementation ListOfCollegesTableViewController

@synthesize arizonaArray = _arizonaArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.arizonaArray == nil) {
        self.arizonaArray = [[NSMutableArray alloc]init];
    }
    NSString *file = [[NSBundle mainBundle] pathForResource:@"ListOfAZColleges" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:file encoding:NSASCIIStringEncoding error:nil];
    NSArray *arizonaArray1 = [content componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    arizonaArray1 = [arizonaArray1 sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    self.arizonaArray = arizonaArray1;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arizonaArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CollegeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	if (indexPath.row == 1) {
		cell.userInteractionEnabled = NO;
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.textLabel.enabled = NO;
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
    cell.textLabel.text = [self.arizonaArray objectAtIndex:indexPath.row];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"CollegeCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	//UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	//[button addTarget:self
	//		   action:@selector()
	 //forControlEvents:UIControlEventTouchDown];
	//[button setTitle:@"Show View" forState:UIControlStateNormal];
	//button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
	//[cell.contentView addSubview:button];
	NSString *text = [self.arizonaArray objectAtIndex:indexPath.row];
	NSLog(@"%@ selected", text);
	if ([text isEqualToString:@"Arizona, University of"]) {
		[self performSegueWithIdentifier:@"UniversityofArizona" sender:self];
	} else if ([text isEqualToString:@"Arizona State University"]) {
		[self performSegueWithIdentifier:@"ArizonaStateUniversity" sender:self];
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"UniversityofArizona"]) {
        UofAViewController *uoavc = (UofAViewController *)[segue destinationViewController];
	} else if ([[segue identifier] isEqualToString:@"ArizonaStateUniversity"]) {
		ASUViewController *avc = (ASUViewController *)[segue destinationViewController];
	}
}

@end
