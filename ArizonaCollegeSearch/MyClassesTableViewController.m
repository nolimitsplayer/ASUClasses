//
//  MyClassesTableViewController.m
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 10/29/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "MyClassesTableViewController.h"

@implementation MyClassesTableViewController

@synthesize myClasses = _myClasses;

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.myClasses == nil) {
        self.myClasses = [[NSMutableArray alloc]init];
    }
	
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	NSString *xmlPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"MyClasses.xml"];
	NSURL *xmlURL = [NSURL fileURLWithPath:xmlPath];
	NSXMLParser *parser1 = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	XMLParser *xmlParser = [[XMLParser alloc] initXMLParser];
	[parser1 setDelegate:xmlParser];
	BOOL success = [parser1 parse];
	if (!success) {
		NSLog(@"Error");
		return;
	}
	self.myClasses = [xmlParser getClassList];
	
	
	//NSString *content = [NSString stringWithContentsOfFile:xmlFile encoding:NSASCIIStringEncoding error:nil];
   // NSString *file1 = [[NSBundle mainBundle] pathForResource:@"MyClasses" ofType:@"txt"];
    //NSString *content1 = [NSString stringWithContentsOfFile:file1 encoding:NSASCIIStringEncoding error:nil];
	//NSLog(@"%@", file1);
    //NSArray *myClassesArray = [content1 componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    //myClassesArray = [myClassesArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //self.myClasses = myClassesArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.myClasses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MyClassesCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	
	XMLClass *currentClass = [self.myClasses objectAtIndex:indexPath.row];
    cell.textLabel.text = [currentClass title];
	NSLog(@"%@", [currentClass title]);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"MyClassesCell";
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
	NSString *text = [self.myClasses objectAtIndex:indexPath.row];
	NSLog(@"%@ selected", text);
	if ([text isEqualToString:@"Arizona, University of"]) {
		[self performSegueWithIdentifier:@"UniversityofArizona" sender:self];
	} else if ([text isEqualToString:@"Arizona State University"]) {
		[self performSegueWithIdentifier:@"ArizonaStateUniversity" sender:self];
	}
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		NSMutableArray *array = [self.myClasses mutableCopy];
		[array removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
		self.myClasses = array;
	}
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
	NSMutableArray *array = [self.myClasses mutableCopy];
	NSString *string = [self.myClasses objectAtIndex:destinationIndexPath.row];
	[array removeObjectAtIndex:sourceIndexPath.row];
	[array insertObject:string atIndex:destinationIndexPath.row];
    self.myClasses = array;
}

- (void)addButtonToCell {
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(40, 60, 60, 24);
	button.tag = 1234;
	[button setTitle:@"Add" forState:UIControlStateNormal];
	[self.tableView addSubview:button];
}

@end
