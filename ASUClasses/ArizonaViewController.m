//
//  ArizonaViewController.m
//  ASUClasses
//
//  Created by Ryan Dougherty on 10/28/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "ArizonaViewController.h"
#import "UofAViewController.h"
#import "ASUViewController.h"

@interface ArizonaViewController ()

@end

@implementation ArizonaViewController

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.arizonaArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ArizonaCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.arizonaArray objectAtIndex:indexPath.row];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"ArizonaCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
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
