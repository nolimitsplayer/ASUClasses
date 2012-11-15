//
//  XMLClass.h
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 11/14/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLClass : NSObject {
	NSString *title;
	NSString *number;
	NSString *semester;
	NSString *year;
	NSString *professor;
	NSString *startTime;
	NSString *endTime;
	NSString *classID;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSString *semester;
@property (nonatomic, retain) NSString *year;
@property (nonatomic, retain) NSString *professor;
@property (nonatomic, retain) NSString *startTime;
@property (nonatomic, retain) NSString *endTime;
@property (nonatomic, retain) NSString *classID;

@end
