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
@synthesize searchButton = _searchButton;
@synthesize listOfClassAbbreviations = _listOfClassAbbreviations;
@synthesize openSwitch = _openSwitch;
@synthesize pickerView = _pickerView;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.classAbbreviation.enabled = NO;
    UITapGestureRecognizer *pook = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:pook];
	self.listOfClassAbbreviations = [[NSArray alloc] initWithObjects:@"CSE",@"MAT", @"3", @"3", @"3", @"3", @"3", @"3", @"3", @"3", nil];

}

- (IBAction)searchButtonClicked:(id)sender {
    NSString *numberText = self.classNumber.text;
	if ([numberText length] > 3) {
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

- (IBAction)showPicker:(UITextField *)sender {
	self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 600, 320, 200)];
	self.pickerView.delegate = self;
	self.pickerView.showsSelectionIndicator = YES;
	[self.view addSubview:self.pickerView];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	NSUInteger numRows = 5;
	return numRows;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [@"" stringByAppendingFormat:@"%d", row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
	return 300;
}

- (void)dismissKeyboard {
	[self.classAbbreviation resignFirstResponder];
	[self.classNumber resignFirstResponder];
}

- (NSString *)stateOfHonorsSwitch {
	if (self.honorsSwitch.on == YES) {
		return @"T";
	} else {
		return @"F";
	}
}

- (NSString *)stateOfOpenSwitch {
	if (self.openSwitch.on == YES) {
		return @"open";
	} else {
		return @"all";
	}
}

- (NSString *)classYear {
	/*NSDate *date = [NSDate date];
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit;
	NSDateComponents *components = [calendar components:unitFlags fromDate:date];
	NSInteger month = components.month;
	NSInteger year = components.year;
	NSString *monthString = [NSString stringWithFormat:@"%d", month];
	NSString *yearString = [NSString stringWithFormat:@"%d", year];
	[yearString stringByReplacingOccurrencesOfString:@"0"
										   withString:@""
											  options:NULL
												range:NSMakeRange(0, 2)];
	
	*/return @"2131";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"WebSegue"]) {
		WebViewController *wvc = (WebViewController *)[segue destinationViewController];
		NSArray *array = [[NSArray alloc] initWithObjects:@"https://webapp4.asu.edu/catalog/classlist?s=", self.classAbbreviation.text, @"&n=", self.classNumber.text, @"&t=", [self classYear], @"&e=", [self stateOfOpenSwitch], @"&hon=", [self stateOfHonorsSwitch], nil];
		wvc.url = [array componentsJoinedByString:@""];
	}
	//set Map Kit String here
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

@end
