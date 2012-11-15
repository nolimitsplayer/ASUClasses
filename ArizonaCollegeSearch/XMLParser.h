//
//  XMLParser.h
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 11/14/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLClass.h"

@interface XMLParser : NSObject <NSXMLParserDelegate> {
	NSMutableString *currentElement;
	NSMutableArray *classes;
	NSXMLParser *parser;
	XMLClass *currentClass;
}

@property (nonatomic, retain) NSMutableArray *classes;
@property (nonatomic, retain) NSMutableString *currentElement;
@property (nonatomic, retain) NSXMLParser *parser;
@property (nonatomic, retain) XMLClass *currentClass;
- (id)loadXMLByURL:(NSString *)urlString;

@end
