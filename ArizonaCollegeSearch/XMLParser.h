//
//  XMLParser.h
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 11/14/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class XMLClass;
@interface XMLParser : NSObject {
	NSMutableString *currentElementValue;
	XMLClass *aClass;
	NSMutableArray *array;
}

- (NSMutableArray *)getClassList;

@end

