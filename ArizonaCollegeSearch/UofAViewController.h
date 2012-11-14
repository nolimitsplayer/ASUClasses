//
//  UofAViewController.h
//  ASUClasses
//
//  Created by redoughe on 10/27/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UofAViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *classAbbreviation;
@property (weak, nonatomic) IBOutlet UITextField *classNumber;
- (void)dismissKeyboard;

@end
