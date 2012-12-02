//
//  HTMLClassesViewController.h
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 11/24/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TFHpple.h"
#import "TFHppleElement.h"
#import "XPathQuery.h"

@interface HTMLClassesViewController : UITableViewController

@property (weak, nonatomic) NSString *url;
@property (strong, nonatomic) NSMutableArray *arrayOfClassNumbersOfficial;
@property (strong, nonatomic) NSMutableArray *arrayOfCourseNamesOfficial;
@property (strong, nonatomic) NSMutableArray *arrayOfCourseTitlesOfficial;
@property (strong, nonatomic) NSMutableArray *arrayOfNumberOfUnitsOfficial;
@property (strong, nonatomic) NSMutableArray *arrayOfDatesOfficial;
@property (strong, nonatomic) NSMutableArray *arrayOfStartTimesOfficial;
@property (strong, nonatomic) NSMutableArray *arrayOfEndTimesOfficial;
@property (strong, nonatomic) NSMutableArray *arrayOfLocationsOfficial;
@end
