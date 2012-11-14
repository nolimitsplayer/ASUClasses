//
//  UofAViewController.m
//  ASUClasses
//
//  Created by redoughe on 10/27/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "UofAViewController.h"

@implementation UofAViewController
@synthesize classAbbreviation = _classAbbreviation;
@synthesize classNumber = _classNumber;

- (void)viewDidLoad {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)dismissKeyboard {
    [self.classAbbreviation resignFirstResponder];
    [self.classNumber resignFirstResponder];
}

@end
