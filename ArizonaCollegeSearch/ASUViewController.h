//
//  ASUViewController.h
//  ArizonaCollegeSearch
//
//  Created by redoughe on 10/28/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ASUViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *classAbbreviation;
@property (weak, nonatomic) IBOutlet UISwitch *honorsSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *openSwitch;
@property (weak, nonatomic) IBOutlet UITextField *classNumber;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)searchButtonClicked:(id)sender;

@end