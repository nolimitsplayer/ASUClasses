//
//  ASUViewController.h
//  ASUClasses
//
//  Created by redoughe on 10/26/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ASUViewController : UIViewController <ADBannerViewDelegate> {
	ADBannerView *adView;
	BOOL bannerIsVisible;
}

@property (weak, nonatomic) IBOutlet UITextField *classAbbreviation;
@property (weak, nonatomic) IBOutlet UISwitch *honorsSwitch;
@property (weak, nonatomic) IBOutlet UITextField *classNumber;
@property (nonatomic, assign) BOOL bannerIsVisible;
- (IBAction)searchButtonClicked:(id)sender;
- (void)dismissKeyboard;

@end
