//
//  MyClassesTableViewController.h
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 10/29/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLClass.h"
#import "XMLParser.h"

@interface MyClassesTableViewController : UITableViewController {
	XMLParser *parser;
	NSArray *myClasses;
}

@property (nonatomic, retain) NSArray *myClasses;
@property (nonatomic, retain) XMLParser *parser;

@end
