//
//  ListOfStatesTableViewController.h
//  ASUClasses
//
//  Created by Ryan Dougherty on 10/28/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ListOfStatesTableViewController : UITableViewController <ADBannerViewDelegate> {
	ADBannerView *adView;
	BOOL bannerIsVisible;
}

@property (nonatomic, retain) NSArray *statesNames;
@property (nonatomic, assign) BOOL bannerIsVisible;
@end
