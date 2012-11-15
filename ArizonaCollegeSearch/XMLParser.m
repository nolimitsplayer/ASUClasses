//
//  XMLParser.m
//  ArizonaCollegeSearch
//
//  Created by Ryan Dougherty on 11/14/12.
//  Copyright (c) 2012 redoughe. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

@synthesize currentClass;
@synthesize currentElement;
@synthesize classes;
@synthesize parser;

- (id)loadXMLByURL:(NSString *)urlString {
	self.classes = [[NSMutableArray alloc] init];
	NSURL *url = [NSURL URLWithString:urlString];
	NSData *data = [[NSData alloc] initWithContentsOfURL:url];
	self.parser = [[NSXMLParser alloc] initWithData:data];
	self.parser.delegate = self;
	[self.parser parse];
	return self;
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementname isEqualToString:@"class"]) {
        self.currentClass = [[XMLClass alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	if ([elementName isEqualToString:@"title"]) {
		self.currentClass.title = self.currentElement;
	} if ([elementName isEqualToString:@"number"]) {
		self.currentClass.number = self.currentElement;
	} if ([elementName isEqualToString:@"semester"]) {
		self.currentClass.semester = self.currentElement;
	} if ([elementName isEqualToString:@"year"]) {
		self.currentClass.semester = self.currentElement;
	} if ([elementName isEqualToString:@"professor"]) {
		self.currentClass.professor = self.currentElement;
	} if ([elementName isEqualToString:@"startTime"]) {
		self.currentClass.startTime = self.currentElement;
	} if ([elementName isEqualToString:@"endTime"]) {
		self.currentClass.endTime = self.currentElement;
	} if ([elementName isEqualToString:@"id"]) {
		self.currentClass.classID = self.currentElement;
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	self.currentElement = (NSMutableString *)[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
