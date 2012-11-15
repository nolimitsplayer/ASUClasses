//
//  XMLParser.h
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 11/14/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLClass.h"

@class XMLClass;
@interface XMLParser : NSObject <NSXMLParserDelegate> {
	NSMutableString *currentElement;
	NSMutableArray *classesList;
	XMLClass *currentClass;
}

@property (nonatomic, retain) NSMutableArray *classesList;

- (XMLParser *)initXMLParser;
- (NSMutableArray *)getClassList;

@end
