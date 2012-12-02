//
//  InitialViewController.m
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 10/29/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "InitialViewController.h"

@implementation InitialViewController

@synthesize classSearchButton = _classSearchButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	self.classSearchButton = [[Button alloc] initWithFrame:CGRectMake(80, 60, 150, 100)];
}

- (IBAction)classSearchButtonClicked:(id)sender {
}

- (IBAction)myClassesButtonClicked:(id)sender {
}
@end
