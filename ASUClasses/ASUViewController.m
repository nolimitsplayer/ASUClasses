//
//  ViewController.m
//  ASUClasses
//
//  Created by redoughe on 10/25/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "ASUViewController.h"
#import "WebViewController.h"

@implementation ASUViewController

@synthesize classAbbreviation = _classAbbreviation;
@synthesize classNumber = _classNumber;
@synthesize honorsSwitch = _honorsSwitch;
//@synthesize classAbbreviationList = _classAbbreviationList;
//@synthesize picker = _picker;

- (void)viewDidLoad {
   UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
	/*adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
	adView.frame = CGRectOffset(adView.frame, 0, -50);
	adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifier320x50];
	adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
	[self.view addSubview:adView];
	adView.delegate=self;
	self.bannerIsVisible=NO;*/
	
	//self.classAbbreviationList = [[NSArray alloc] initWithObjects:@"Test1", @"Test2", nil];
}

/*- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
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
*/


/*- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [self.classAbbreviationList count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [self.classAbbreviationList objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	NSString *text = [self.classAbbreviationList objectAtIndex:row];
	self.classAbbreviation.text = text;
}*/

- (void)dismissKeyboard {
    [self.classAbbreviation resignFirstResponder];
    [self.classNumber resignFirstResponder];
}

/*- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	
	return NO;
	
}*/



- (IBAction)searchButtonClicked:(id)sender {
    NSString *classText = self.classAbbreviation.text;
    NSString *numberText = self.classNumber.text;
    if ([classText length] > 3) {
        UIAlertView *alertNotCorrectClassLength = [[UIAlertView alloc]initWithTitle:@"Wrong Class Length"
                                                                            message:@"Class only has 3 letters!"
                                                                           delegate:nil
                                                                  cancelButtonTitle:@"Ok"
                                                                  otherButtonTitles:nil];
        [alertNotCorrectClassLength show];
    } if ([numberText length] > 3) {
        UIAlertView *alertNotCorrectNumberLength = [[UIAlertView alloc]initWithTitle:@"Wrong Number Length"
                                                                             message:@"Class number only has 3 numbers!"
                                                                            delegate:nil
                                                                   cancelButtonTitle:@"Ok"
                                                                   otherButtonTitles:nil];
        [alertNotCorrectNumberLength show];
        
    } if (![numberText intValue]) {
        UIAlertView *alertNotInteger = [[UIAlertView alloc]initWithTitle:@"Not An Integer"
                                                                 message:@"Class number only can be an integer!"
                                                                delegate:nil
                                                       cancelButtonTitle:@"Ok"
                                                       otherButtonTitles:nil];
        [alertNotInteger show];
        
    }
}

- (NSString *)stateOfHonorsSwitch {
	if (self.honorsSwitch.on == YES) {
		return @"T";
	} else {
		return @"F";
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ArizonaStateUniversityWeb"]) {
		WebViewController *wvc = (WebViewController *)[segue destinationViewController];
		NSArray *array = [[NSArray alloc] initWithObjects:@"https://webapp4.asu.edu/catalog/classlist?s=", self.classAbbreviation.text, @"&n=", self.classNumber.text, @"&t=2131&e=open&hon=", [self stateOfHonorsSwitch], nil];
		wvc.url = [array componentsJoinedByString:@""];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

@end
