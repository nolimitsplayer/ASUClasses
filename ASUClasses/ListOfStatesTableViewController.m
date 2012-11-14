//
//  ListOfStatesTableViewController.m
//  ASUClasses
//
//  Created by Ryan Dougherty on 10/28/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "ListOfStatesTableViewController.h"
#import "CollegeTableViewController.h"
#import "ArizonaViewController.h"

@interface ListOfStatesTableViewController ()

@end

@implementation ListOfStatesTableViewController

@synthesize statesNames = _statesNames;
@synthesize bannerIsVisible = _bannerIsVisible;

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.statesNames == nil) {
        self.statesNames = [[NSMutableArray alloc]init];
    }
    NSString *file = [[NSBundle mainBundle] pathForResource:@"ListOfStates" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:file encoding:NSASCIIStringEncoding error:nil];
    NSArray *statesArray = [content componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	statesArray = [statesArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    self.statesNames = statesArray;
	//load ad
	adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
	adView.frame = CGRectOffset(adView.frame, 0, -50);
	adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifier320x50];
	adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
	[self.view addSubview:adView];
	adView.delegate=self;
	self.bannerIsVisible=NO;
	
	
	
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
	if (!self.bannerIsVisible)
	{
		[UIView beginAnimations:@"animateAdBannerOn" context:NULL];
		// banner is invisible now and moved out of the screen on 50 px
		banner.frame = CGRectOffset(banner.frame, 0, 50);
		[UIView commitAnimations];
		self.bannerIsVisible = YES;
	}
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
	if (self.bannerIsVisible)
	{
		[UIView beginAnimations:@"animateAdBannerOff" context:NULL];
		// banner is visible and we move it out of the screen, due to connection issue
		banner.frame = CGRectOffset(banner.frame, 0, -50);
		[UIView commitAnimations];
		self.bannerIsVisible = NO;
	}
}
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
	NSLog(@"Banner view is beginning an ad action");
	BOOL shouldExecuteAction = YES;
	if (!willLeave && shouldExecuteAction)
    {
		// stop all interactive processes in the app
		// [video pause];
		// [audio pause];
    }
	return shouldExecuteAction;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
	// resume everything you've stopped
	// [video resume];
	// [audio resume];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.statesNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StateCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.statesNames objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"StateCell";
	NSString *text = [self.statesNames objectAtIndex:indexPath.row];
	NSLog(@"%@ selected", text);
	if ([text isEqualToString:@"All States"]) {
		[self performSegueWithIdentifier:@"AllStates" sender:self];
	} else if ([text isEqualToString:@"Arizona"]) {
		[self performSegueWithIdentifier:@"ArizonaStateSegue" sender:self];
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"AllStates"]) {
        CollegeTableViewController *uoavc = (CollegeTableViewController *)[segue destinationViewController];
		//} else if ([segue.identifier isEqualToString:@"ArizonaStateUniversity"]) {
		//	ASUViewController *avc = (ASUViewController *)[segue destinationViewController];
	} else if ([[segue identifier] isEqualToString:@"ArizonaStateSegue"]) {
		ArizonaViewController *avc = (ArizonaViewController *)[segue destinationViewController];
	}
	//NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
	//ASUViewController *avc = [segue destinationViewController];
	//[segue.destinationViewController performSegueWithIdentifier:@"ArizonaStateUniversitySegue" sender:self];
}


@end
