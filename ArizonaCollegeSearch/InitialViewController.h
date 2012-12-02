//
//  InitialViewController.h
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 10/29/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"

@interface InitialViewController : UIViewController
- (IBAction)classSearchButtonClicked:(id)sender;
- (IBAction)myClassesButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *classSearchButton;

@end
