//
//  CollegeTableViewController.m
//  ASUClasses
//
//  Created by redoughe on 10/27/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "CollegeTableViewController.h"
#import "ASUViewController.h"
#import "UofAViewController.h"

@implementation CollegeTableViewController
@synthesize collegeNames = _collegeNames;
//@synthesize secondCopyOfNames = _secondCopyOfNames;

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.collegeNames == nil) {
        self.collegeNames = [[NSMutableArray alloc]init];
    }
    NSString *file = [[NSBundle mainBundle] pathForResource:@"ListOfColleges" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:file encoding:NSASCIIStringEncoding error:nil];
    NSArray *collegeArray = [content componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    collegeArray = [collegeArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    self.collegeNames = collegeArray;
    //self.collegeNames = [self.collegeNames sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    /*userIsSearching = NO;
    self.secondCopyOfNames = self.collegeNames;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:collegeArray forKey:@"Colleges"];
    [self.collegeNames addObject:dictionary];*/
}


#pragma mark - Table view data source

/*- (void)searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
    userIsSearching = YES;
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
    [[self.secondCopyOfNames mutableCopy]removeAllObjects];
    if ([searchText length] != 0) {
        userIsSearching = YES;
        self.tableView.scrollEnabled = YES;
        [self searchTableView];
    } else {
        userIsSearching = NO;
        self.tableView.scrollEnabled = NO;
    }
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    [self searchTableView];
}

- (void)searchTableView {
    NSString *text = searchBar.text;
    NSMutableArray *searchArray = [[NSMutableArray alloc]init];
    for (NSDictionary *dictionary in self.collegeNames) {
        NSArray *array = [dictionary objectForKey:@"Colleges"];
        [searchArray addObjectsFromArray:array];
    }
    for (NSString *sTemp in searchArray) {
        NSRange titleResultsRange = [sTemp rangeOfString:text options:NSCaseInsensitiveSearch];
        if (titleResultsRange.length != 0) {
            [self.secondCopyOfNames addObject:sTemp];
        }
    }
    searchArray = nil;
}

- (void)doneSearching:(id)sender {
    searchBar.text = @"";
    [searchBar resignFirstResponder];
    userIsSearching = NO;
    self.tableView.scrollEnabled = YES;
    [self.tableView reloadData];
}*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.collegeNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CollegeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.collegeNames objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"CollegeCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	NSString *text = [self.collegeNames objectAtIndex:indexPath.row];
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
	//} else if ([segue.identifier isEqualToString:@"ArizonaStateUniversity"]) {
	//	ASUViewController *avc = (ASUViewController *)[segue destinationViewController];
	}
        //NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
        //ASUViewController *avc = [segue destinationViewController];
        //[segue.destinationViewController performSegueWithIdentifier:@"ArizonaStateUniversitySegue" sender:self];
}

@end