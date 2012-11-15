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

@interface MyClassesTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate> {
	XMLParser *parser;
	NSMutableArray *myClasses;
}

@property (nonatomic, retain) NSMutableArray *myClasses;

@end
